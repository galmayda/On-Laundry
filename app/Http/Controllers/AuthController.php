<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AuthController extends Controller
{
    public function login(){
        return view('login');
    }

    public function postLogin(Request $request){
        $username = $request->username;
        $password = $request->password;
        $user = DB::table('users')->select('username','password')->where('username', $username)->where('password',$password)->get();
        if($user->isEmpty()){
            return redirect()->action('AuthController@login');
        }
        else{            
            return redirect('/');
        }
    }

    public function postRegister(Request $request){
        $user = new User();

        $user->username = $request->username;
        $user->password = $request->password;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->notelp = $request->notelp;     
        
        $user->save();

        return redirect('/');
    }
}
