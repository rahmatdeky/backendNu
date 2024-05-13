<?php

namespace App\Http\Controllers\referensi;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\referensi\kategori;
use App\Models\referensi\ModelKecamatan;
use App\Models\referensi\ModelKelurahan;

class ReferensiController extends Controller
{
    public function addKategori(Request $request)
    {
        $addKategori = kategori::create([
            'nama' => $request->namaKategori,
            'created_at' => now()
        ]);

        if ($addKategori) {
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

    public function browseKategori(Request $request)
    {
        $dataKategori = kategori::where(function($query) use ($request) {
            $query->where('nama', 'LIKE', '%' . $request->search . '%');
        })
        ->get();
        return response()->json($dataKategori);
    }

    public function editKategori(Request $request)
    {
        $editKategori = kategori::where('id', $request->id)
        ->update([
            'nama' => $request->namaKategori,
            'updated_at' => now()
        ]);

        if ($editKategori) {
            return response()->json([
                'title' => 'Berhasil',
                'text' => 'Data Berhasil Diubah',
                'icon' => 'success'
            ]);
        } else {
            return response()->json([
                'title' => 'Gagal',
                'text' => 'Data Gagal Diubah',
                'icon' => 'error'
            ]);
        }
    }

    public function addKecamatan(Request $request)
    {
        $addKecamatan = ModelKecamatan::create([
            'nama_kecamatan' => $request->namaKecamatan,
            'kode_kemendagri' => $request->kodeKemendagri,
            'created_at' => now()
        ]);

        if ($addKecamatan) {
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

    public function browseKecamatan(Request $request)
    {
        $dataKecamatan = ModelKecamatan::all();
        return response()->json($dataKecamatan);
    }

    public function editKecamatan(Request $request)
    {
        $editKecamatan = ModelKecamatan::where('kode_kecamatan', $request->id)
        ->update([
            'nama_kecamatan' => $request->namaKecamatan,
            'kode_kemendagri' => $request->kodeKemendagri,
            'updated_at' => now()
        ]);

        if ($editKecamatan) {
            return response()->json([
                'title' => 'Berhasil',
                'text' => 'Data Berhasil Diubah',
                'icon' => 'success'
            ]);
        } else {
            return response()->json([
                'title' => 'Gagal',
                'text' => 'Data Gagal Diubah',
                'icon' => 'error'
            ]);
        }
    }
}
