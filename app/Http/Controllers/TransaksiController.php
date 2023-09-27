<?php

namespace App\Http\Controllers;

use App\Transaksi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Storage;
use App\Peserta;

class TransaksiController extends Controller
{
    public function add($idacara, Request $request){
        
        try {
            $model = Transaksi::where('idacara', $idacara)->first();
            $add = implode(',',$request->addPeserta);
            $count = count($request->addPeserta);
            $model->iduser = $model->iduser.','.$add;
            $model->jumpeserta += $count;
            $model->save();
            
        } catch (\Throwable $th) {
            return back()->with('error','Gagal Menyimpan');
        }
        return back()->with('success','Berhasil Menyimpan');
    }

    public function cetak($idacara, Request $request){
        $d['acara'] = Transaksi::where('idacara', $idacara)->with('acara')->first();
        $d['peserta'] = Peserta::findOrFail($request->idpeserta);

        if($d['acara']->jns_sertif == 1) return view('cetak.cetak1', $d);
        elseif($d['acara']->jns_sertif == 2) return view('cetak.cetak2', $d);
        elseif($d['acara']->jns_sertif == 3) return view('cetak.cetak3', $d);
        
    }

    public function upload($id, Request $request){
        
        try {
            $data = Transaksi::findOrFail($id);

            $mime = $request->file('background')->getMimeType();

            $pattern = '/[a-zA-Z]+$/';
            preg_match($pattern, $mime, $matches);
            $mime = $matches[0];

            $filename = $id . '.' . $mime;

            $path = Storage::putFileAs(
                'photos/',
                $request->file('background'),
                $filename
            );

            $url = url('/storage/app/photos/' . $filename);
            
            $data->background = $url;
            $data->save();

        } catch (\Throwable $th) {
            return back()->with('error', 'Gagal mengupload');
        }
        return back()->with('success', 'Berhasil mengupload');
    }

    public function update($id, Request $request){
        try{
            $model = Transaksi::findOrFail($id);
            $model->tgl_surat = $request->tgl_surat;
            $model->no_surat = $request->no_surat;
            $model->jns_sertif = $request->jns_sertif;
            
            $model->save();

        } catch (\Throwable $th) {
            return back()->with('error', 'Gagal menyimpan');
        }
        
        return back()->with('success','Berhasil Menyimpan');
    }

    public function delete($idtrans, Request $request){
        
        try {
            $model=Transaksi::findOrFail($idtrans);
            $peserta = explode(',',$model->iduser);
            
            if (($key = array_search($request->idpeserta, $peserta)) !== false) {
                unset($peserta[$key]);
            }
            $model->jumpeserta -= 1;
            $model->iduser = implode(',',$peserta);
            $model->save();
            
            return back()->with('success','Berhasil menghapus');

        } catch (\Throwable $th) {
            return back()->with('error','Gagal menghapus');
        }
    }

    public function search(Request $request){
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
