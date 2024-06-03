<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use Storage;
use DB;
use App\Peserta;
use App\Transaksi;
use App\Imports\PesertaImport;
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
            $this->flashError('Gagal Mengupload');
            return back();
        }
        $this->flashSuccess('Berhasil Mengupload');
        return back();
    }

    public function import_peserta(Request $request){
        
		// validasi
		$this->validate($request, [
			'file' => 'required|mimes:csv,xls,xlsx'
		]);
 
		// import data
        $import = new PesertaImport;
		Excel::import($import, $request->file('file')->store('files'));
        
        if(isset($request->idacara)){
            $ids = [];
            foreach($import->data as $unit){
                array_push($ids,$unit->id);
            }
            $idpeserta = substr(json_encode($ids),1,-1);
            
            $transaksi = Transaksi::where('idacara',$request->idacara)->first();
            $transaksi->iduser = $idpeserta;
            $transaksi->save();
        }
        
		// notifikasi dengan session
		\Session::flash('sukses','Data Siswa Berhasil Diimport!');
 
		// alihkan halaman kembali
		// return redirect(route('peserta.index'));
        return back();
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
