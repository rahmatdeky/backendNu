<?php

namespace App\Models\Berita;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelBerita extends Model
{
    protected $table = 'berita';
    protected $primaryKey = 'id_berita';
    public $incrementing = false;
    public $timestamps = false;
    protected $fillable = ['id_berita', 'tanggal_berita', 'judul_berita', 'isi_berita', 'kategori', 'nama_file'];
}
