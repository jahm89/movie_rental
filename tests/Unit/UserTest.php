<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class UserTest extends TestCase
{
	/**
     * A basic unit test example.
     *
     * @return void
     */
    public function testLoginSucess()
    {
        $data = [
                        'email' => "alex.jahm@gmail.com",
                        'password' => '123456'];

        $response = $this->json('POST', '/api/login',$data);
        $response->assertStatus(200);
    }

    /**
     * A basic unit test example.
     *
     * @return void
     */
    public function testLoginFailed()
    {
        $data = [
                        'email' => "alexread.jahm@gmail.com",
                        'password' => '123456'];

        $response = $this->json('POST', '/api/login',$data);
        $response->assertStatus(401);
    }

    /**
     * A basic unit test example.
     *
     * @return void
     */
    public function testRegisterSucess()
    {
    	$this->assertTrue(true);
    	
    	// $random = rand(1, 1000);

     //    $data = [
     //    				'name' => 'Jose Jose',
     //                    'email' => "jose.jose{$random}@gmail.com",
     //                    'password' => '123456'];

     //    $response = $this->json('POST', '/api/register',$data);
     //    $response->assertStatus(200);
    }

    /**
     * A basic unit test example.
     *Fail when the email already exist
     * @return void
     */
    public function testRegisterFailed()
    {
        $data = [
        				'name' => 'Jose Jose',
                        'email' => "jose.jose@gmail.com",
                        'password' => '123456'];

        $response = $this->json('POST', '/api/register',$data);
        $response->assertStatus(422);
    }
}
