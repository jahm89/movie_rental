<?php

namespace App\Http\Controllers;

use JWTAuth;
use App\Movie;
use Illuminate\Http\Request;

class MovieController extends Controller
{
    /**
     * @var
     */
    protected $user;

    /**
     * TaskController constructor.
     */
    public function __construct()
    {
    	$this->middleware('auth.role:admin', ['only' => ['store']]);
    }

    /**
 	* @return mixed
 	*/
 	public function index()
 	{
 		$movies =  Movie::all();

 		return $movies;
 	}

    /**
 * @param Request $request
 * @return \Illuminate\Http\JsonResponse
 * @throws \Illuminate\Validation\ValidationException
 */
    public function store(Request $request)
    {

    	$request->validate([
    		'name' => 'required', 
            'description' => 'required',
    		'title' => 'required', 
    		'stock' => 'required', 
    		'rental_price' => 'required', 
    		'sale_price' => 'required', 
    		'availability' => 'required', 
    		'monetary_penalty' => 'required'
    	]);

    	$movie = new Movie();
    	$movie->title = $request->title;
    	$movie->description = $request->description;
    	$movie->name = $request->name;
    	$movie->stock = $request->stock;
    	$movie->rental_price = $request->rental_price;
    	$movie->sale_price = $request->sale_price;
    	$movie->availability = $request->availability;
    	$movie->monetary_penalty = $request->monetary_penalty;

    	if ($movie->save())
    		return response()->json([
    			'success' => true,
    			'movie' => $movie
    		]);
    	else
    		return response()->json([
    			'success' => false,
    			'message' => 'Sorry, movie could not be added.'
    		], 500);
    }
}
