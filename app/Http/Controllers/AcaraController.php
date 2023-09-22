<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Acara;
use App\User;
use App\Transaksi;
use App\Peserta;
use Auth;
use Datatables;
use DB;
use Illuminate\Support\Facades\Storage;

class AcaraController extends Controller
{
    public function index(Request $request)
    {
        $d['user'] = Auth::user();
        $d['acara'] = Acara::all();

        return view('master.acara', $d);
    }

    public function data(Request $request) {
        // Lebih cepet pake raw() src: https://geekflare.com/laravel-optimization/
        $data = Acara::raw('select * from macara');
    
        $datatable = Datatables::of($data);
        $datatable->rawColumns(['action']);
        
        $datatable->addColumn('action', function ($t) { 
                return '<a href="'.route('acara.show', ['id'=>'0','idacara'=>$t->id]).'" class="btn btn-info btn-sm" style="padding:5px;width:30px;" target="_blank" rel="noreferrer noopener"><i class="fas fa-external-link-alt"></i></a>&nbsp'.
                '<button type="button" class="btn btn-warning btn-sm" style="padding:5px;width:30px;" onclick="edit(this)"><i class="fas fa-pencil-alt"></i></button>&nbsp'.
                '<button type="button" class="btn btn-danger btn-sm" style="padding:5px;width:30px;" onclick="hapus(this)"><i class="fas fa-trash"></i></button>';
            });
        
        return $datatable->make(true); 
    }

    public function show($id, Request $request)
    {
        if($id==0 && !isset($request->idacara)){
            $d['acara'] = Acara::all(['id','nama','tgl_mulai','tgl_selesai']);
            $d['id'] = $id;
            
            return view('sertifikat', $d);

        } else {
            $d['id'] = $request->idacara;
            $d['acara'] = Transaksi::where('idacara', $request->idacara)->with('acara')->first();

            if(!isset($d['acara'])){
                
                $model = new Transaksi();
                $model->idacara = $request->idacara;
                $model->save();

                return redirect('/acara/0?idacara='.$request->idacara);
            }
            if(isset($d['acara']->iduser)){
                
                $d['user'] = explode(',', $d['acara']->iduser);
                $d['peserta'] = Peserta::whereIn('id', $d['user'])->get();

            } else {
                
                $d['user'] = [];
                $d['peserta'] = [];

            }
            
            $d['allPeserta'] = Peserta::whereNotIn('id', $d['user'])->get(['id','nama']);

        }
        
        return view('sertifikat', $d);
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