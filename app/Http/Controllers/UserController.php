<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class UserController extends Controller
{
    public function getUser(Request $request)
    {
        $user = DB::table(DB::raw('users'))
        ->where(function ($query) use ($request) {
            $query->where('name', 'LIKE', '%' . $request->search . '%')
            ->orWhere('email', 'LIKE', '%' . $request->search . '%');
        })
        // ->where(function ($quer) use ($request) {
        //     $quer->where('email', 'LIKE', '%' . $request->email . '%');
        // })
        ->paginate(10);
        return response()->json($user);
    }
}
