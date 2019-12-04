<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property int $user_id
 * @property int $movie_id
 * @property string $created_at
 * @property string $return_deadline
 * @property string $return_date
 * @property string $updated_at
 * @property string $penalty
 * @property Movie $movie
 * @property User $user
 */
class Rental extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'rental';

    /**
     * @var array
     */
    protected $fillable = ['user_id', 'movie_id', 'created_at', 'return_deadline', 'return_date', 'updated_at', 'penalty'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function movie()
    {
        return $this->belongsTo('App\Movie');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo('App\User');
    }
}
