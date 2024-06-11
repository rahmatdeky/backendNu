<?php

namespace App\Http\Controllers\pengurus;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Pengurus\modelPengurus;
use App\Models\Referensi\ModelKecamatan;
use App\Models\Referensi\ModelKelurahan;
use App\Models\Users;
use Hash;
use Twilio\Rest\Client;
use Illuminate\Support\Facades\Http;

class pengurusController extends Controller
{
    public function tambahPengurus(Request $request)
    {
        $getNIK = modelPengurus::where('nik', $request->nik)->first();

        $nomorHp = '+62' . $request->nomorHp;

        if ($getNIK) {
            return response()->json([
                'title' => 'Gagal',
                'text' => 'NIK Sudah Terdaftar',
                'icon' => 'error'
            ]);
        } else {
            if ($request->jabatan == 'Pengurus') {
                $addUser = Users::create([
                    'name' => $request->namaLengkap,
                    'email' => $request->email,
                    'password' => Hash::make($request->password),
                    'role' => 'pengurus'
                ]);
    
                $tambah = modelPengurus::create([
                    'nik' => $request->nik,
                    'kode_kelurahan' => $request->kelurahan,
                    'nama' => $request->namaLengkap,
                    'email' => $request->email,
                    'jabatan' => $request->jabatan,
                    'no_hp' => $nomorHp,
                    'created_at' => now(),
                    'alamat' => $request->alamat,
                    'kode_organisasi' => $request->organisasi
                ]);
    
                if ($tambah && $addUser) {
                    $message = 'Selamat' . $request->namaLengkap . ', Anda telah berhasil didaftarkan sebagai pengurus dengan email ' . $request->email . ' dan password' . $request->password . '.';

                    $this->sendMessage($nomorHp, $message);
                    
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
            } else {
                $tambah = modelPengurus::create([
                    'nik' => $request->nik,
                    'kode_kelurahan' => $request->kelurahan,
                    'nama' => $request->namaLengkap,
                    'email' => $request->email,
                    'jabatan' => $request->jabatan,
                    'no_hp' => $nomorHp,
                    'created_at' => now(),
                    'alamat' => $request->alamat,
                    'kode_organisasi' => $request->organisasi
                ]);
        
                if ($tambah) {
                    $message = "Selamat " . $request->namaLengkap . ", Anda telah berhasil didaftarkan sebagai warga.";

                    $this->sendMessage($nomorHp, $message);

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
        }
    }

    public function browsePengurus(Request $request)
    {
        $browse = modelPengurus::with('organisasi')->where(function ($query) use ($request) {
            $query->where('nik', 'LIKE', '%' . $request->search . '%')
            ->orWhere('nama', 'LIKE', '%' . $request->search . '%')
            ->orWhere('alamat', 'LIKE', '%' . $request->search . '%')
            ->orWhere('jabatan', 'LIKE', '%' . $request->search . '%');
        })
        ->paginate(10);

        return response()->json($browse);
    }

    public function getDetailPengurus($NIK)
    {
        $detail = modelPengurus::with(['kelurahan.kecamatan', 'organisasi'])->where('nik', $NIK)
        ->first();

        return response()->json($detail);
    }

    public function editDetailPengurus(Request $request)
    {
        $edit = modelPengurus::where('nik', $request->nik)
        ->update([
            'nama' => $request->nama,
            'alamat' => $request->alamat,
            'kode_organisasi' => $request->organisasi,
            'jabatan' => $request->jabatan,
            'no_hp' => $request->nomorHp,
            'email' => $request->email,
            'kode_kelurahan' => $request->kelurahan,
            'updated_at' => now()
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
        $delete = modelPengurus::where('nik', $request->NIK)
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

    public function getRefWarga()
    {
        $warga = modelPengurus::select('nik', 'nama')->get();

        return response()->json($warga);
    }

    private function sendMessage($nomorHp, $message)
    {
        $url = 'https://app.whacenter.com/api/send';
        $nohp = $nomorHp;
        $pesan = $message;

        $response = Http::post($url, [
            'device_id' => '936e4689abc2cb0d005860882fd86775',
            'number' => $nohp,
            'message' => $pesan,
        ]);
    }

    public function getDashboardWarga()
    {
        $jumlahWargaPerKecamatan = ModelKecamatan::withCount(['kelurahan as warga_count' => function ($query) {
            $query->join('warga', 'warga.kode_kelurahan', '=', 'kelurahan.kode_kelurahan');
        }])->get();
    
        return response()->json($jumlahWargaPerKecamatan);
    }

    public function getTotalWarga(Request $request)
    {
        $type = $request->query('type', 'Warga'); // Default to 'Warga'
        
        if ($type === 'Warga') {
            $data = modelPengurus::all();
        } else if ($type === 'Pengurus') {
            $data = modelPengurus::where('jabatan', '=', 'Pengurus')->get();
        } else {
            return response()->json(['error' => 'Invalid type'], 400);
        }

        return response()->json($data);
    }
}
