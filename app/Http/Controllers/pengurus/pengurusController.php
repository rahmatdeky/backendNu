<?php

namespace App\Http\Controllers\pengurus;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Pengurus\modelPengurus;

class pengurusController extends Controller
{
    public function tambahPengurus(Request $request)
    {
        $tambah = modelPengurus::create([
            'NIK' => $request->nik,
            'nama_pengurus' => $request->namaLengkap,
            'alamat_pengurus' => $request->alamat,
            'organisasi' => $request->organisasi,
            'jabatan' => $request->jabatan,
            'no_hp' => $request->nomorHp,
            'email' => $request->email
        ]);

        if ($tambah) {
            return response()->json([
                'title' => 'Berhasil',
                'text' => 'Data Berhasil Disimpan',
                'icon' => 'success'
            ]);
        } else {
            return response()->json([
                'title' => 'Gagal',
                'text' => 'Data Gagal Disimpan',
                'icon' => 'error'
            ]);
        }
    }

    public function browsePengurus(Request $request)
    {
        $browse = modelPengurus::where(function ($query) use ($request) {
            $query->where('NIK', 'LIKE', '%' . $request->search . '%')
            ->orWhere('nama_pengurus', 'LIKE', '%' . $request->search . '%')
            ->orWhere('alamat_pengurus', 'LIKE', '%' . $request->search . '%')
            ->orWhere('organisasi', 'LIKE', '%' . $request->search . '%');
        })
        ->paginate(10);

        return response()->json($browse);
    }

    public function getDetailPengurus($NIK)
    {
        $detail = modelPengurus::where('NIK', $NIK)
        ->first();

        return response()->json($detail);
    }

    public function editDetailPengurus(Request $request)
    {
        $edit = modelPengurus::where('NIK', $request->nik)
        ->update([
            'nama_pengurus' => $request->nama,
            'alamat_pengurus' => $request->alamat,
            'organisasi' => $request->organisasi,
            'jabatan' => $request->jabatan,
            'no_hp' => $request->nomorHp,
            'email' => $request->email
        ]);

        if ($edit) {
            return response()->json([
                'title' => 'Berhasil',
                'text' => 'Data Berhasil Dirubah',
                'icon' => 'success'
            ]);
        } else {
            return response()->json([
                'title' => 'Gagal',
                'text' => 'Data Gagal Dirubah',
                'icon' => 'error'
            ]);
        }
    }

    public function deletePengurus(Request $request)
    {
        $delete = modelPengurus::where('NIK', $request->NIK)
        ->delete();

        if ($delete) {
            return response()->json([
                'title' => 'Berhasil',
                'text' => 'Data Berhasil Dihapus',
                'icon' => 'success'
            ]);
        } else {
            return response()->json([
                'title' => 'Gagal',
                'text' => 'Data Gagal Dihapus',
                'icon' => 'error'
            ]);
        }
    }
}
