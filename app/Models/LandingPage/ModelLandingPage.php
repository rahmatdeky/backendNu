<?php

namespace App\Models\LandingPage;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelLandingPage extends Model
{
    protected $table = 'landing_page';
    protected $primaryKey = 'id';
    public $incrementing = false;
    public $timestamps = false;
    protected $fillable = ['id', 'id_berita', 'jenis', 'tanggal_berita', 'judul_berita', 'isi_berita', 'kategori', 'url_gambar', 'seri'];
}
