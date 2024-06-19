<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Penilaian;
use App\Acara;
use DB;
use Datatables;

class PenilaianController extends Controller
{
    public function index(){
        $d['acara'] = Acara::where('status',1)->get(['id','nama']);
        
        return view('master.penilaian', $d);
    }

    public function data(){
        // Lebih cepet pake raw() src: https://geekflare.com/laravel-optimization/
        $data = DB::select(DB::raw('SELECT * FROM mpenilaian'));
        
        $datatable = Datatables::of($data);
        $datatable->rawColumns(['action']);
        
        $datatable->addColumn('action', function ($t) { 
                return '<button type="button" class="btn btn-warning btn-sm" style="padding:5px;width:30px;" onclick="edit(this)"><i class="fas fa-pencil-alt"></i></button>&nbsp'.
                '<button type="button" class="btn btn-danger btn-sm" style="padding:5px;width:30px;" onclick="hapus(this)"><i class="fas fa-trash"></i></button>';
            });
        
        return $datatable->make(true); 
    }

    public function store(Request $request){

        try {
            DB::beginTransaction();     

            $model = new Peserta();
            $model->fill($request->all());

            $model->save();

            if(isset($model->pasfoto)){
                $mime = $request->file('pasfoto')->getMimeType();

                $pattern = '/[a-zA-Z]+$/';
                preg_match($pattern, $mime, $matches);
                $mime = $matches[0];
    
                $filename = $model->id . '.' . $mime;
    
                    $path = Storage::putFileAs(
                        'pasfoto/',
                        $request->file('pasfoto'),
                        $filename
                    );
    
                $url = url('/storage/app/pasfoto/' . $filename);
                $model->pasfoto = $url;
    
                $model->save();
            }
            
        } catch (\Exception $e) {
            DB::rollBack();
            $this->flashError($e->getMessage());
            return back();
        }
        
        DB::commit();
        $this->flashSuccess('Berhasil Menyimpan');
        return back();
    }

    public function update(Request $request, $id){
        
        try {
            DB::beginTransaction();

            $model = Peserta::findOrFail($request->id);
            $model->fill($request->all());
            
            $model->save();
            
        } catch (\Exception $e) {
            DB::rollBack();
            $this->flashError($e->getMessage());
            return back();
        } 
        
        DB::commit();
        $this->flashSuccess('Berhasil Menyimpan');
        return back();
            
    }

    public function destroy(Request $request, $id){
        // dd($request->all(),$id);
        try {
            DB::beginTransaction();

            $model = Peserta::findOrFail($request->id);
            $model->isactive = 0;
            $model->save();
            
        } catch (\Exception $e) {
            DB::rollBack();
            $this->flashError($e->getMessage());
            return back();
        } 
        
        DB::commit();
        $this->flashSuccess('Berhasil Menghapus');
        return back();
            
    }
}
