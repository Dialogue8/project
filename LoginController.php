<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\FlareClient\View;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function viewlogin()
    {
        return view('login', [
            'title' =>  'Login Raport Diagnostik'
        ]);
    }

    public function postlogin(request $request)
    {
        if (Auth::attempt($request->only('username', 'password'))) {
            if (auth()->user()->level == 'kurikulum') {
                return redirect('/kurikulum/dashboard');
            } else if (auth()->user()->level == 'siswa') {
                return redirect('/siswa/dashboard');
            } else if (auth()->user()->level == 'walikelas') {
                return redirect('/walikelas/dashboard');
            } else if (auth()->user()->level == 'guru') {
                return redirect('/guru/dashboard');
            } else {
                return redirect('/');
            }
        } else {
            return redirect('/login');
        }
    }

    public function logout(request $request)
    {
        Auth::logout();
        return redirect('/login');
    }
}
