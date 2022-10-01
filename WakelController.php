<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class WakelController extends Controller
{
    public function dashboard()
    {
        return view('wakel.dashboard');
    }
}
