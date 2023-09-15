<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use DB;
use App\Peserta;
use Datatables;

class PesertaController extends Controller
{
    public function index(){
        return view('master.peserta');
    }

    public function data(Request $request) {
        // Lebih cepet pake raw() src: https://geekflare.com/laravel-optimization/
        $data = Peserta::raw('select * from mpeserta');
        // dd($data);
        $datatable = Datatables::of($data);
        $datatable->rawColumns(['action']);
        
        $datatable->addColumn('action', function ($t) { 
                return '<a href="#" class="btn btn-info btn-link" style="padding:5px;" target="_blank" rel="noreferrer noopener"><i class="material-icons">launch</i></a>&nbsp'.
                '<button type="button" class="btn btn-warning btn-link" style="padding:5px;" onclick="edit(this)"><i class="material-icons">edit</i></button>&nbsp'.
                '<button type="button" class="btn btn-danger btn-link" style="padding:5px;" onclick="hapus(this)"><i class="material-icons">close</i></button>';
            });
        
        return $datatable->make(true); 
    }

    public function store(Request $request){
        $user = Auth::user();
        try {
            DB::beginTransaction();

            $model = new Peserta();
            $model->fill($request->all());
            $model->status = 0;
            $model->iduser = $user->id;
            
            $model->save();
            
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        }
        
        DB::commit();
        return back()->with('success', 'Berhasil Menyimpan.');
    }

    public function update(Request $request, $id){
        
        try {
            DB::beginTransaction();

            $model = Peserta::findOrFail($request->id);
            $model->fill($request->all());
            $model->status = 0;
            
            $model->save();
            
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        } 
        
        DB::commit();
        return back()->with('success', 'Berhasil Menyimpan.');
            
    }

    public function destroy($id){
        
        try {
            DB::beginTransaction();

            $model = Peserta::findOrFail($id);
            $model->delete();
            
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        } 
        
        DB::commit();
        return back()->with('success', 'Berhasil Menghapus.');
            
    }
}
