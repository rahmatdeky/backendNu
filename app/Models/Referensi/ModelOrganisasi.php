<?php

namespace App\Models\Referensi;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelOrganisasi extends Model
{
    use HasFactory;
    protected $table = "organisasi";
    protected $primaryKey = 'kode_organisasi';
    public $incrementing = false;
    public $timestamps = false;
    protected $fillable = ['kode_organisasi', 'nama', 'created_at', 'updated_at'];

    public function warga()
    {
        return $this->hasMany('App\Models\Pengurus\modelPengurus', 'kode_organisasi', 'kode_organisasi');
    }
}
