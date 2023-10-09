<?php

namespace App\Models\Pengurus;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class modelPengurus extends Model
{
    protected $table = 'pengurus';
    protected $primaryKey = 'id_berita';
    public $incrementing = false;
    public $timestamps = false;
    protected $fillable = ['NIK', 'nama_pengurus', 'alamat_pengurus', 'organisasi', 'jabatan', 'no_hp', 'email'];
}
