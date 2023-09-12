<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Models\Akses;
use App\Models\Users;
use App\Models\ListAkses;
use Hash;

class UserController extends Controller
{
    public function getUser(Request $request)
    {
        $user = Users::where(function ($query) use ($request) {
            $query->where('name', 'LIKE', '%' . $request->search . '%')
            ->orWhere('email', 'LIKE', '%' . $request->search . '%');
        })
        // ->where(function ($quer) use ($request) {
        //     $quer->where('email', 'LIKE', '%' . $request->email . '%');
        // })
        ->paginate(10);
        return response()->json($user);
    }

    public function getUserDetail($id)
    {
        $user = Users::where('id', $id)
        ->first();
        $akses = Akses::where('id_user', $id)
        ->get();

        return response()->json([
            'id' =>$user->id,
            'name' => $user->name,
            'email' => $user->email,
            'password' => $user->password,
            'akses' => $akses
        ]);
    }

    public function getListAkses()
    {
        $listAkses = ListAkses::select('nama_akses')
        ->pluck('nama_akses')
        ->toArray();

        return response()->json($listAkses);
    }

    public function updateUser(Request $request)
    {
        $update = Users::where('id', $request->id)
        ->update([
            'name' => $request->nama,
            'email' => $request->email
        ]);

        if($update) {
            return response()->json([
                'status' => 'sukses',
                'message' => 'data berhasil diubah'
            ]);
        } else {
            return response()->json([
                'status' => 'gagal',
                'message' => 'data gagal diubah'
            ]);
        }
    }

    public function addAkses(Request $request)
    {
        $tambah = Akses::create([
            'id_user' => $request->id,
            'email' => $request->email,
            'akses' => $request->menu
        ]);
    }

    public function addUser(Request $request)
    {
        $addUser = Users::create([
            'name' => $request->nama,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);
        return response()->json([
            'status' => 'success',
            'message' => 'data berhasi disimpan'
        ]);
    }

    public function deleteAkses(Request $request)
    {
        $delete = Akses::where('id', $request->id_menu)
        ->delete();

        if ($delete) {
            return response()->json([
                'status' => 'sukses',
                'message' => 'data berhasil dihapus'
            ]);
        } else {
            return response()->json([
                'status' => 'gagal',
                'message' => 'data gagal dihapus'
            ]);
        }
    }
}
