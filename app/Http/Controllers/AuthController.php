<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use JWTAuth;
use App\User;
use Tymon\JWTAuth\Exceptions\JWTException;
use App\Http\Requests\RegistrationFormRequest;

class AuthController extends Controller
{
	/**
     * @var bool
     */
    public $loginAfterSignUp = true;

    /**
     * AuthController constructor.
     */
    public function __construct()
    {
        $this->middleware('auth.role:admin', ['only' => ['changeRole']]);
    }

	/**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
	public function login(Request $request)
	{
		$input = $request->only('email', 'password');
		$token = null;

		if (!$token = JWTAuth::attempt($input)) {
			return response()->json([
				'success' => false,
				'message' => 'Invalid Email or Password',
			], 401);
		}

		return response()->json([
			'success' => true,
			'token' => $token,
		], 200);
	}

	/**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function logout(Request $request)
    {
        $this->validate($request, [
            'token' => 'required'
        ]);

        try {
            JWTAuth::invalidate($request->token);

            return response()->json([
                'success' => true,
                'message' => 'User logged out successfully'
            ]);
        } catch (JWTException $exception) {
            return response()->json([
                'success' => false,
                'message' => 'Sorry, the user cannot be logged out'
            ], 500);
        }
    }

    /**
     * @param RegistrationFormRequest $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(RegistrationFormRequest $request)
    {
        $request->validate([
            'name' => 'required', 
            'email' => 'required',
            'password' => 'required|min:6'
        ]);

        try {
            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->password = bcrypt($request->password);
            $user->save();

            if ($this->loginAfterSignUp) {
                return $this->login($request);
            }

            return response()->json([
                'success'   =>  true,
                'data'      =>  $user
            ], 200);
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
    public function changeRole(Request $request)
    {
        $request->validate([
            'id' => 'required', 
            'role' => 'required',
        ]);

        $user = User::find($request->id);

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'Sorry, user with id ' . $request->id . ' cannot be found.'
            ], 400);
        }

        $user->role = $request->role;

        if ($user->save()) {
            return response()->json([
                'success'   =>  true,
                'data'      =>  $user
            ], 200);            
        }
        else{
            return response()->json([
                'success' => false,
                'message' => 'Sorry, user could not be updated.'
            ], 500);
        }

    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function verifyUser(Request $request)
    {

    }
}
