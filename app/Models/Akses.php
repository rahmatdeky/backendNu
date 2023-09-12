<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Akses extends Model
{
    protected $table = 'akses';
    protected $primaryKey = 'id';
    public $incrementing = false;
    public $timestamps = false;
    protected $fillable = ['id', 'email', 'akses', 'id_user'];

    public function user()
    {
        return $this->belongsTo('App\Models\Users', 'id', 'id_user');
    }
}
