<?php

namespace App\Models\Lembaga;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelLembaga extends Model
{
    protected $table = 'lembaga';
    protected $primaryKey = 'id';
    public $incrementing = false;
    public $timestamps = false;
    protected $fillable = ['id', 'kode_kelurahan', 'kode_kecamatan', 'nama', 'alamat', 'jenjang', 'jenis_lembaga', 'email', 'website', 'no_kontak', 'created_at', 'updated_at', 'jenis_kerjasama', 'nama_pimpinan'];
}
