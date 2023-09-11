<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Acara;
use App\User;
use Auth;
use Datatables;
use DB;
use Illuminate\Support\Facades\Storage;

class AcaraController extends Controller
{
    public function index(Request $request)
    {
        $d['user'] = Auth::user();
        $d['acara'] = Acara::all(['id','nama', 'kategori', 'tanggal', 'tempat', 'nomor', ]);
        dd($d);

        return view('acara', $d);
    }

    public function data(Request $request)
    {
        $data = Acara::orderBy('tanggal', 'DESC');
        $datatable = Datatables::of($data);
        return $datatable->addIndexColumn()->make(true);
    }

    public function show($id)
    {
        $d['acara'] = Acara::findOrFail($id);
        $d['peserta'] = User::whereIn($d['acara']->iduser)->get();
        dd($d);

        return view('acara', $d);
    }

    public function store(Request $request)
    {
        $user = Auth::user();
        // dd($request->all());
        try {
            DB::beginTransaction();

            $model = new Absensi();
            $model->fill($request->all());

            // Store untuk Izin
            if (isset($request->keterangan)) {
                $mime = $request->file('bukti_izin')->getMimeType();

                $pattern = '/[a-zA-Z]+$/';
                preg_match($pattern, $mime, $matches);
                $mime = $matches[0];

                $filename = date('dmY') . '_' . $user->id . '_izin.' . $mime;

                $path = Storage::putFileAs(
                    'photos/',
                    $request->file('bukti_izin'),
                    $filename
                );

                $url = url('/storage/app/photos/' . $filename);
                $model->status = 4;

                // Store Absen untuk Admin
            } elseif ($user->role == 'admin') {
                // Do Nothing (Gak perlu upload foto)
                $model->status = isset($request->jam_plg) ? 3 : 1;

                // Store untuk Absen
            } else {
                $mime = $request->file('geotag_msk')->getMimeType();

                $pattern = '/[a-zA-Z]+$/';
                preg_match($pattern, $mime, $matches);
                $mime = $matches[0];

                $filename = date('dmY') . '_' . $user->id . '_msk.' . $mime;

                $path = Storage::putFileAs(
                    'photos/',
                    $request->file('geotag_msk'),
                    $filename
                );

                $url = url('/storage/app/photos/' . $filename);

                $model->status = 1;
            }

            $model->fill([
                "iduser" => isset($request->iduser) ? $request->iduser : $user->id,
                "tanggal" => isset($request->tanggal) ? $request->tanggal : date('Y-m-d'),
                "geotag_msk" => isset($request->geotag_msk) ? $url : null,
                "bukti_izin" => isset($request->bukti_izin) ? $url : null,
            ]);

            $model->save();
            DB::commit();
            return back()->with('success', 'Berhasil Menyimpan.');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        } catch (\Throwable $e) {
            DB::rollBack();
            return back()->with('error', 'Gagal memproses.');
        }
    }

    public function update($id, Request $request)
    {
        $user = Auth::user();

        try {
            DB::beginTransaction();
            $model = Absensi::findOrFail($id);

            $mime = $request->file('geotag_plg')->getMimeType();

            $pattern = '/[a-zA-Z]+$/';
            preg_match($pattern, $mime, $matches);
            $mime = $matches[0];

            $filename = date('dmY') . '_' . $user->id . '_plg.' . $mime;

            $path = Storage::putFileAs(
                'photos/',
                $request->file('geotag_plg'),
                $filename
            );

            $url = url('/storage/app/photos/' . $filename);

            $model->fill([
                "jam_plg" => $request->jam_plg,
                "geotag_plg" => $url,
                "status" => 2,
            ]);

            $model->save();
            DB::commit();
            return back()->with('success', 'Berhasil Menyimpan.');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        } catch (\Throwable $e) {
            DB::rollBack();
            return back()->with('error', 'Gagal memproses.');
        }
    }

    // Untuk menampilkan Foto yang ada di Server
    public function showDestroy()
    {
        $files = Storage::files('photos');
        return view('showFoto', ['foto'=>$files]);
    }

    public function destroy(Request $request, $id)
    {
        try {
            $model = Absensi::where('status', 3)->get();

            foreach ($model as $unit) {
                Storage::delete(substr($unit->geotag_msk, 37));
                Storage::delete(substr($unit->geotag_plg, 37));
            }

            return back()->with('success', 'Berhasil menghapus');
        } catch (\Throwable $th) {
            return back()->with('error', 'Gagal menghapus');
        }
    }

    public function showVerifikasi(Request $request)
    {
        $d['tanggal'] = isset($request->tanggal) ? $request->tanggal : date('Y-m-d');
        $d['absen'] = Absensi::where('tanggal', $d['tanggal'])->get();
        $d['user'] = User::where('isactive', 1)->whereNotIn('id', [1, 2])->get(['id', 'nama']);

        return view('verifikasi', $d);
    }

    public function verifikasi(Request $request, $id)
    {
        $absen = Absensi::findOrFail($id);
        if ($absen->status == 4) {
            $absen->status = 5;
        } else {
            $absen->fill($request->all());
            $absen->status = 3;

            Storage::delete(substr($absen->geotag_msk, 37));
            Storage::delete(substr($absen->geotag_plg, 37));
        }
        $absen->save();

        return back();
    }
}