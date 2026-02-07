<?php

use App\Http\Controllers\AuthContoller;
use App\Http\Controllers\MainController;
use Illuminate\Support\Facades\Route;

// auth

Route::get('/login', [AuthContoller::class, 'login']);
Route::post('/loginSubmit', [AuthContoller::class, 'loginSubmit']);
Route::get('/logout', [AuthContoller::class, 'logout']);
