<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{    
    protected $guarded = [];

    protected $table = 'users';
}
