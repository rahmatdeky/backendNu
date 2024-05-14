<?php

namespace App\Http\Controllers\berita;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\Berita\ModelBerita;
use File;
use Illuminate\Http\Exceptions\HttpResponseException;
use Symfony\Component\HttpKernel\Exception\HttpException;

class BeritaController extends Controller
{
    public function tambahBerita(Request $request)
    {
        try {
            if ($request->hasFile('file')) {
                $file = $request->file('file');
                $fileName = $file->getClientOriginalName();
                $path = 'public/file/berita/' . $fileName;
                Storage::disk('public')->put($path, file_get_contents($file));
            }
            // $imagePath = $request->file('file')->store('public/file/berita', 'public');
    
            $berita = ModelBerita::create([
                'judul' => $request->judul,
                'deskripsi' => $request->isi,
                'id_kategori' => $request->kategori,
                'created_at' => now(),
                'tanggal' => now(),
                'gambar' => $path,
                'id_user' => auth()->user()->id
            ]);
    
            if ($berita) {
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
        } catch (\Exception $e) {
            return response()->json([
                'title' => 'gagal',
                'text' => $e->getMessage(),
                'icon' => 'error'
            ], 400); // Bad Request
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
        $berita = ModelBerita::with('kategori')->where(function ($query) use ($request) {
            $query->where('judul', 'LIKE', '%' . $request->search . '%')
            ->orWhere('created_at', 'LIKE', '%' . $request->search . '%');
            // ->orWhere('id_kategori', 'LIKE', '%' . $request->search . '%');
        })
        ->orWhereHas('kategori', function ($query) use ($request) {
            $query->where('nama', 'LIKE', '%' . $request->search . '%');
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

            $editFile = ModelBerita::where('id', $request->id_berita)
            ->update([
                'gambar' => $path
            ]);
        }
        // $imagePath = $request->file('file')->store('public/file/berita', 'public');

        $edit = ModelBerita::where('id', $request->id_berita)
        ->update([
            'tanggal' => $request->tanggal_berita,
            'judul' => $request->judul_berita,
            'deskripsi' => $request->isi_berita,
            'id_kategori' => $request->kategori
        ]);

        if ($edit && $editFile) {
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
        $getUrlFileBerita = ModelBerita::where('id', $request->id_berita)
        ->value('gambar');
        
        $deleteFile = Storage::delete('public/' . $getUrlFileBerita);
        
        $deleteBerita = ModelBerita::where('id', $request->id_berita)
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
        $guestBerita = ModelBerita::orderBy('created_at', 'desc')
        ->paginate(4);

        return response()->json($guestBerita);
    }

    public function guestDetailBerita($id)
    {
        $guestDetailBerita = ModelBerita::with('kategori')->where('id', $id)
        ->first();

        return response()->json($guestDetailBerita);
    }
}
