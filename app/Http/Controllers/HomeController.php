<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Peserta;
use App\Acara;
use App\Transaksi;

class HomeController extends Controller
{
    public function home(){
        $d['acara'] = Acara::count();
        $d['peserta'] = Peserta::count();
        $d['transaksi'] = Transaksi::count();
    
        return view('dashboard', $d);
    }
    
}
