<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Acara;
use App\Transaksi;
use App\Peserta;
use Auth;
use Datatables;
use DB;

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
        $this->flashSuccess('Berhasil Get Data Acara');
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

            $this->flashSuccess('Berhasil Menyimpan');
            return back();
        } catch (\Exception $e) {
            DB::rollBack();
            $this->flashError($e->getMessage());
            return back();
        } 
    }

    public function update($id, Request $request)
    {
        $user = Auth::user();

        try {
            DB::beginTransaction();
            $model = Acara::findOrFail($request->id);

            $model->fill($request->all());

            $model->save();
            DB::commit();
            $this->flashSuccess('Berhasil Menyimpan');
            return back();
        } catch (\Exception $e) {
            DB::rollBack();
            $this->flashError($e->getMessage());
            return back();
        } catch (\Throwable $e) {
            DB::rollBack();
            $this->flashError('Gagal Memproses');
            return back();
        }
    }

    public function destroy(Request $request, $id)
    {
        try {
            $model = Acara::findOrFail($request->id);
            $model->delete();

            $this->flashSuccess('Berhasil Menghapus');
            return back();
        } catch (\Throwable $th) {
            $this->flashError('Gagal Menghapus');
            return back();
        }
    }
}