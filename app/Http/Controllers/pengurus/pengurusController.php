<?php

namespace App\Http\Controllers\pengurus;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Pengurus\modelPengurus;
use App\Models\ModelKecamatan;
use App\Models\ModelKelurahan;

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
            'email' => $request->email,
            'RW' => $request->RW,
            'RT' => $request->RT,
            'kecamatan' => $request->kecamatan,
            'kelurahan' => $request->kelurahan
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
            'email' => $request->email,
            'RT' => $request->RT,
            'RW' => $request->RW,
            'kecamatan' => $request->kecamatan,
            'kelurahan' => $request->kelurahan
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

    public function getRefKecamatan()
    {
        $kecamatan = ModelKecamatan::with('kelurahan')->get();

        return response()->json($kecamatan);
    }

    public function getPengurus()
    {
        $pengurus = modelPengurus::select('NIK', 'kecamatan')->get();

        $belakangPadang = $pengurus->where('kecamatan', 'Belakang Padang')->count();
        $bulang = $pengurus->where('kecamatan', 'Bulang')->count();
        $sungaiBeduk = $pengurus->where('kecamatan', 'Sungai Beduk')->count();
        $sagulung = $pengurus->where('kecamatan', 'Sagulung')->count();
        $nongsa = $pengurus->where('kecamatan', 'Nongsa')->count();
        $batamKota = $pengurus->where('kecamatan', 'Batam Kota')->count();
        $sekupang = $pengurus->where('kecamatan', 'Sekupang')->count();
        $batuAji = $pengurus->where('kecamatan', 'Batu Aji')->count();
        $lubukBaja = $pengurus->where('kecamatan', 'Lubuk Baja')->count();
        $batuAmpar = $pengurus->where('kecamatan', 'Batu Ampar')->count();
        $bengkong = $pengurus->where('kecamatan', 'Bengkong')->count();
        $galang = $pengurus->where('kecamatan', 'Galang')->count();

        return response()->json(['jumlah' => [$belakangPadang,
        $bulang,
        $sungaiBeduk,
        $sagulung,
        $nongsa,
        $batamKota,
        $sekupang,
        $batuAji,
        $lubukBaja,
        $batuAmpar,
        $bengkong,
        $galang]
        ]);
    }

    public function getKecamatan()
    {
        $kecamatan = ModelKecamatan::select('nama_kecamatan')
        ->pluck('nama_kecamatan');

        return response()->json([
            'kecamatan' => $kecamatan
        ]);
    }
}
