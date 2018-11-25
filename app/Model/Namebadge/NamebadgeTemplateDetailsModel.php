<?php

namespace App\Model\Namebadge;

use Illuminate\Database\Eloquent\Model;

class NamebadgeTemplateDetailsModel extends Model
{
     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'namebadge_template_details';
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['config_id','template_name','image_path','created_at','updated_at'];
}
