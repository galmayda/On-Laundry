<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login(){
        if(Session::has('name')){
            return view('index');
        }
        else{
            return view('login');
        }
    }

    public function postLogin(Request $request){
        $email = $request->email;
        $password = $request->password;
        $data = User::where('email',$email)->first();        
        if($data){
            if(Hash::check($password,$data->password)){
                Session::put('id', $data->user_id);
                Session::put('name', $data->name);
                Session::put('email',$data->email);
                Session::put('notelp',$data->notelp);
                Session::put('alamat',$data->alamat);
                Session::put('login',TRUE);
                return redirect('/');
            }
            else{
                return redirect('login')->with('alert', 'Email atau Password Salah!');
            }
        }
    }

    public function postRegister(Request $request){
        $user = new User();

        $this->validate($request,[
            'username' => 'required|min:8|max:20',
            'name' => 'required|min:1|max:20',
            'email' => 'required|email|unique:users',
            'notelp' => 'required|min:11|numeric',
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
            'email.unique' => ' Email sudah terdaftar pada database.'
        ]);

        $user->username = $request->username;
        $user->password = bcrypt($request->password);
        $user->name = $request->name;
        $user->email = $request->email;
        $user->notelp = $request->notelp;     
        
        $user->save();

        return redirect('login')->with('alert-success','Kamu berhasil Register');
    }

    public function logout(){
        Session::flush();
        return redirect('login')->with('alert','Kamu sudah logout');
    }
}
