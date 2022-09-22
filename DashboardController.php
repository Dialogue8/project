<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        return view('test');
    }

    public function kurikulum()
    {
        return view('kurikulum.data_siswa');
    }

    public function guru()
    {
        return view('guru.tampil_komponen');
    }
}
