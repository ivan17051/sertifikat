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
	    "jumlah"
    ];

    public function unitKerja(){
        return $this->belongsTo(UnitKerja::class, 'idacara');
    }
    
}
