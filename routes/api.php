<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\user\AuthController;
use App\Http\Controllers\SiswaController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\berita\BeritaController;
use App\Http\Controllers\pengurus\pengurusController;
use App\Http\Controllers\lembaga\lembagaController;
use App\Http\Controllers\LandingPage\LandingPageController;
use App\Http\Controllers\referensi\ReferensiController;
use App\Http\Controllers\koin\KoinController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('login', [AuthController::class, 'login']);
Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('logout', [AuthController::class, 'logout']);
    Route::get('me', [AuthController::class, 'me']);
    Route::get('/siswa', [SiswaController::class, 'index']);
    Route::post('/gantiPw', [AuthController::class, 'gantiPwbySelf']);
    Route::get('/getAccess', [AuthController::class, 'getAccess']);

    // User Manajer
    Route::post('/getUser', [UserController::class, 'getUser']);
    Route::get('/getUser/detail/{email}', [UserController::class, 'getUserDetail']);
    Route::get('/getUser/listAkses', [UserController::class, 'getListAkses']);
    Route::put('/user/updateData', [UserController::class, 'updateUser']);
    Route::put('/user/updatePwbyAdmin', [AuthController::class, 'updatePwbyAdmin']);
    Route::post('user/delete', [UserController::class, 'deleteUser']);
    Route::post('user/addAkses', [UserController::class, 'addAkses']);
    Route::post('user/adduser', [UserController::class, 'addUser']);
    Route::post('user/akses/delete', [UserController::class, 'deleteAkses']);
    Route::post('/user/gantiGambar', [UserController::class, 'gantiGambar']);

    // Manajemen Berita
    Route::post('/berita/tambah', [BeritaController::class, 'tambahBerita']);
    Route::post('/berita/browse', [BeritaController::class, 'browseBerita']);
    Route::post('/berita/edit', [BeritaController::class, 'editBerita']);
    Route::post('/berita/delete', [BeritaController::class, 'hapusBerita']);

    // Warga
    Route::post('/warga/tambah', [pengurusController::class, 'tambahPengurus']);
    Route::get('/warga/detail/{NIK}', [pengurusController::class, 'getDetailPengurus']);
    Route::post('/warga/detail/edit', [pengurusController::class, 'editDetailPengurus']);
    Route::post('/warga/delete', [pengurusController::class, 'deletePengurus']);
    
    // Lembaga
    Route::post('/lembaga/tambah', [lembagaController::class, 'tambahLembaga']);
    Route::get('/lembaga/detail/{id}', [lembagaController::class, 'detailLembaga']);
    Route::post('/lembaga/detail/edit', [lembagaController::class, 'editLembaga']);
    Route::post('/lembaga/delete', [lembagaController::class, 'deleteLembaga']);
    
    // Setting Carousel
    Route::get('/page/landing/carousel/image', [LandingPageController::class, 'getCarouselImg']);
    Route::post('/page/landing/carousel/image/add', [LandingPageController::class, 'addCarouselImg']);
    Route::post('/page/landing/carousel/image/delete', [LandingPageController::class, 'deleteCarouselImg']);
    
    // Setting Highlight Berita
    Route::put('/page/landing/highlihgt/change', [LandingPageController::class, 'changeHighlight']);

    // Referensi
    Route::get('/refKecamatan', [pengurusController::class, 'getRefKecamatan']);
    Route::post('ref/kategori/add', [ReferensiController::class, 'addKategori']);
    Route::post('ref/kategori/browse', [ReferensiController::class, 'browseKategori']);
    Route::post('ref/kategori/edit', [ReferensiController::class, 'editKategori']);
    Route::post('ref/kecamatan/add', [ReferensiController::class, 'addKecamatan']);
    Route::post('ref/kecamatan/edit', [ReferensiController::class, 'editKecamatan']);
    Route::get('ref/kecamatan/browse', [ReferensiController::class, 'browseKecamatan']);
    Route::post('ref/kelurahan/add', [ReferensiController::class, 'addKelurahan']);
    Route::get('ref/kelurahan/browse', [ReferensiController::class, 'browseKelurahan']);
    Route::post('ref/kelurahan/edit', [ReferensiController::class, 'editKelurahan']);
    Route::post('ref/organisasi/add', [ReferensiController::class, 'addOrganisasi']);
    Route::get('ref/organisasi/browse', [ReferensiController::class, 'browseOrganisasi']);
    Route::post('ref/organisasi/edit', [ReferensiController::class, 'editOrganisasi']);
    Route::get('ref/warga', [pengurusController::class, 'getRefWarga']);

    // KOIN
    Route::post('koin/tambah', [KoinController::class, 'tambahKoin']);
    Route::post('koin/browse', [KoinController::class, 'browseKoin']);
    Route::post('koin/total', [KoinController::class, 'getTotal']);

    // Dashboard
    Route::get('dashboard/warga', [pengurusController::class, 'getDashboardWarga']);
    Route::get('dashboard/lembaga', [lembagaController::class, 'getDashboardLembaga']);
    Route::get('dashboard/lembaga/total', [lembagaController::class, 'getTotalLembaga']);
    Route::get('dashboard/warga/total', [pengurusController::class, 'getTotalWarga']);
});
Route::post('/registrasi', [AuthController::class, 'registrasi']);

// Guest Berita
Route::get('/berita/guest/browse', [BeritaController::class, 'guestBrowseBerita']);
Route::get('/berita/guest/detail/{id}', [BeritaController::class, 'guestDetailBerita']);
Route::get('/berita/guest/populer', [BeritaController::class, 'guestPopulerBerita']);
Route::get('/ref/kategori/browse', [ReferensiController::class, 'browseKategori']);

// Get Carousel
Route::get('/page/landing/carousel/image/used', [LandingPageController::class, 'getCarouselImgUsed']);

// Get Highlight Berita
Route::get('/page/landing/highlihgt/get', [LandingPageController::class, 'getHighlight']);

// Get Pengurus
Route::post('/warga/browse', [pengurusController::class, 'browsePengurus']);
Route::get('get/pengurus', [pengurusController::class, 'getPengurus']);
Route::get('get/kecamatan', [pengurusController::class, 'getKecamatan']);

// Get Lembaga
Route::post('/lembaga/browse', [lembagaController::class, 'browseLembaga']);
Route::get('get/lembaga', [lembagaController::class, 'getLembaga']);