<?php

namespace App\Models\Pengurus;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class modelPengurus extends Model
{
    protected $table = 'warga';
    protected $primaryKey = 'id';
    public $incrementing = false;
    public $timestamps = false;
    protected $fillable = ['id', 'nik', 'kode_kelurahan', 'kode_organisasi', 'nama', 'email', 'jabatan', 'no_hp', 'created_at', 'updated_at', 'alamat'];
}
