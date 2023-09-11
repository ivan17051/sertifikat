<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Datatables;
use App\UnitKerja;
use App\Golongan;
use App\Pegawai;
use App\Jabatan;
use App\Pendidikan;
use App\Penilaian;

class DataMasterController extends Controller
{
    public function unitKerja(){
        $unitKerja = UnitKerja::all();
        return view('master.unitKerja', ['unitkerja'=>$unitKerja]);
    }
    public function pegawai(){
        $jabatan = Jabatan::all();
        $golongan = Golongan::all();
        return view('masterData.pegawai', ['jabatan'=>$jabatan, 'golongan'=>$golongan]);
    }
    public function pegawaiData(Request $request){
        $data = Pegawai::with('penilaian')->get();
        
        $datatable = Datatables::of($data);
        $datatable->addIndexColumn()
            ->addColumn('idgolongan', function ($t){
                if(isset($t->penilaian))
                    return $t->penilaian->idgolongan;
                else
                    return '-';
            })
            ->addColumn('idjabatan', function ($t){
                if(isset($t->penilaian))
                    return $t->penilaian->idjabatan;
                else
                    return '-';
            })
            ->addColumn('pendidikan', function ($t) { 
                if(isset($t->penilaian))
                    return $t->penilaian->idpendidikan;
                else
                    return '-';
            })
            ->addColumn('unitkerja', function ($t) {
                if(isset($t->penilaian))
                    return $t->penilaian->idunitkerja;
                else
                    return '-';
            })
            ->rawColumns(['id','nip','nik','nama','nokartu','tempatlahir','tanggallahir', 'jeniskelamin', 'alamat', 'nohp', 'action']);
        
        $datatable->addColumn('action', function ($t) { 
                return '<a class="btn btn-sm btn-outline-warning" onclick="edit(this)" data-bs-toggle="modal" data-bs-target="#sunting"><i class="bi bi-pencil-square"></i></a>&nbsp'.
                '<a class="btn btn-sm btn-outline-success" onclick="show(this)"><i class="bi bi-box-arrow-up-right"></i></a>&nbsp'.
                '<a class="btn btn-sm btn-outline-danger" onclick="hapus(this)"><i class="bi bi-trash-fill"></i></a>&nbsp';
            });
        
        return $datatable->make(true); 
    }

    public function golongan(){
        $golongan = Golongan::all();
        return view('masterData.golongan', ['golongan'=>$golongan]);
    }
    public function jabatan(){
        $jabatan = Jabatan::all();
        return view('masterData.jabatan', ['jabatan'=>$jabatan]);
    }
    public function pendidikan(){
        $pendidikan = Pendidikan::all();
        return view('masterData.pendidikan', ['pendidikan'=>$pendidikan]);
    }

    public function searchPegawai(Request $request){
        $data=$request->input('query');
        // if($request->input('query')){
        $data = Pegawai::where('nama', 'like', '%' . strtolower($request->input('query')) . '%')
            ->orWhere('nip', 'like', '%' . strtolower($request->input('query')) . '%')
            ->limit(5)
            ->get();
        // }
        return response()->json($data);
    }
    public function storeUpdatePegawai(Request $request){
        $userId = Auth::id();
        
        $input = array_map('trim', $request->all());
        $validator = Validator::make($input, [
            'id' => 'nullable|exists:mpegawai,id',
            'nik' => 'string',
            'nip' => 'required|string',
            'nama' => 'required|string',
            'nokartu' => 'required|string',
            'tempatlahir' => 'required|string',
            'tanggallahir' => 'required|string',
            'jeniskelamin' => 'required|string',
            'alamat' => 'string',
            'nohp' => 'string',
            'status' => 'integer',
        ]);
        
        if ($validator->fails()) return back()->with('error','Gagal Menyimpan');
        try {
            $input = $validator->valid();
            if(isset($input['id'])){
                $model = Pegawai::firstOrNew([
                    'id' => $input['id']
                ]);
            }else{
                $model = new Pegawai();
            }
            $model->fill($input);    
        } catch (\Exception $e) {
            return back()->with('error', $e->getMessage());
        }
        
        $model->save();
        return back()->with('success','Berhasil Menyimpan');
    }
    public function deletePegawai(Request $request){
        try {
            $model=Pegawai::find($request->input('id'));
            $penilaian=Penilaian::select('id','idpegawai')->where('idpegawai', $request->input('id'))->first();
            if(isset($penilaian)){
                return back()->with('error','Pegawai Memiliki Histori Penilaian');
            }
            $model->delete();
            return back()->with('success','Berhasil menghapus');
        } catch (\Throwable $th) {
            return back()->with('error','Gagal menghapus');
        }
    }
    public function storeUpdateGolongan(Request $request){
        $userId = Auth::id();
        
        $input = array_map('trim', $request->all());
        $validator = Validator::make($input, [
            'id' => 'nullable|exists:mgolongan,id',
            'golongan' => 'required|string',
            'nama' => 'required|string',
        ]);
        if ($validator->fails()) return back()->with('error','Gagal Menyimpan');
        try {
            $input = $validator->valid();
            if(isset($input['id'])){
                $model = Golongan::firstOrNew([
                    'id' => $input['id']
                ]);
            }else{
                $model = new Golongan();
            }
            $model->fill($input);    
        } catch (\Exception $e) {
            return back()->with('error', $e->getMessage());
        }
        
        $model->save();
        return back()->with('success','Berhasil Menyimpan');
    }
    public function storeUpdateJabatan(Request $request){
        $userId = Auth::id();
        
        $input = array_map('trim', $request->all());
        $validator = Validator::make($input, [
            'id' => 'nullable|exists:mjabatan,id',
            'nama' => 'required|string',
            'detail' => 'required|string',
        ]);
        if ($validator->fails()) return back()->with('error','Gagal Menyimpan');
        try {
            $input = $validator->valid();
            if(isset($input['id'])){
                $model = Jabatan::firstOrNew([
                    'id' => $input['id']
                ]);
            }else{
                $model = new Jabatan();
            }
            $model->fill($input);    
        } catch (\Exception $e) {
            return back()->with('error', $e->getMessage());
        }
        
        $model->save();
        return back()->with('success','Berhasil Menyimpan');
    }
    public function storeUpdatePendidikan(Request $request){
        $userId = Auth::id();
        
        $input = array_map('trim', $request->all());
        $validator = Validator::make($input, [
            'id' => 'nullable|exists:mpendidikan,id',
            'nama' => 'required|string',
        ]);
        if ($validator->fails()) return back()->with('error','Gagal Menyimpan');
        try {
            $input = $validator->valid();
            if(isset($input['id'])){
                $model = Pendidikan::firstOrNew([
                    'id' => $input['id']
                ]);
            }else{
                $model = new Pendidikan();
            }
            $model->fill($input);    
        } catch (\Exception $e) {
            return back()->with('error', $e->getMessage());
        }
        
        $model->save();
        return back()->with('success','Berhasil Menyimpan');
    }
    
}
