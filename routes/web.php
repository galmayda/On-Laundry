<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'PagesController@home');
Route::get('/order', 'OrderController@order');
Route::post('/order', 'OrderController@postOrder');
Route::get('/login', 'AuthController@login');
Route::post('/register', 'AuthController@postRegister')->name('register');
Route::post('/login', 'AuthController@postLogin')->name('login');
Route::get('/logout', 'AuthController@logout');