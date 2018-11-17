<?php

namespace App\Model\Namebadge;

use Illuminate\Database\Eloquent\Model;

class NamebadgeConfigModel extends Model
{
     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'name_badge_config';
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['event_id','namebadge_width','namebadge_height','namebadge_orientation','image_path','measure_unit','created_at','updated_at'];
}
