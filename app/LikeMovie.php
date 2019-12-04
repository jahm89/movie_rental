<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $user_id
 * @property int $movie_id
 * @property string $created_at
 * @property string $updated_at
 */
class LikeMovie extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'like_movie';

    /**
     * @var array
     */
    protected $fillable = ['created_at', 'updated_at'];

}
