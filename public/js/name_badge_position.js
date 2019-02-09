$(function () {
    $(".draggable").draggable();
    $( "#containment-wrapper" ).droppable({
        drop: function (event, ui) {
            var elem = $(this)
                    .addClass("ui-state-highlight")
            var draggableId = ui.draggable.attr("id");
            $("#" + draggableId).addClass("droped_item_identity");
            var pos = ui.draggable.offset(), dPos = $(this).offset();
//            console.log("nodeid: " + ui.draggable.data("noteid") +
//                    ", Top: " + (pos.top - dPos.top) +
//                    ", Left: " + (pos.left - dPos.left));
            $("#" + draggableId).attr("data-left",(pos.left - dPos.left));
            $("#" + draggableId).attr("data-top",(pos.top - dPos.top));
            
            // try to preview the drag and drop:
            var show_id =   'preview_'+draggableId;
            $('#'+show_id).show();
            $('#'+show_id).css('left', (pos.left - dPos.left));
            $('#'+show_id).css('top', (pos.top - dPos.top));
        }
    });
});

//$(document).on("mouseup", ".draggable", function () {
//
//    var elem = $(this),
//            id = elem.attr('id'),
//            desc = elem.attr('data-desc'),
//            pos = elem.position();
//            $('#'+id).attr("data-left",pos.left);
//            $('#'+id).attr("data-top",pos.top);
////    console.log('Left: ' + pos.left + '; Top:' + pos.top);
//
//});

function save_position(){
    var dataParam   =   [];
    var namebadgeTypeVal    =   $('input[name=eventNameBadgeTemplateType]:checked').val();
    if(namebadgeTypeVal ==  'Default'){
        var namebadgeSetVal    =   $('input[name=eventNameBadgeTemplateSet]:checked').val();
        $.ajax({
            type: 'POST',
            url: $('#position_store').val(),
            dataType:'json',
            data: 'namebadgeSetVal='+namebadgeSetVal+'&event_id='+$('#event_id').val()+'&name_badge_id='+$('#name_badge_id').val()+'&image_path='+$('#default_image_path').val()+'&namebadgeTypeVal='+namebadgeTypeVal,
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
            },
            success: function (response) {
                if (response.status == 'success') {
                    swal("Position Saved", response.message, "success");
                    setTimeout(function () {
                        location.reload();
                    }, 2000);
                }else{
                    swal("Error!", response.message, "error");
                }
            }
        })
    }else{
        $(".droped_item_identity").each(function () {
            var elem = $(this),
                    id                  = elem.attr('id');
                    newleft             = elem.attr('data-left'),
                    newtop              = elem.attr('data-top');
                    left_absulate_value = elem.attr('data-absulate-left'),
                    top_absulate_value  = elem.attr('data-absulate-top');
            var dataParamObj = {
                'field_id'                  : id,
                'newleft'                   : newleft,
                'newtop'                    : newtop,
                'left_absulate_value'       : left_absulate_value,
                'top_absulate_value'        : top_absulate_value,
                'event_id'                  : $('#event_id').val(),
                'name_badge_id'             : $('#name_badge_id').val()
            };
            dataParam.push(dataParamObj);
        })
        $.ajax({
            type: 'POST',
            url: $('#position_store').val(),
            dataType:'json',
            data: 'dataParam='+JSON.stringify(dataParam)+'&event_id='+$('#event_id').val()+'&name_badge_id='+$('#name_badge_id').val()+'&image_path='+$('#image_path').val(),
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
            },
            success: function (response) {
                if (response.status == 'success') {
                    swal("Position Saved", response.message, "success");
                    setTimeout(function () {
                        location.reload();
                    }, 2000);
                }else{
                    swal("Error!", response.message, "error");
                }
            }
        })
    }
}

function set_event_namebadge_template(event_id, url){
    if(event_id){
        $.ajax({
            type: 'GET',
            url: url,
            dataType: 'json',
            data: 'event_id='+event_id,
            success: function (response) {
//                console.log(response);
                if (response.status == 'success') {                    
                    
                    $('#name_badge_id').val(response.data.id);
                    $('#eventnameBadgeTemplateModal').modal('show');
                    $('#content_loader').hide();                    
                    $('#event_title').html(response.events_title);
//                    $('.nameBadgeHeader').attr('src',response.events_header);
                    $('#event_header').val(response.events_header);
                    if(response.name_badge_position_status){
                        $(".edit_field_class").remove();
                        $("#containment-wrapper").append(response.positionEditView);
                    }
                    
                    if(response.templates_details_status){
                        $("#default_image_path").html(response.templates_detailsDropDown);
                        $("#image_path").html(response.templates_detailsDropDown);
                    }else{
                        $("#image_path").html("");
                        $("#default_image_path").html("");
                    }
                    if(response.namebadgeTemplateType == 'Default'){
                        $('#defaultRadio').prop('checked',true);
                        $('#customeRadio').prop('checked',false);
                        //namebadgeTemplateTypeConf
                        if(response.namebadgeTemplateTypeConf.nameBadgeTemplateSet == 'defaultEventNameBadge1'){
                            $('#defaultEventNameBadge1').prop('checked',true);
                        }else if(response.namebadgeTemplateTypeConf.nameBadgeTemplateSet == 'defaultEventNameBadge2'){
                            $('#defaultEventNameBadge2').prop('checked',true);
                        }else if(response.namebadgeTemplateTypeConf.nameBadgeTemplateSet == 'defaultEventNameBadge3'){
                            $('#defaultEventNameBadge3').prop('checked',true);
                        }                        
                        $('#default_image_path').val(response.namebadgeTemplateTypeConf.background_image);
                    }
                    
                    if(response.namebadgeTemplateType == 'Custom'){
                        $('#customeRadio').prop('checked',true);
                        $('#defaultRadio').prop('checked',false);
                    }
                }else{
                    $('#content_loader').hide();
                    $("#image_path").html("");
                    $('#event_title').html(response.events_title);
                    $('#containment-wrapper').css('background-image', '');
                    $('#containment-wrapper-preview').css('background-image', '');
                    swal("Error!", response.message, "error");
                }
            }
        })
    }
}

function showTheNameBadgeContainer(templateType){
    if(templateType == 'Default'){
        $('#default_template_section').show('slow');
        $('#custom_template_section').hide('slow');
    }else{
        $('#default_template_section').hide('slow');
        $('#custom_template_section').show('slow');
    }
}

function set_event_namebadge_background(event_id, url){
    if(event_id){
        $('#content_loader').show();
    $.ajax({
            type: 'GET',
            url: url,
            dataType: 'json',
            data: 'event_id='+event_id,
            success: function (response) {
                console.log(response);
                if (response.status == 'success') {
                    $('#content_loader').hide();                    
                    var imageUrl = $('#namebadge_bg_image_path').val() + '/' + response.data.image_path;
                    $('#containment-wrapper').css('background-image', 'url(' + imageUrl + ')');
                    $('#containment-wrapper').css('background-repeat', 'no-repeat');
                    $('#containment-wrapper').css('width', response.data.namebadge_width + response.data.measure_unit);
                    $('#containment-wrapper').css('height', response.data.namebadge_height + response.data.measure_unit);
                    $('#name_badge_id').val(response.data.id);
                    
                    // for preview:
                    
                    $('#containment-wrapper-preview').css('background-image', 'url(' + imageUrl + ')');
                    $('#containment-wrapper-preview').css('background-repeat', 'no-repeat');
                    $('#containment-wrapper-preview').css('width', response.data.namebadge_width + response.data.measure_unit);
                    $('#containment-wrapper-preview').css('height', response.data.namebadge_height + response.data.measure_unit);
                    
                    // preview end:
                    
                    if(response.name_badge_position_status){
                        $(".edit_field_class").remove();
                        $("#containment-wrapper").append(response.positionEditView);
                    }
                    
                    if(response.templates_details_status){
                        $("#image_path").html(response.templates_detailsDropDown);
                    }else{
                        $("#image_path").html("");
                    }
                }else{
                    $('#content_loader').hide();
                    $("#image_path").html("");
                    $('#containment-wrapper').css('background-image', '');
                    $('#containment-wrapper-preview').css('background-image', '');
                    swal("Error!", response.message, "error");
                }
                $("#image_path").val(response.data.image_path).attr("selected", "selected");;
            }
        })
    }
}

function update_event_namebadge_background(image_path, url){
    $.ajax({
            type: 'GET',
            url: url,
            dataType: 'json',
            data: 'name_badge_config_id='+$('#name_badge_id').val(),
            success: function (response) {
                if (response.status == 'success') {
                    $('.nameBadgeHeader').attr('src',$('#event_header').val());
                    var imageUrl = $('#namebadge_bg_image_path').val() + '/' + image_path;
                    $('#containment-wrapper').css('background-image', 'url(' + imageUrl + ')');
                    $('#containment-wrapper').css('background-repeat', 'no-repeat');
                    $('#containment-wrapper').css('width', response.name_badge_config.namebadge_width + response.name_badge_config.measure_unit);
                    $('#containment-wrapper').css('height', response.name_badge_config.namebadge_height + response.name_badge_config.measure_unit);
                    // for preview:
                    
                    $('#containment-wrapper-preview').css('background-image', 'url(' + imageUrl + ')');
                    $('#containment-wrapper-preview').css('background-repeat', 'no-repeat');
                    $('#containment-wrapper-preview').css('width', response.name_badge_config.namebadge_width + response.name_badge_config.measure_unit);
                    $('#containment-wrapper-preview').css('height', response.name_badge_config.namebadge_height + response.name_badge_config.measure_unit);
                    
                    // preview end:
                }else{
                    swal("Error!", response.message, "error");
                }
            }
        }) 
}

function confirmFieldDelete(del_id, del_url) {
    swal({
        title: 'Do you want to delete it?',
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Yes",
        cancelButtonText: 'No',
        closeOnConfirm: false
    },
    function () {
        $.ajax({
            url: del_url,
            type: 'GET',
            dataType: 'json',
            data: 'del_id=' + del_id,
            success: function (response) {
                if (response.status == 'success') {
                    $('#del_id_'+del_id).hide();
                    swal("Delete complete", response.message, "success");
                }
            },
            async: false // <- this turns it into synchronous
        });
    });
}

function deleteNameBadgeSavedTemplate(del_id, del_url) {
    swal({
        title: 'Do you want to delete it?',
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Yes",
        cancelButtonText: 'No',
        closeOnConfirm: false
    },
    function () {
        $.ajax({
            url: del_url,
            type: 'GET',
            dataType: 'json',
            data: 'del_id=' + del_id,
            success: function (response) {
                if (response.status == 'success') {
                    $('#del_id_'+del_id).hide();
                    swal("Delete complete", response.message, "success");
                }
            },
            async: false // <- this turns it into synchronous
        });
    });
}

function getNameBadgeConfigDetails(event_id, url) {
    if (event_id) {
        $('#content_loader').show();
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'json',
            data: 'event_id=' + event_id,
            success: function (response) {
                if (response.status == 'success') {
                    $('#saved_templates_area').show();
                    $('#content_loader').hide();
                    $('#measure_unit').val(response.data.measure_unit);
                    $('#namebadge_width').val(response.data.namebadge_width);
                    $('#namebadge_height').val(response.data.namebadge_height);
                    $('#namebadge_orientation').val(response.data.namebadge_orientation);
                    if(response.templates_details_status){
                        $('#saved_templates_area').html(response.templates_detailsViewRender);
                    }
                    $('#config_saved_button').val('Update');
                }else{
                    $('#content_loader').hide();
                    $('#saved_templates_area').hide();
                    $('#measure_unit').val('');
                    $('#namebadge_width').val('');
                    $('#namebadge_height').val('');
                    $('#namebadge_orientation').val(''); 
                    $("#previous_bg_template").hide();
                    $("#previous_bg_template_img").attr("src",'');
                    $('#config_saved_button').val('Create');
                }
            },
            async: false // <- this turns it into synchronous
        });
    }else{
        $('#content_loader').hide();
        $('#measure_unit').val('');
        $('#namebadge_width').val('');
        $('#namebadge_height').val('');
        $('#namebadge_orientation').val('');
        $("#previous_bg_template").hide();
        $("#previous_bg_template_img").attr("src",'');
    }
}

// trying to load this method when mouse over from namebadge position fields:
function displayStyleEditorEnableSection(id){
    $('.font_style_and_delete_class_section').show();
    $('.font_style_and_delete_class_section').not('#' + id).hide();
}
// open the font style modal:
function openStyleEditor(id, fieldsName){
    $('#nameBadgeFieldsId').val(id);
    $('#fieldsName').html(fieldsName);
    $("#name_badge_fields_font_style_edit").modal();
    
    $('#font_unit').val($('#badge_field_font_unit_'+id).val());
    $('#font_size').val($('#badge_field_font_size_'+id).val());
    $('#font_weight').val($('#badge_field_font_weight_'+id).val());
    
}
// store font style data:
function saveNamebadgeFontStyle(url){
    $.ajax({
        type: 'POST',
        url: url,
        dataType:'json',
        data: $("#namebadgefontstyleForm").serialize(),
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
        },
        success: function (response) {
            if (response.status == 'success') {
                // updated the new value
                var id  =   $('#nameBadgeFieldsId').val();
                $('#badge_field_font_color_'+id).val(response.data.font_color);
                $('#badge_field_font_size_'+id).val(response.data.font_size);
                $('#badge_field_font_weight_'+id).val(response.data.font_weight);
                
                // in form deselect all values
                $('#nameBadgeFieldsId').val('');
                $('#font_color').val('#000000');
                $('#font_size').val('');
                $('#font_weight').val('');
                $('#name_badge_fields_font_style_edit').modal('hide');
                swal("Font style updated", response.message, "success");
            }else{
                swal("Error!", response.message, "error");
            }
        }
    })
}

function add_more_templates(){
        var cln= $("#template_area").first().clone().find("input,textarea").val("").end();
        $('#cloneItem').append(cln)
//        $(".registration_area").clone().insertAfter("div.registration_area:last").find("input[type='text']").val("");;
    }
  