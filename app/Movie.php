<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $name
 * @property string $title
 * @property string $description
 * @property int $stock
 * @property float $rental_price
 * @property float $sale_price
 * @property boolean $availability
 * @property float $monetary_penalty
 * @property string $created_at
 * @property string $updated_at
 * @property Image[] $images
 * @property Purchase[] $purchases
 * @property Rental[] $rentals
 * @property User[] $users
 */
class Movie extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'movie';

    /**
     * @var array
     */
    protected $fillable = ['name', 'title', 'description', 'stock', 'rental_price', 'sale_price', 'availability', 'monetary_penalty', 'created_at', 'updated_at'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function images()
    {
        return $this->hasMany('App\Image');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function purchases()
    {
        return $this->hasMany('App\Purchase');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function rentals()
    {
        return $this->hasMany('App\Rental');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function users()
    {
        return $this->belongsToMany('App\User', 'user_like_this_movie');
    }
}
