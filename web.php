<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GuruController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\SiswaController;
use App\Http\Controllers\WakelController;
use App\Http\Controllers\KurikulumController;


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

/* Route Hubin */

Route::get('/', function () {
    return view('landing-page.index', [
        "title" =>  "Raport Diagnostik",
    ]);
});




/* Route Siswa */



// Route::get('/hubin/perusahaan', [HubinController::class, 'index']);

/*Route Login*/
Route::get('/login', [LoginController::class, 'viewlogin'])->name('login');

Route::post('/postlogin', [LoginController::class, 'postlogin'])->name('postlogin');
Route::get('/logout', [LoginController::class, 'logout'])->name('logout');

/*Routes Hubin*/
Route::middleware(['auth', 'ceklevel:kurikulum'])->group(function () {
    Route::get('/kurikulum/dashboard', [KurikulumController::class, 'dashboard']);
});

Route::middleware(['auth', 'ceklevel:siswa'])->group(function () {
    Route::get('/siswa/dashboard', [SiswaController::class, 'dashboard']);
});

Route::middleware(['auth', 'ceklevel:walikelas'])->group(function () {
    Route::get('/walikelas/dashboard', [WakelController::class, 'dashboard']);
});

Route::middleware(['auth', 'ceklevel:guru'])->group(function () {
    Route::get('/guru/dashboard', [GuruController::class, 'dashboard']);
});


Route::get('/importdata', function () {
    return view('hubin.upload');
});
