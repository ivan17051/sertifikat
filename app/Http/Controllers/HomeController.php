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
    
        return view('dashboard', $d);
    }
    
}
