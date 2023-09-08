<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\user\AuthController;
use App\Http\Controllers\SiswaController;

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
    Route::prefix('/setting')->group(function () {
        Route::get('/users', [usersController::class, 'index']);
        Route::get('/users/{id}', [usersController::class, 'showUser']);
    });
    Route::get('/siswa', [SiswaController::class, 'index']);
    Route::post('/gantiPw', [AuthController::class, 'gantiPw']);
    Route::get('/getAccess', [AuthController::class, 'getAccess']);
});
Route::post('/registrasi', [AuthController::class, 'registrasi']);
