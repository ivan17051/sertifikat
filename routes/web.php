<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

Route::middleware(['auth'])->group(function (){
    Route::get('/', 'HomeController@home');
    Route::put('/ubah-password', 'UserController@updatePass');
    
    Route::apiResource('user', UserController::class);
    Route::apiResource('acara', AcaraController::class);
    Route::apiResource('peserta', PesertaController::class);

    Route::post('/peserta/data', 'PesertaController@data')->name('peserta.data');

    Route::put('/transaksi/add/{idacara}', 'TransaksiController@add')->name('transaksi.add');
    Route::put('/transaksi/update/{idacara}', 'TransaksiController@update')->name('transaksi.update');
    Route::put('/transaksi/upload/{id}', 'TransaksiController@upload')->name('transaksi.upload');
    Route::put('/transaksi/delete/{idacara}', 'TransaksiController@delete')->name('transaksi.hapus');

    Route::get('/data/laporan', 'DataController@laporan')->name('data.laporan');
    Route::post('/data/laporan', 'DataController@downloadLaporan')->name('data.download');

    Route::get('/tes',function(){
        $a = new Carbon\Carbon();
        return $a->translatedFormat('Y-m-d');
    });
});
Route::get('/transaksi/search/{idacara}', 'TransaksiController@search')->name('transaksi.search');
Route::get('/transaksi/cetak/{idacara}', 'TransaksiController@cetak')->name('transaksi.cetak');