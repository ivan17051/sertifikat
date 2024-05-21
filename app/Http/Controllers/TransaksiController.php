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
            $this->flashError('Gagal Menyimpan');
            return back();
        }
        $this->flashSuccess('Berhasil Menyimpan');
        return back();
    }

    public function cetak($idacara, Request $request){
        
        if(!is_numeric($idacara) && base64_decode($idacara,true)) {
            $idacara = base64_decode($idacara,true);
        } else $idacara = $idacara;
        
        if (!is_numeric($request->idpeserta) && base64_decode($request->idpeserta,true)) {
            $idpeserta = base64_decode($request->idpeserta,true);
        } else $idpeserta = $request->idpeserta;
        
        $d['acara'] = Transaksi::where('idacara', $idacara)->with('acara')->first();
        $d['peserta'] = Peserta::findOrFail($idpeserta);

        if($d['acara']->jns_sertif == 1) return view('cetak.cetak1', $d);
        elseif($d['acara']->jns_sertif == 2) return view('cetak.cetak2', $d);
        elseif($d['acara']->jns_sertif == 3) return view('cetak.cetak3', $d);
        elseif($d['acara']->jns_sertif == 4) return view('cetak.cetak4', $d);
        elseif($d['acara']->jns_sertif == 5) return view('cetak.cetak5', $d);
        elseif($d['acara']->jns_sertif == 6) return view('cetak.cetak6', $d);
    }

    public function upload($id, Request $request){
        // dd($id, $request->all());
        try {
            $data = Transaksi::findOrFail($id);
            $key = $request->key;

            if($key == 1) $mime = $request->file('background')->getMimeType();
            elseif($key == 2) $mime = $request->file('background2')->getMimeType();

            $pattern = '/[a-zA-Z]+$/';
            preg_match($pattern, $mime, $matches);
            $mime = $matches[0];

            $filename = $id . '_' . $key . '.' . $mime;

            if($key == 1){
                $path = Storage::putFileAs(
                    'photos/',
                    $request->file('background'),
                    $filename
                );
            } elseif($key == 2){
                $path = Storage::putFileAs(
                    'photos/',
                    $request->file('background2'),
                    $filename
                );
            }

            $url = url('/storage/app/photos/' . $filename);
            
            if($key == 1) $data->background = $url;
            elseif($key == 2) $data->background2 = $url;
            $data->save();

        } catch (\Throwable $th) {
            $this->flashError('Gagal Menyimpan');
            return back();
        }
        $this->flashSuccess('Berhasil Mengupload');
        return back();
    }

    public function update($id, Request $request){
        try{
            $model = Transaksi::findOrFail($id);
            $model->tgl_surat = $request->tgl_surat;
            $model->no_surat = $request->no_surat;
            $model->jns_sertif = $request->jns_sertif;
            
            $model->save();

        } catch (\Throwable $th) {
            $this->flashError('Gagal Menyimpan');
            return back();
        }
        
        $this->flashSuccess('Berhasil Menyimpan');
        return back();
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
            
            $this->flashSuccess('Berhasil Menghapus');
            return back();

        } catch (\Throwable $th) {
            $this->flashError('Gagal Menghapus');
            return back();
        }
    }    
}
