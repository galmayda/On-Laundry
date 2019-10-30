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

        $this->validate($request,[
            'username' => 'required|min:8|max:20',
            'name' => 'required|min:1|max:20',
            'email' => 'required|email|unique:users',
            'notelp' => 'required|min:11|max:16|numeric',
            'password' => 'required|min:8|max:20',
            'confirmpass' => 'required|same:password'
        ],[
            'username.required' => ' Field Username tidak boleh kosong.',
            'username.min' => ' Panjang Username harus 8 karakter atau lebih.',
            'username.max' => ' Panjang Username tidak melebihi 20 karakter.',
            'password.required' => ' Field Password tidak boleh kosong.',
            'password.min' => ' Panjang Password harus 8 karakter atau lebih.',
            'password.max' => ' Panjang Password tidak melebihi 20 karakter.', 
            'confirmpass.required' => ' Field Confirm Password tidak boleh kosong.',
            'confirmpass.same' => ' Confirm Password harus sama dengan Password.',          
            'name.required' => ' Field Nama tidak boleh kosong.',
            'name.min' => ' Panjang Nama harus 1 karakter atau lebih.',
            'name.max' => ' Panjang Nama tidak melebihi 20 karakter.',
            'notelp.required' => ' Field Nomor Telepon tidak boleh kosong.',
            'notelp.numeric' => ' Nomor Telepon harus numerik.',
            'notelp.min' => ' Panjang Nomor Telepon harus 11 karakter atau lebih.',
            'notelp.max' => ' Panjang Nomor Telepon tidak melebihi 16 karakter.',
            'email.unique' => ' Email sudah terdaftar pada database.'
        ]);

        $user->username = $request->username;
        $user->password = $request->password;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->notelp = $request->notelp;     
        
        $user->save();

        return redirect('/');
    }
}
