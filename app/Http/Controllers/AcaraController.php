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
            if($t->status==0){
                return '<a href="'.route('acara.show', ['id'=>'0','idacara'=>$t->id]).'" class="btn btn-info btn-sm" style="padding:5px;width:30px;" target="_blank" rel="noreferrer noopener"><i class="fas fa-external-link-alt"></i></a>&nbsp'.
                '<button type="button" class="btn btn-warning btn-sm" style="padding:5px;width:30px;" onclick="edit(this)"><i class="fas fa-pencil-alt"></i></button>&nbsp'.
                '<button type="button" class="btn btn-danger btn-sm" style="padding:5px;width:30px;" onclick="hapus(this)"><i class="fas fa-trash"></i></button>';
            } else {
                return '<a href="'.route('acara.show', ['id'=>'0','idacara'=>$t->id]).'" class="btn btn-info btn-sm" style="padding:5px;width:30px;" target="_blank" rel="noreferrer noopener"><i class="fas fa-external-link-alt"></i></a>&nbsp'.
                '<button type="button" class="btn btn-warning btn-sm" style="padding:5px;width:30px;" onclick="edit(this)"><i class="fas fa-pencil-alt"></i></button>&nbsp';
            }
                
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

                $acara = Acara::findOrFail($request->idacara);
                $acara->status = 1;
                $acara->save();

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
        try {
            DB::beginTransaction();

            $model = new Acara();
            $model->fill($request->all());
    
            $model->save();
            DB::commit();

            return back()->with('success', 'Berhasil Menyimpan.');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        } 
    }

    public function update($id, Request $request)
    {
        $user = Auth::user();

        try {
            DB::beginTransaction();
            $model = Absensi::findOrFail($id);

            $model->fill($request->all());

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

    public function destroy(Request $request, $id)
    {
        // dd($id, $request->all());
        try {
            $model = Acara::findOrFail($request->id);
            $model->delete();

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