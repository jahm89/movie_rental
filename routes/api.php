<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::post('register', 'AuthController@register');
//I added this route to verify user, in case using only APIs
Route::get('verifyUser', 'AuthController@verifyUser')->middleware('verified');
Route::post('login', 'AuthController@login');
Route::get('movies', 'MovieController@index');
Route::get('movies/find/{id}', 'MovieController@show');
Route::get('movies/findByname', 'MovieController@findByName');
Route::group(['middleware' => 'auth.jwt'], function () {
    Route::get('logout', 'AuthController@logout');
    Route::post('user/changeRole', 'AuthController@changeRole')->middleware('verified');
	Route::post('movies', 'MovieController@store')->middleware('verified');
	Route::post('movies/like', 'MovieController@liked')->middleware('verified');
	Route::put('movies/update/{id}', 'MovieController@update')->middleware('verified');
	Route::delete('movies/delete/{id}', 'MovieController@destroy')->middleware('verified');
	Route::post('movies/rental', 'MovieController@rental')->middleware('verified');
	Route::post('movies/purchase', 'MovieController@purchase')->middleware('verified');
	Route::post('movies/rentalReturn', 'MovieController@rentalReturn')->middleware('verified');
});