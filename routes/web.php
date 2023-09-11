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

    Route::get('/data/laporan', 'DataController@laporan')->name('data.laporan');
    Route::post('/data/laporan', 'DataController@downloadLaporan')->name('data.download');

    Route::get('/tes',function(){
        $a = new Carbon\Carbon();
        return $a->translatedFormat('Y-m-d');
    });
});