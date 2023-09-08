<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Siswa extends Model
{
    protected $table = 'td_siswa';
    protected $primaryKey = 'id_siswa';
    public $incrementing = false;
    public $timestamps = false;
    protected $fillable = ['id_siswa', 'nama_siswa', 'alamat_siswa'];
}
