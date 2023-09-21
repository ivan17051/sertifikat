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
        "tgl_mulai",
        "tgl_selesai",
        "tempat",
        "status"
        
    ];

}
