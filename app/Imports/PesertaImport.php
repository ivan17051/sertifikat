<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToModel;
use App\Peserta;

class PesertaImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */

    public function model(array $row)
    {
        if($row[0]=='nik') return null;
        
        else return new Peserta([
            'nik'           => $row[0], 
            'nama'          => $row[1],
            'tempatlahir'   => $row[2], 
            'tanggallahir'  => $row[3], 
            'alamat'        => $row[4], 
            'unitkerja'     => $row[5], 
            'jabatan'       => $row[6], 
            'isactive'      => 1, 
        ]);
    }
}
