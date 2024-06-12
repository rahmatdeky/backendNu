<?php

namespace App\Http\Controllers\referensi;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Referensi\kategori;
use App\Models\Referensi\ModelKecamatan;
use App\Models\Referensi\ModelKelurahan;
use App\Models\Referensi\ModelOrganisasi;

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
        $dataKecamatan = ModelKecamatan::with('kelurahan')->get();
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

    public function addKelurahan(Request $request)
    {
        $addKelurahan = ModelKelurahan::create([
            'nama_kelurahan' => $request->namaKelurahan,
            'kode_kecamatan' => $request->kodeKecamatan,
            'created_at' => now()
        ]);

        if ($addKelurahan) {
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

    public function browseKelurahan(Request $request)
    {
        $dataKelurahan = ModelKelurahan::with('kecamatan')->get();
        return response()->json($dataKelurahan);
    }

    public function editKelurahan(Request $request)
    {
        $editKelurahan = ModelKelurahan::where('kode_kelurahan', $request->id)
        ->update([
            'nama_kelurahan' => $request->namaKelurahan,
            'kode_kecamatan' => $request->kodeKecamatan,
            'updated_at' => now()
        ]);

        if ($editKelurahan) {
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

    public function addOrganisasi(Request $request)
    {
        $addOrganisasi = ModelOrganisasi::create([
            'nama' => $request->namaOrganisasi,
            'created_at' => now()
        ]);

        if ($addOrganisasi) {
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

    public function browseOrganisasi()
    {
        $dataOrganisasi = ModelOrganisasi::get();
        return response()->json($dataOrganisasi);
    }

    public function editOrganisasi(Request $request)
    {
        $editOrganisasi = ModelOrganisasi::where('kode_organisasi', $request->id)
        ->update([
            'nama' => $request->namaOrganisasi,
            'updated_at' => now()
        ]);

        if ($editOrganisasi) {
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
