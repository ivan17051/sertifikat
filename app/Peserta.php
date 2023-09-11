<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Peserta extends Model
{
    protected $table = 'mpeserta';

    public $timestamps = false;

    protected $fillable = [
        "nik",
        "nama",
        "tempatlahir",
        "tanggallahir",
        "jeniskelamin",
        "alamat",
        "nohp",
        "status",
    ];

    
}
