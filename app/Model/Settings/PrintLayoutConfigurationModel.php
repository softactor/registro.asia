<?php
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * PrintLayoutConfigurationModel
 */
namespace App\Model\Settings;

use Illuminate\Database\Eloquent\Model;

class PrintLayoutConfigurationModel extends Model
{
     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'print_layout_config';
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['event_id','print_config_values','created_at','updated_at'];
}


