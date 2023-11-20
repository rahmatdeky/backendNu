<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelKecamatan extends Model
{
    protected $table = 'ref_kecamatan';
    protected $primaryKey = 'id_kecamatan';
    public $incrementing = false;
    public $timestamps = false;
    protected $fillable = ['id_kecamatan', 'nama_kecamatan'];

    public function kelurahan()
    {
        return $this->hasMany('App\Models\ModelKelurahan', 'id_kecamatan', 'id_kecamatan');
    }
}

