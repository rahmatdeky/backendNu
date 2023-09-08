<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use DB;
use Hash;

class AuthController extends Controller
{
    public function login (Request $request) {
        $credentials = $request->validate([
            'email' => ['required'],
            'password' => ['required'],
        ]);
        if (Auth::attempt($credentials)) {
            // $request->session()->regenerate();
            $token = Auth::user()->createToken('token');

             return ['token' => $token->plainTextToken];
            // return redirect()->intended('dashboard');
        }

        return response()->json([
            'email' => 'The provided credentials do not match our records.',
        ], 401);
    }

    public function me () 
    {
        $data = auth()->user();
        return $data;
    }

    public function logout (Request $request) 
    {
        Auth::user()->tokens()->delete();
    }

    public function registrasi (Request $request)
    {
        $registraasi = DB::table(DB::raw('users'))
        ->insert([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);
    }

    public function gantiPw (Request $request)
    {
        $cekUser = DB::table(DB::raw('users'))
        ->where('name', $request->user)->first();
        if(Hash::check($request->password, $cekUser->password)){
            $check = 1;
        } else {
            $check = 0;
        }
        if( !($check > 0) ) {
            return response()->json([
                'status' => 'error',
                'message' => 'Password Salah'
            ]);
        } else {
            $user = DB::table(DB::raw('users'))
            ->where('name', $request->user)
            ->update([
                'password' => Hash::make($request->passwordBaru)
            ]);
            return response()->json([
                'status' => 'success',
                'message' => 'Password Berhasil Diubah'
            ]);
        }
    }

    public function getAccess(Request $request)
    {
        $user = auth()->user();
        // return $user;
        $otor = DB::table('akses')
        ->select('akses')
        ->where('email', $user->email)
        ->get();

        return response()->json([
            'email' => $user->email,
            'akses' => $otor->pluck('akses')
        ]);
    }
}
