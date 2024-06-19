<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Penilaian extends Model
{
    protected $table = 'mpenilaian';

    public $timestamps = false;

    protected $fillable = [
        "idacara",
        "kategori",
        "deskripsi",
        "isactive",
    ];

    public function getAcara(){
        return $this->belongsTo(Acara::class, 'idacara');
    }
}
