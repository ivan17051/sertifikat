<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    protected $table = 'transaksi';

    public $timestamps = false;

    protected $fillable = [
        "iduser",
        "idacara",
        "no_surat",
        "tgl_surat",
	    "jumpeserta",
        "background",
    ];

    public function acara(){
        return $this->belongsTo(Acara::class, 'idacara');
    }
    
}
