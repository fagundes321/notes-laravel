<?php

use App\Http\Controllers\AuthContoller;
use App\Http\Controllers\MainController;
use App\Http\Middleware\CheckIsLogged;
use Illuminate\Support\Facades\Route;

// auth

Route::get('/login', [AuthContoller::class, 'login']);
Route::post('/loginSubmit', [AuthContoller::class, 'loginSubmit']);

Route::middleware([CheckIsLogged::class])->group(function(){

    Route::get('/', [MainController::class, 'index']);
    Route::get('/newNote', [MainController::class, 'newNote']);
    Route::get('/logout', [AuthContoller::class, 'logout']);

});



