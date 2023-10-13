<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Storage;
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
        
        $data = DB::select(DB::raw('SELECT * FROM mpeserta WHERE isactive = 1'));
        
        $datatable = Datatables::of($data);
        $datatable->rawColumns(['action']);
        
        $datatable->addColumn('action', function ($t) { 
                return '<button type="button" class="btn btn-warning btn-sm" style="padding:5px;width:30px;" onclick="edit(this)"><i class="fas fa-pencil-alt"></i></button>&nbsp'.
                '<button type="button" class="btn btn-danger btn-sm" style="padding:5px;width:30px;" onclick="hapus(this)"><i class="fas fa-trash"></i></button>';
            });
        
        return $datatable->make(true); 
    }

    public function upload(Request $request){
        
        try {
            $data = Peserta::findOrFail($request->idpeserta);
            
            $mime = $request->file('pasfoto')->getMimeType();
            
            $pattern = '/[a-zA-Z]+$/';
            preg_match($pattern, $mime, $matches);
            $mime = $matches[0];

            $filename = $request->idpeserta . '.' . $mime;

                $path = Storage::putFileAs(
                    'pasfoto/',
                    $request->file('pasfoto'),
                    $filename
                );

            $url = url('/storage/app/pasfoto/' . $filename);
            
            $data->pasfoto = $url;
            
            $data->save();

        } catch (\Throwable $th) {
            return back()->with('error', 'Gagal mengupload');
        }
        return back()->with('success', 'Berhasil mengupload');
    }

    public function store(Request $request){

        try {
            DB::beginTransaction();     

            $model = new Peserta();
            $model->fill($request->all());

            $model->save();

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
            
            $model->save();
            
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        } 
        
        DB::commit();
        return back()->with('success', 'Berhasil Menyimpan.');
            
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
            return back()->with('error', $e->getMessage());
        } 
        
        DB::commit();
        return back()->with('success', 'Berhasil Menghapus.');
            
    }
}
