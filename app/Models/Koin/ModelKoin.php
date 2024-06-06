<?php

namespace App\Models\Koin;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelKoin extends Model
{
    use HasFactory;
    protected $table = 'koin_nu';
    protected $primaryKey = 'id';
    public $incrementing = false;
    public $timestamps = false;
    protected $fillable = ['id', 'jenis', 'nominal', 'keterangan', 'tanggal', 'nik', 'id_user'];

    public function warga()
    {
        return $this->belongsTo('App\Models\Pengurus\modelPengurus', 'nik', 'nik');
    }
}
