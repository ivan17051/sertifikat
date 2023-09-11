<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Acara extends Model
{
    protected $table = 'macara';

    public $timestamps = false;

    protected $fillable = [
        "nama",
        "kategori",
        "tanggal",
        "tempat",
        "nomor",
        "background",
        "status"
        
    ];

}
