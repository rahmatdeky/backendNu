<?php

namespace App\Http\Controllers\LandingPage;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Berita\ModelBerita;
use App\Models\LandingPage\ModelLandingPage;

class LandingPageController extends Controller
{
    public function getCarouselImg()
    {
        $gambar = ModelBerita::select('id_berita', 'nama_file', 'judul_berita', 'tanggal_berita')->paginate(5);

        return response()->json($gambar);
    }

    public function addCarouselImg(Request $request)
    {
        $carouselData = $request->input('carouselData');

        try {
            foreach ($carouselData as $carousel) {
                ModelLandingPage::create([
                    'url_gambar' => $carousel['url'],
                    'id_berita' => $carousel['id_berita'],
                    'judul_berita' => $carousel['judul_berita'],
                    'tanggal_berita' => $carousel['tanggal_berita'],
                    'jenis' => 'carousel'
                ]);
            }

            return response()->json([
                'title' => 'Berhasil',
                'text' => 'Data Berhasil Ditambah',
                'icon' => 'success'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'title' => 'Gagal',
                'text' => 'Data Gagal Ditambah',
                'icon' => 'error',
                'error' => $e->getMessage()
            ]);
        }
        // $urls = $request->input('urls');

        // try {
        //     // Anda mungkin perlu melakukan iterasi untuk setiap URL dan menyimpannya satu per satu.
        //     foreach ($urls as $url) {
        //         ModelLandingPage::create([
        //             'url_gambar' => $url,
        //         ]);
        //     }

        //     return response()->json([
        //         'title' => 'Berhasil',
        //         'text' => 'Data Berhasil Ditambah',
        //         'icon' => 'success'
        //     ]);
        // } catch (\Exception $e) {
        //     // Tangani kesalahan jika terjadi
        //     return response()->json([
        //         'title' => 'Gagal',
        //         'text' => 'Data Gagal Ditambah',
        //         'icon' => 'error',
        //         'error' => $e->getMessage(),
        //     ]);
        // }
    }

    public function getCarouselImgUsed ()
    {
        $gambar = ModelLandingPage::select('url_gambar', 'id', 'id_berita', 'judul_berita', 'tanggal_berita')
        ->where('jenis', 'carousel')
        ->get();

        return response()->json($gambar);
    }

    public function deleteCarouselImg (Request $request)
    {
        $delete = ModelLandingPage::where('id', $request->id)->delete();

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

    public function changeHighlight (Request $request)
    {
        $highlight = ModelLandingPage::where('jenis', 'highlight')
        ->where('seri', $request->seri)
        ->update([
            'id_berita' => $request->id_berita,
            'tanggal_berita' => $request->tanggal_berita,
            'judul_berita' => $request->judul_berita,
            'url_gambar' => $request->url_gambar
        ]);

        if ($highlight) {
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

    public function getHighlight ()
    {
        $highlight = ModelLandingPage::where('jenis', 'highlight')
        ->where('seri', '!=', null)
        ->get();
        
        $seri1 = $highlight->where('seri', 1)->first();
        $seri2 = $highlight->where('seri', 2)->first();
        $seri3 = $highlight->where('seri', 3)->first();

        return response()->json([
            'seri1' => [
                'id_berita' => $seri1->id_berita,
                'judul_berita' => $seri1->judul_berita,
                'tanggal_berita' => $seri1->tanggal_berita,
                'url_gambar' => $seri1->url_gambar
            ],
            'seri2' => [
                'id_berita' => $seri2->id_berita,
                'judul_berita' => $seri2->judul_berita,
                'tanggal_berita' => $seri2->tanggal_berita,
                'url_gambar' => $seri2->url_gambar
            ],
            'seri3' => [
                'id_berita' => $seri3->id_berita,
                'judul_berita' => $seri3->judul_berita,
                'tanggal_berita' => $seri3->tanggal_berita,
                'url_gambar' => $seri3->url_gambar
            ]
            ]);
    }
}
