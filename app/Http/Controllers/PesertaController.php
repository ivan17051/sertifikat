<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use DB;
use App\Peserta;

class PesertaController extends Controller
{
    public function index(){
        return view('master.peserta');
    }

    public function data(Request $request) {

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
