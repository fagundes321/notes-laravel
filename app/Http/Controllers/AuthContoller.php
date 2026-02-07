<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AuthContoller extends Controller
{


     public function login(){

        return view('login');

    }


     public function loginSubmit(){

        echo 'login submit';

    }


     public function logout(){

        echo 'logout';

    }



}
