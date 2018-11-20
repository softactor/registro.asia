<?php

namespace App\Model\Namebadge;

use Illuminate\Database\Eloquent\Model;

class NamebadgePositionModel extends Model
{
     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'name_badge_position';
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['event_id','name_badge_id','field_id','left_value','top_value','left_absulate_value','top_absulate_value','created_at','updated_at'];
}
