<?php

namespace App\Http\Controllers;

use App\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class OrderController extends Controller
{
    //    
    public function order(){
        if(Session::has('name')){
            return view('order');
        }
        else{
            return view('login');
        }
    }

    public function postOrder(Request $request){
        
    }
}
