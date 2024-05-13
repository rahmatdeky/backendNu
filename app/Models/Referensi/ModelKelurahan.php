<?php

namespace App\Models\Referensi;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelKelurahan extends Model
{
    protected $table = 'kelurahan';
    protected $primaryKey = 'kode_kelurahan';
    public $incrementing = false;
    public $timestamps = false;
    protected $fillable = ['kode_kelurahan', 'kode_kecamatan', 'nama_kelurahan', 'created_at', 'updated_at'];

    public function kecamatan()
    {
        return $this->belongsTo('App\Models\Referensi\ModelKecamatan', 'id_kecamatan', 'id_kecamatan');
    }
}
