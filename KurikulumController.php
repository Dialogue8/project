<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class KurikulumController extends Controller
{
    public function dashboard()
    {
        return view('kurikulum.dashboard');
    }
}
