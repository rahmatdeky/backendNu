<?php

namespace App\Models\Lembaga;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelLembaga extends Model
{
    protected $table = 'lembaga';
    protected $primaryKey = 'id_lembaga';
    public $incrementing = false;
    public $timestamps = false;
    protected $fillable = ['id_lembaga', 'nama_lembaga', 'jenjang', 'jenis_lembaga', 'alamat', 'nama_pimpinan', 'jenis_kerjasama', 'no_kontak', 'email', 'website'];
}
