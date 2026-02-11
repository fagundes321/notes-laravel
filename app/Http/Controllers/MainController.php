<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MainController extends Controller
{


     public function index(){

        echo 'Im inside the app!';
        // return view()


    }


     public function newNote(){

        echo " I'm creating a new note!";

    }



}
