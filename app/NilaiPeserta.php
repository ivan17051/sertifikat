<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class NilaiPeserta extends Model
{
    protected $table = 'nilai_peserta';

    public $timestamps = false;

    protected $fillable = [
        "idpeserta",
        "idacara",
        "idtransaksi",
        "idpenilaian",
	    "nilai",
        "nilaiket",
    ];

    public function getPeserta(){
        return $this->belongsTo(Peserta::class, 'idpeserta');
    }

    public function getAcara(){
        return $this->belongsTo(Acara::class, 'idacara');
    }

    public function getTransaksi(){
        return $this->belongsTo(Transaksi::class, 'idtransaksi');
    }

    public function getPenilaian(){
        return $this->belongsTo(Penilaian::class, 'idpenilaian');
    }

}
