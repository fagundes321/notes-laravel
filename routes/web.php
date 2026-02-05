<?php

use App\Http\Controllers\MainController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    echo "hello world";
});


Route::get('/about', function(){
    echo "About us";
});

Route::get('/main', [MainController::class, 'index']);
