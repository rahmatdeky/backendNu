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
    protected $fillable = ['id', 'id_user', 'id_kategori', 'judul', 'deskripsi', 'gambar', 'created_at', 'updated_at', 'view'];

    public function kategori()
    {
        return $this->belongsTo('App\Models\Referensi\kategori', 'id', 'id_kategori');
    }
}
