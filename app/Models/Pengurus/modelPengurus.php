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

    public function kelurahan()
    {
        return $this->belongsTo('App\Models\Referensi\ModelKelurahan', 'kode_kelurahan', 'kode_kelurahan');
    }

    public function organisasi()
    {
        return $this->belongsTo('App\Models\Referensi\ModelOrganisasi', 'kode_organisasi', 'kode_organisasi');
    }
}

