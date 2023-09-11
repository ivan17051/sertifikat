<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Peserta;
use App\Acara;
use Carbon\Carbon;

class HomeController extends Controller
{
    public function home(){
        $d['acara'] = Acara::count();
        $d['peserta'] = Peserta::count();
        // dd($d);
        return view('dashboard', $d);
    }
    
    public function data(Request $request){
        $data = Penilaian::where('isactive',1)->where('idpegawai',$request->input('id'))->with('pegawai','old')
                            ->orderBy('id', 'ASC');
        $datatable = Datatables::of($data);
        return $datatable->addIndexColumn()->make(true);
    }

    public function delete(Request $request){
        try {
            $model=Penilaian::find($request->input('id'));
            $model->idm=$userId;
            $model->isactive=0;
            $model->save();
            return back()->with('success','Berhasil menghapus');
        } catch (\Throwable $th) {
            return back()->with('error','Gagal menghapus');
        }
    }

    public function cetak(Request $request, $idpenilaian){
        $input = array_map('trim', $request->all());
        $model=Penilaian::where('id', $idpenilaian)->with(['pegawai', 'jabatan', 'golongan', 'pendidikan', 'unitKerja'])->first();
        
        return view('report.pak', ['data'=>$model, 'old'=>$old, 'nomor'=>str_replace(' ', '&nbsp', $model->nomor), 'tipe'=>$input['tipe'], 'masakerjaold'=>$masakerjaold, 'masakerja'=>$masakerja ]);
    }
}
