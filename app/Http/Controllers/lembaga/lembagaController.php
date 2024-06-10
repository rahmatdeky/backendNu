<?php

namespace App\Http\Controllers\lembaga;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Lembaga\ModelLembaga;
use App\Models\Referensi\ModelKecamatan;
use App\Models\Referensi\ModelKelurahan;

class lembagaController extends Controller
{
    public function tambahLembaga(Request $request)
    {
        $tambah = ModelLembaga::create([
            'nama' => $request->namaLembaga,
            'jenjang' => $request->jenjang,
            'jenis_lembaga'  => $request->jenisLembaga,
            'alamat' => $request->alamat,
            'nama_pimpinan' => $request->namaPimpinan,
            'jenis_kerjasama' => $request->kerjaSama,
            'no_kontak' => $request->nomorKontak,
            'email' => $request->email,
            'website' => $request->website,
            'kode_kecamatan' => $request->kecamatan,
            'kode_kelurahan' => $request->kelurahan,
            'created_at' => now()
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

    public function browseLembaga(Request $request)
    {
        $browse = ModelLembaga::where(function ($query) use ($request) {
            $query->where('nama', 'LIKE', '%' . $request->search . '%')
            ->orWhere('jenjang', 'LIKE', '%' . $request->search . '%')
            ->orWhere('jenis_kerjasama', 'LIKE', '%' . $request->search . '%')
            ->orWhere('jenis_lembaga', 'LIKE', '%' . $request->search . '%');
        })->paginate(10);

        return response()->json($browse);
    }

    public function detailLembaga($id)
    {
        $detail = ModelLembaga::with(['kelurahan.kecamatan'])->where('id', $id)
        ->first();

        return response()->json($detail);
    }

    public function editLembaga(Request $request)
    {
        $edit = ModelLembaga::where('id', $request->idLembaga)
        ->update([
            'nama' => $request->namaLembaga,
            'jenjang' => $request->jenjang,
            'jenis_lembaga' => $request->jenisLembaga,
            'alamat' => $request->alamat,
            'nama_pimpinan' => $request->namaPimpinan,
            'jenis_kerjasama' => $request->kerjaSama,
            'no_kontak' => $request->nomorKontak,
            'email' => $request->email,
            'website' => $request->website,
            'kode_kecamatan' => $request->kecamatan,
            'kode_kelurahan' => $request->kelurahan
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

    public function deleteLembaga(Request $request)
    {
        $delete = ModelLembaga::where('id', $request->id)
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

    public function getLembaga()
    {
        $lembaga = ModelLembaga::select('id_lembaga', 'kecamatan')->get();

        // $kecamatanCounts = $lembaga->groupBy('kecamatan')->map->count();
        $belakangPadang = $lembaga->where('kecamatan', 'Belakang Padang')->count();
        $bulang = $lembaga->where('kecamatan', 'Bulang')->count();
        $sungaiBeduk = $lembaga->where('kecamatan', 'Sungai Beduk')->count();
        $sagulung = $lembaga->where('kecamatan', 'Sagulung')->count();
        $nongsa = $lembaga->where('kecamatan', 'Nongsa')->count();
        $batamKota = $lembaga->where('kecamatan', 'Batam Kota')->count();
        $sekupang = $lembaga->where('kecamatan', 'Sekupang')->count();
        $batuAji = $lembaga->where('kecamatan', 'Batu Aji')->count();
        $lubukBaja = $lembaga->where('kecamatan', 'Lubuk Baja')->count();
        $batuAmpar = $lembaga->where('kecamatan', 'Batu Ampar')->count();
        $bengkong = $lembaga->where('kecamatan', 'Bengkong')->count();
        $galang = $lembaga->where('kecamatan', 'Galang')->count();

        return response()->json([
            'jumlah' => [$belakangPadang,
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
            
            // $belakangPadang,
            // $bulang,
            // $sungaiBeduk,
            // $sagulung,
            // $nongsa,
            // $batamKota,
            // $sekupang,
            // $batuAji,
            // $lubukBaja,
            // $batuAmpar,
            // $bengkong,
            // $galang
        ]);
    }
    
    public function getDashboardLembaga()
    {
        $jumlahLembagaPerKecamatan = ModelKecamatan::withCount(['kelurahan as lembaga_count' => function ($query) {
            $query->join('lembaga', 'lembaga.kode_kelurahan', '=', 'kelurahan.kode_kelurahan');
        }])->get();

        return response()->json($jumlahLembagaPerKecamatan);
    }
}
