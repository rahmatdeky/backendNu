<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use DB;
use Hash;
use App\Models\Akses;
use App\Models\Users;

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
        $otor = Akses::select('akses')
        ->where('id_user', $data->id)
        ->get();
        return response()->json([
            'id' => $data->id,
            'name' => $data->name,
            'email' => $data->email,
            'otoritas' => $otor
        ]);
    }

    public function logout (Request $request) 
    {
        Auth::user()->tokens()->delete();
    }

    public function registrasi (Request $request)
    {
        $registraasi = Users::insert([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);
    }

    public function gantiPwbySelf (Request $request)
    {
        $cekUser = Users::where('id', $request->id)->first();
        if(Hash::check($request->currentPass, $cekUser->password)){
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
            $user = Users::where('id', $request->id)
            ->update([
                'password' => Hash::make($request->newPass)
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
        $otor = Akses::select('akses')
        ->where('id', $user->id)
        ->get();

        return response()->json([
            'email' => $user->email,
            'akses' => $otor->pluck('akses')
        ]);
    }

    public function updatePwbyAdmin(Request $request)
    {
        $update = Users::where('id', $request->id)
        ->update([
            'password' => Hash::make($request->baru)
        ]);
    }
}
