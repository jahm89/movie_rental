<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $text
 * @property string $type
 */
class Log extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'log';

    /**
     * @var array
     */
    protected $fillable = ['text', 'type'];

}
