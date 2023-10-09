<?php

namespace App\Http\Controllers\berita;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\Berita\ModelBerita;
use File;

class BeritaController extends Controller
{
    public function tambahBerita(Request $request)
    {
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $fileName = $file->getClientOriginalName();
            $path = 'public/file/berita/' . $fileName;
            Storage::disk('public')->put($path, file_get_contents($file));
        }
        // $imagePath = $request->file('file')->store('public/file/berita', 'public');

        $berita = ModelBerita::create([
            'judul_berita' => $request->judul,
            'isi_berita' => $request->isi,
            'kategori' => $request->kategori,
            'tanggal_berita' => now(),
            'nama_file' => $path
        ]);

        if ($berita) {
            return response()->json([
                'status' => 'berhasil'
            ]);
        } else {
            return response()->json([
                'status' => 'gagal'
            ]);
        }
    }

    // public function tambahBerita(Request $request)
    // {
    //     $berita = new ModelBerita;
    //     $imageName = $request->judul . '.' . $request->file->extension();
    //     $path = public_path('berita');
    //     $berita->nama_file = $imageName;
    //     $berita->judul_berita = $request->judul;
    //     $berita->tanggal_berita = now();
    //     $berita->isi_berita = $request->isi;
    //     $berita->kategori = $request->kategori;
    //     $berita->url_file = $path;
    //     $berita->save();

    //     $request->file->move(public_path('berita'), $imageName);
    //     return response()->json([
    //         'pesan' => 'sukses'
    //     ]);
    // }

    public function browseBerita(Request $request)
    {
        $berita = ModelBerita::where(function ($query) use ($request) {
            $query->where('judul_berita', 'LIKE', '%' . $request->search . '%')
            ->orWhere('tanggal_berita', 'LIKE', '%' . $request->search . '%')
            ->orWhere('kategori', 'LIKE', '%' . $request->search . '%');
        })
        // ->where(function ($quer) use ($request) {
        //     $quer->where('email', 'LIKE', '%' . $request->email . '%');
        // })
        ->paginate(10);
        return response()->json($berita);
    }

    public function editBerita(Request $request)
    {
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $fileName = $file->getClientOriginalName();
            $path = 'public/file/berita/' . $fileName;

            Storage::delete('public/' . $request->url);
            Storage::disk('public')->put($path, file_get_contents($file));

            $editFile = ModelBerita::where('id_berita', $request->id_berita)
            ->update([
                'nama_file' => $path
            ]);
        }
        // $imagePath = $request->file('file')->store('public/file/berita', 'public');

        $edit = ModelBerita::where('id_berita', $request->id_berita)
        ->update([
            'tanggal_berita' => $request->tanggal_berita,
            'judul_berita' => $request->judul_berita,
            'isi_berita' => $request->isi_berita,
            'kategori' => $request->kategori
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

    public function hapusBerita(Request $request)
    {
        $getUrlFileBerita = ModelBerita::where('id_berita', $request->id_berita)
        ->value('nama_file');
        
        $deleteFile = Storage::delete('public/' . $getUrlFileBerita);
        
        $deleteBerita = ModelBerita::where('id_berita', $request->id_berita)
        ->delete();

        if ($deleteFile && $deleteBerita) {
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

    public function guestBrowseBerita()
    {
        $guestBerita = ModelBerita::orderBy('tanggal_berita', 'desc')
        ->paginate(2);

        return response()->json($guestBerita);
    }

    public function guestDetailBerita($id)
    {
        $guestDetailBerita = ModelBerita::where('id_berita', $id)
        ->first();

        return response()->json($guestDetailBerita);
    }
}
