<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelKelurahan extends Model
{
    protected $table = 'ref_kelurahan';
    protected $primaryKey = 'id_kelurahan';
    public $incrementing = false;
    public $timestamps = false;
    protected $fillable = ['id_kelurahan', 'id_kecamatan', 'nama_kelurahan', 'kode_pos'];

    public function kecamatan()
    {
        return $this->belongsTo('App\Models\ModelKecamatan', 'id_kecamatan', 'id_kecamatan');
    }
}
