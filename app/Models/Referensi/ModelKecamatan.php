<?php

namespace App\Models\Referensi;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelKecamatan extends Model
{
    protected $table = 'kecamatan';
    protected $primaryKey = 'kode_kecamatan';
    public $incrementing = false;
    public $timestamps = false;
    protected $fillable = ['kode_kecamatan', 'kode_kemendagri', 'nama_kecamatan', 'created_at', 'updated_at'];

    public function kelurahan()
    {
        return $this->hasMany('App\Models\Referensi\ModelKelurahan', 'kode_kecamatan', 'kode_kecamatan');
    }
}

