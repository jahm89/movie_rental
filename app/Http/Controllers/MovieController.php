<?php

namespace App\Http\Controllers;

use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use App\Movie;
use App\LikeMovie;
use App\Log;
use App\Rental;
use App\Purchase;
use App\Image;
use Illuminate\Http\Request;

class MovieController extends Controller
{

    /**
     * MovieController constructor.
     */
    public function __construct()
    {
    	$this->middleware('auth.role:admin', ['only' => ['store', 'update', 'destroy', 'rentalReturn']]);
    }

    /**
 	* @return mixed
 	*/
 	public function index(Request $request)
 	{
        try {
            $sort  = null;
            $availability = null;
            $page = null;
            $per_page = null;

            if(array_key_exists('sort', $request->all())){
                $sort = $request->all()['sort'];
            }
            if(array_key_exists('availability', $request->all())){
                $availability = $request->all()['availability'];
            }

            //Add a switch to have more flexibility to sort for any parameter
            switch ($sort) {
                case 'popularity':
                $movies =  Movie::orderBy('likes', 'desc');
                break;
                
                default:
                $movies =  Movie::orderBy('title', 'asc');
                break;
            }

            //Check if the parameter availability exists (only admin can use this filter)
            if($availability != null){

                $user = JWTAuth::parseToken()->authenticate();
                
                if ($user->role != 'admin') {
                    return response()->json([
                        'success' => false,
                        'message' => 'Sorry, you are not authorized to use this filter.'
                    ], 400);
                }

                if ($availability != 'all') {
                    $movies->where('availability', $availability);    
                }    

            }
            else{
                $movies->where('availability', 1);
            }

            $images = [];
            $movies = $movies->paginate(3);

            foreach ($movies as $key => $value) {

                $img = Image::where('movie_id', $value->id)->first();

                if ($img) {
                    $images[$value->id] = $img->name;   
                }
            }

            return response()->json([
                        'success' => true,
                        'data' => $movies,
                        'images' => $images
                    ], 200);

        }catch(JWTException $e){
            return response()->json([
                        'success' => false,
                        'message' => $e->getMessage()
                    ], 401);
        }
    }

    /**
    * @param $id
    * @return \Illuminate\Http\JsonResponse
    */
    public function show($id)
    {
        $movie = Movie::find($id);

        if (!$movie) {
            return response()->json([
                'success' => false,
                'message' => 'Sorry, movie with id ' . $id . ' cannot be found.'
            ], 400);
        }

        return $movie;
    }

    /**
    * @param $id
    * @return \Illuminate\Http\JsonResponse
    */
    public function findByName(Request $request)
    {
        $name = '';

        if($request->all()['name']){
            $name = strtoupper($request->all()['name']);
        }

        $movie = Movie::where('name', 'like', '%' . $name . '%')->get();

        if (!$movie || count($movie) == 0) {
            return response()->json([
                'success' => false,
                'message' => 'Sorry, movie with name ' . $name . ' cannot be found.'
            ], 400);
        }

        return $movie;
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
            'monetary_penalty' => 'required',
            'image' => 'required'
        ]);

    	$movie = new Movie();
    	$movie->title = $request->title;
    	$movie->description = $request->description;
    	$movie->name = strtoupper($request->name);
    	$movie->stock = $request->stock;
    	$movie->rental_price = $request->rental_price;
    	$movie->sale_price = $request->sale_price;
    	$movie->availability = $request->availability;
    	$movie->monetary_penalty = $request->monetary_penalty;

    	if ($movie->save())
        {
            $image = $request->image;

            if (preg_match('/^data:image\/(\w+);base64,/', $image)) {
                $data = substr($image, strpos($image, ',') + 1);

                $data = base64_decode($data);
                $imageName = time().'.png';
                $url = public_path('images')."/".$imageName;
                file_put_contents($url, $data);
            }else{
                $imageName = time().'.'.request()->image->getClientOriginalExtension();
                $request->image->move(public_path('images'), $imageName);
            } 
              
            //Upload image to images folder

            //Save image in database (it can have more than one image)
            //To this project, it only will contain one image
            $image = new Image();
            $image->name = $imageName;
            $image->movie_id = $movie->id;

            if ($image->save()) {
                return response()->json([
                    'success' => true,
                    'movie' => $movie
                ], 200);
            }
            else{
                return response()->json([
                    'success' => false,
                    'message' => 'Sorry, movie image could not be saved.'
                ], 500);    
            }
            
        }
    	else{
            return response()->json([
                'success' => false,
                'message' => 'Sorry, movie could not be added.'
            ], 500);
        }
    }

    /**
    * @param Request $request
    * @param $id
    * @return \Illuminate\Http\JsonResponse
    */
    public function update(Request $request, $id)
    {
        try{
        
            $movie = Movie::find($id);

            if (!$movie) {
                return response()->json([
                    'success' => false,
                    'message' => 'Sorry, movie with id ' . $id . ' cannot be found.'
                ], 400);
            }

            $user = JWTAuth::parseToken()->authenticate();

            //Info for log
            $text = "Who did it: ".$user->name." - ";
            $text .= "Fields saving Title: ".$movie->title.", ";
            $text .= "Rental price: ".$movie->rental_price.", ";
            $text .= "Sale price: ".$movie->sale_price;

            $data = $request->all();
            
            if (array_key_exists('name', $data)) {
                $data['name'] = strtoupper($data['name']);
            }

            $updated = $movie->fill($data)->save();

            if ($updated) {

                if($this->saveLog('update', $text)){
                    return response()->json([
                        'success' => true,
                        'movie' => $movie
                    ]);
                }
                else{
                    return response()->json([
                        'success' => false,
                        'message' => 'Sorry, the log could not be created.'
                    ], 500);
                }

            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Sorry, movie could not be updated.'
                ], 500);
            }
        }catch(JWTException $e){
            return response()->json([
                        'success' => false,
                        'message' => $e->getMessage()
                    ], 401);
        }
    }

    /**
    * @param Request $request
    * @param $id
    * @return \Illuminate\Http\JsonResponse
    */
    public function liked(Request $request)
    {
        try{
            $id = 0;

            if (array_key_exists('movie_id', $request->all())) {
                $id = $request->all()['movie_id'];
            }

            $user = JWTAuth::parseToken()->authenticate();

            $movie = Movie::find($id);

            if (!$movie) {
                return response()->json([
                    'success' => false,
                    'message' => 'Sorry, movie cannot be found.'
                ], 400);
            }

            $likeMovie = LikeMovie::where('movie_id', $movie->id)
                                  ->where('user_id', $user->id)->first();

            if ($likeMovie !== null) {
                return response()->json([
                    'success' => false,
                    'message' => 'Sorry, you already have liked this movie.'
                ], 400);
            }

            $likeMovie = new LikeMovie();
            $likeMovie->movie_id = $movie->id;
            $likeMovie->user_id = $user->id;

            if ($likeMovie->save()){
                $movie->likes = $movie->likes + 1;

                if ($movie->save()) {
                    return response()->json([
                        'success' => true,
                        'movie' => $movie
                    ]);
                }
                else{
                    return response()->json([
                        'success' => false,
                        'message' => 'Sorry, movie could not be liked.'
                    ], 500);
                }
            }   
            else{
                return response()->json([
                    'success' => false,
                    'message' => 'Sorry, movie could not be liked.'
                ], 500);
            }
        }catch(JWTException $e){
            return response()->json([
                        'success' => false,
                        'message' => $e->getMessage()
                    ], 401);
        }
    }

    /**
    * @param $id
    * @return \Illuminate\Http\JsonResponse
    */
    public function destroy($id)
    {
        try{
            $movie = Movie::find($id);

            if (!$movie) {
                return response()->json([
                    'success' => false,
                    'message' => 'Sorry, movie with id ' . $id . ' cannot be found.'
                ], 400);
            }

            if ($movie->delete()) {
                return response()->json([
                    'success' => true
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Movie could not be deleted.'
                ], 500);
            }
        }catch(\Illuminate\Database\QueryException $ex){ 
            return response()->json([
                    'success' => false,
                    'message' => $ex->getMessage()
                ], 500);
        }
    }

    /**
    * @param Request $request
    * @return \Illuminate\Http\JsonResponse
    */
    public function rental(Request $request){

        try{
            $request->validate([
                'movie_id' => 'required', 
                'deadline' => 'required|date'
            ]);

            $movie = Movie::find($request->movie_id);

            if (!$movie || $movie->availability == 0 || $movie->stock == 0) {
                return response()->json([
                    'success' => false,
                    'message' => 'Sorry, movie with id ' . $request->movie_id . ' cannot be found, is not available or is not in stock.'
                ], 400);
            }
            
            $user = JWTAuth::parseToken()->authenticate();

            $rental = new Rental();
            $rental->return_deadline = $request->deadline;
            $rental->user_id = $user->id;
            $rental->movie_id = $request->movie_id;

            if ($rental->save()){

                //Decrease stock
                $movie->stock = $movie->stock - 1;
                $movie->save();

                //Info for log
                $text = "Who did it: ".$user->name." - ";
                $text .= "Dealine: ".$request->deadline.", ";
                $text .= "When: ".date('Y-m-d H:i:s');

                if($this->saveLog('rental', $text)){
                    return response()->json([
                        'success' => true,
                        'rental' => $rental
                    ]);
                }
                else{
                    return response()->json([
                        'success' => false,
                        'message' => 'Sorry, the log could not be created.'
                    ], 500);
                }

            }
            else{
                return response()->json([
                    'success' => false,
                    'message' => 'Sorry, the rental could not be added.'
                ], 500);
            }
        }catch(JWTException $e){
            return response()->json([
                        'success' => false,
                        'message' => $e->getMessage()
                    ], 401);
        }
    }

    /**
    * @param Request $request
    * @return \Illuminate\Http\JsonResponse
    */
    public function rentalReturn(Request $request){

        try{
            $request->validate([
                'rental_id' => 'required'
            ]);

            $rental = Rental::find($request->rental_id);
            $current_date = date('Y-m-d');

            if (!$rental || ($rental->return_date != null && $rental->return_date != '')) {
                return response()->json([
                    'success' => false,
                    'message' => 'Sorry, rental with id ' . $request->rental_id . ' cannot be found or already has been returned.'
                ], 400);
            }
            
            $user = JWTAuth::parseToken()->authenticate();

            $rental->penalty = 0;
            $rental->return_date = $current_date;

            //Add penalty if the return date is higher than deadline
            if ($current_date > $rental->return_deadline) {
                $rental->penalty = $rental->Movie->monetary_penalty;
            }

            if ($rental->save()){

                //Increase stock
                $movie = Movie::find($rental->movie_id);

                $movie->stock = $movie->stock + 1;
                $movie->save();

                //Info for log
                $text = "Who did it: ".$user->name." - ";
                $text .= "Dealine: ".$request->deadline.", ";
                $text .= "Penalty: ".$request->deadline.", ";
                $text .= "When: ".date('Y-m-d H:i:s');

                if($this->saveLog('rental return', $text)){
                    return response()->json([
                        'success' => true,
                        'rental' => $rental
                    ]);
                }
                else{
                    return response()->json([
                        'success' => false,
                        'message' => 'Sorry, the log could not be created.'
                    ], 500);
                }

            }
            else{
                return response()->json([
                    'success' => false,
                    'message' => 'Sorry, the rental could not be added.'
                ], 500);
            }
        }catch(JWTException $e){
            return response()->json([
                        'success' => false,
                        'message' => $e->getMessage()
                    ], 401);
        }
    }

    /**
    * @param Request $request
    * @return \Illuminate\Http\JsonResponse
    */
    public function purchase(Request $request){

        try{
            $request->validate([
                'movie_id' => 'required', 
                'amount' => 'required|min:1'
            ]);

            $amount = $request->amount;
            $movie_id = $request->movie_id;

            $movie = Movie::find($movie_id);


            if (!$movie || $movie->availability == 0 || $movie->stock < $amount) {
                return response()->json([
                    'success' => false,
                    'message' => 'Sorry, movie with id ' . $movie_id . ' cannot be found, is not available or the amount required is greater than the stock.'
                ], 400);
            }

            $user = JWTAuth::parseToken()->authenticate();

            $purchase = new Purchase();
            $purchase->amount = $amount;
            $purchase->user_id = $user->id;
            $purchase->movie_id = $movie_id;
            $purchase->total = $amount * $movie->sale_price;

            if ($purchase->save()){

                //Decrease stock
                $movie->stock = $movie->stock - $amount;
                $movie->save();
                
                //Info for log
                $text = "Who did it: ".$user->name." - ";
                $text .= "How many: ".$amount.", ";
                $text .= "When: ".date('Y-m-d H:i:s');

                if($this->saveLog('purchase', $text)){
                    return response()->json([
                        'success' => true,
                        'purchase' => $purchase
                    ]);
                }
                else{
                    return response()->json([
                        'success' => false,
                        'message' => 'Sorry, the log could not be created.'
                    ], 500);
                }
            }
            else{
                return response()->json([
                    'success' => false,
                    'message' => 'Sorry, the purchase could not be added.'
                ], 500);
            }
                
        }catch(JWTException $e){
            return response()->json([
                        'success' => false,
                        'message' => $e->getMessage()
                    ], 401);
        }
    }

    /**
    * @param $type
    * @param $text
    */
    public function saveLog($type, $text){

        $log = new Log();
        $log->type = $type;
        $log->text = $text;

        if ($log->save())
            return true;
        else
            return false;

    }

}
