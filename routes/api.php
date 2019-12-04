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
Route::post('login', 'AuthController@login');
Route::post('register', 'AuthController@register');
Route::get('movies', 'MovieController@index');
Route::get('movies/{id}', 'MovieController@show');


Route::group(['middleware' => 'auth.jwt'], function () {
    Route::get('logout', 'AuthController@logout');
	Route::post('movies', 'MovieController@store');
	Route::post('movies/like', 'MovieController@liked');
	Route::put('movies/{id}', 'MovieController@update');    
	Route::delete('movies/{id}', 'MovieController@destroy');
	Route::post('movies/rental', 'MovieController@rental');
	Route::post('movies/purchase', 'MovieController@purchase');

    // Route::get('tasks/{id}', 'TaskController@show');
    // Route::post('tasks', 'TaskController@store');
    // Route::put('tasks/{id}', 'TaskController@update');
    // Route::delete('tasks/{id}', 'TaskController@destroy');
});