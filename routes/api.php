<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\user\AuthController;
use App\Http\Controllers\SiswaController;
use App\Http\Controllers\UserController;

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
    Route::post('user/addAkses', [UserController::class, 'addAkses']);
    Route::post('user/adduser', [UserController::class, 'addUser']);
});
Route::post('/registrasi', [AuthController::class, 'registrasi']);
