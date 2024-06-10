<?php

namespace App\Http\Controllers\koin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Koin\ModelKoin;

class KoinController extends Controller
{
    public function tambahKoin(Request $request)
    {
        if ($request->nik == null) {
            $user = auth()->user();
        } else {
            $user = null;
        }
        $tambah = ModelKoin::create([
            'jenis' => $request->jenis,
            'nominal' => $request->nominal,
            'keterangan' => $request->keterangan,
            'nik' => $request->nik,
            'tanggal' => now(),
            'id_user' => $user ? $user->id : null
        ]);

        if ($tambah) {
            return response()->json([
                'title' => 'Berhasil',
                'text' => 'Data Berhasil Ditambahkan',
                'icon' => 'success'
            ]);
        } else {
            return response()->json([
                'title' => 'Gagal',
                'text' => 'Data Gagal Ditambahkan',
                'icon' => 'error'
            ]);
        }
    }

    public function browseKoin(Request $request)
    {
        $tipe = $request->input('tipe');
        $from = $request->input('from');
        $to = $request->input('to');

        $query = ModelKoin::with('warga')->where(function ($query) use ($request) {
            $query->where('keterangan', 'LIKE', '%' . $request->search . '%')
                ->orWhere('nominal', 'LIKE', '%' . $request->search . '%')
                ->orWhereHas('warga', function ($q) use ($request) {
                    $q->where('nama', 'LIKE', '%' . $request->search . '%');
                });
        });

        if ($tipe === 'Pemasukan') {
            $query->where('jenis', 1);
        } elseif ($tipe === 'Pengeluaran') {
            $query->where('jenis', 2);
        }

        if ($from && $to) {
            // Jika kedua tanggal sama, gunakan whereDate
            if ($from === $to) {
                $query->whereDate('tanggal', $from);
            } else {
                // Tambahkan satu hari ke tanggal akhir untuk mencakup seluruh hari terakhir
                $to = date('Y-m-d', strtotime($to . ' +1 day'));
                $query->whereBetween('tanggal', [$from, $to]);
            }
        }

        $koin = $query->orderby('tanggal', 'desc')->paginate(10);

        return response()->json($koin);
    }

    public function getTotal(Request $request)
    {
        $from = $request->input('fromSaldo');
        $to = $request->input('toSaldo');

        // Handle the case where the to date needs to include the whole day
        if ($from && $to && $from !== $to) {
            $to = date('Y-m-d', strtotime($to . ' +1 day'));
        }

        // Query for total pemasukan
        $queryPemasukan = ModelKoin::query();

        if ($from && $to) {
            if ($from === $to) {
                $queryPemasukan->whereDate('tanggal', $from);
            } else {
                $queryPemasukan->whereBetween('tanggal', [$from, $to]);
            }
        }

        $totalPemasukan = $queryPemasukan->where('jenis', 'Pemasukan')->sum('nominal');
        $totalPemasukan = floatval($totalPemasukan);

        // Query for total pengeluaran
        $queryPengeluaran = ModelKoin::query();

        if ($from && $to) {
            if ($from === $to) {
                $queryPengeluaran->whereDate('tanggal', $from);
            } else {
                $queryPengeluaran->whereBetween('tanggal', [$from, $to]);
            }
        }

        $totalPengeluaran = $queryPengeluaran->where('jenis', 'Pengeluaran')->sum('nominal');
        $totalPengeluaran = floatval($totalPengeluaran);

        $saldo = $totalPemasukan - $totalPengeluaran;

        return response()->json([
            'total_pemasukan' => $totalPemasukan,
            'total_pengeluaran' => $totalPengeluaran,
            'saldo' => $saldo
        ]);
    }



}
