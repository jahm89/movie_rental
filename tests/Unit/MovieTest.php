<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Rental;

class MovieTest extends TestCase
{
     /**
     * A basic unit test example.
     *
     * @return void
     */
    public function testCreateMovieWithoutAdminRole()
    {
        $data = [
                        'name' => "New Movie",
                        'title' => 'New Movie',
                        'description' => "This is a movie",
                        'stock' => 10, 
			            'rental_price' => 2.3, 
			            'sale_price' => 6.00, 
			            'availability' => 1, 
			            'monetary_penalty' => 5.00];

        $response = $this->json('POST', '/api/movies',$data);
        $response->assertStatus(401);
    }

     /**
     * A basic unit test example.
     *
     * @return void
     */
    public function testCreateMovieWithAdminRole()
    {
    	//$this->assertTrue(true);
    	copy(resource_path('images/random.jpg'), resource_path('images/random2.jpg'));

    	$data = [
                        'email' => "jeovanni.jahm@gmail.com",
                        'password' => '12345678'];

        $response = $this->json('POST', '/api/login',$data);
    	$response->assertStatus(200);
    	$token = $response->getData()->token;


        $data = [
                'name' => "New Movie from Unit Test",
                'title' => 'New Movie from Unit Test',
                'description' => "This is a movie",
                'stock' => 10, 
	            'rental_price' => 2.3, 
	            'sale_price' => 6.00, 
	            'availability' => 1, 
	            'monetary_penalty' => 5.00, 
	            'image' => new \Illuminate\Http\UploadedFile(resource_path('images/random2.jpg'), 'random2.jpg', null, null, null, true),
	        	'token' => $token];

        $response = $this->json('POST', '/api/movies',$data);
        $response->assertStatus(200);
    }

     /**
     * A basic unit test example.
     *
     * @return void
     */
    public function testUpdateMovieWithGuestRole()
    {

    	$data = [
                        'email' => "alex.morales@gmail.com",
                        'password' => '12345678'];

        $response = $this->json('POST', '/api/login',$data);
    	$response->assertStatus(200);
    	$token = $response->getData()->token;


        $data = [
                'name' => "Update Movie from Unit Test",
                'title' => 'Update Movie from Unit Test',
                'description' => "This is a movie",
                'stock' => 10, 
	            'rental_price' => 2.3, 
	            'sale_price' => 6.00, 
	            'availability' => 1, 
	            'monetary_penalty' => 5.00,
	        	'token' => $token];

        $response = $this->json('PUT', '/api/movies/update/2',$data);
        $response->assertStatus(401);
    }

     /**
     * A basic unit test example.
     *
     * @return void
     */
    public function testUpdateMovieWithAdminRole()
    {

    	$data = [
                        'email' => "jeovanni.jahm@gmail.com",
                        'password' => '12345678'];

        $response = $this->json('POST', '/api/login',$data);
    	$response->assertStatus(200);
    	$token = $response->getData()->token;


        $data = [
                'name' => "Update Movie from Unit Test",
                'title' => 'Update Movie from Unit Test',
                'description' => "This is a movie",
                'stock' => 10, 
	            'rental_price' => 2.3, 
	            'sale_price' => 6.00, 
	            'availability' => 1, 
	            'monetary_penalty' => 5.00,
	        	'token' => $token];

        $response = $this->json('PUT', '/api/movies/update/2',$data);
        $response->assertStatus(200);
    }

     /**
     * A basic unit test example.
     *This test is for any user without any filter or parameter
     *It shows all the available movies
     * @return void
     */
    public function testMovieIndexDefault()
    {
        $response = $this->json('get', '/api/movies');
        $response->assertStatus(200);
    }

     /**
     * A basic unit test example.
     *This test is for any user with some parameters
     *This method returns all available movies
     * @return void
     */
    public function testMovieIndexAvailables()
    {
    	$data = [
    				'sort' => 'popularity',
    				'page' => '2',
    				'per_page' => '3'
    			];

        $response = $this->json('get', '/api/movies', $data);
        $response->assertStatus(200);
    }

     /**
     * A basic unit test example.
     *This test is for any user with some parameters
     *This method can be used only for admin users
     * @return void
     */
    public function testMovieIndexAvalalibityFailed()
    {
    	$data = [
    				'sort' => 'popularity',
    				'page' => '2',
    				'per_page' => '3',
    				'availability' => 1
    			];

        $response = $this->json('get', '/api/movies', $data);
        $response->assertStatus(401);
    }

     /**
     * A basic unit test example.
     *This test is for any user with some parameters
     *This method can be used only for admin users
     * @return void
     */
    public function testMovieIndexAvalalibitySuccess()
    {
    	$data = [
                        'email' => "jeovanni.jahm@gmail.com",
                        'password' => '12345678'];

        $response = $this->json('POST', '/api/login',$data);
    	$response->assertStatus(200);
    	$token = $response->getData()->token;

    	$data = [
    				'sort' => 'popularity',
    				'page' => '2',
    				'per_page' => '3',
    				'availability' => 1,
    				'token' => $token
    			];

        $response = $this->json('get', '/api/movies', $data);
        $response->assertStatus(200);
    }

     /**
     * A basic unit test example.
     * @return void
     */
    public function testMovieFindFailed()
    {
        $response = $this->json('get', '/api/movies/find/10000');
        $response->assertStatus(400);
    }

     /**
     * A basic unit test example.
     * @return void
     */
    public function testMovieFindSuccess()
    {
        $response = $this->json('get', '/api/movies/find/5');
        $response->assertStatus(200);
    }

     /**
     * A basic unit test example.
     * @return void
     */
    public function testMovieFindByNameFailed()
    {
        $response = $this->json('get', '/api/movies/findByname?name=3635');
        $response->assertStatus(400);
    }

     /**
     * A basic unit test example.
     * @return void
     */
    public function testMovieFindBynameSuccess()
    {
        $response = $this->json('get', '/api/movies/findByname?name=movie');
        $response->assertStatus(200);
    }

     /**
     * A basic unit test example.
     * @return void
     */
    public function testMovieLikeFailedUnauthorized()
    {
    	$data = [
    				'movie_id' => 19
    			];

        $response = $this->json('post', '/api/movies/like', $data);
        $response->assertStatus(401);
    }

     /**
     * A basic unit test example.
     *
     * @return void
     */
    public function testMovieRental()
    {

    	$data = [
                        'email' => "jeovanni.jahm@gmail.com",
                        'password' => '12345678'];

        $response = $this->json('POST', '/api/login',$data);
    	$response->assertStatus(200);
    	$token = $response->getData()->token;


        $data = [
                'movie_id' => 5,
                'deadline' => "2019-12-21",
	        	'token' => $token];

        $response = $this->json('post', '/api/movies/rental',$data);
        $response->assertStatus(200);
    }  	

     /**
     * A basic unit test example.
     *
     * @return void
     */
    public function testMovieRentalReturn()
    {

    	$data = [
                        'email' => "jeovanni.jahm@gmail.com",
                        'password' => '12345678'];

        $response = $this->json('POST', '/api/login',$data);
    	$response->assertStatus(200);
    	$token = $response->getData()->token;

    	$rental = Rental::latest()->first();

        $data = [
                'rental_id' => $rental->id,
	        	'token' => $token];

        $response = $this->json('post', '/api/movies/rentalReturn',$data);
        $response->assertStatus(200);
    }  	
	

}
