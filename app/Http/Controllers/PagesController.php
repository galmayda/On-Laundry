<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;

class PagesController extends Controller
{
    public function home(){
        return view('index');
    }

    public function services(){
        return view('services');
    }

    public function aboutus(){
        return view('aboutus');
    }
}
