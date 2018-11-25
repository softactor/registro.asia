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
            'event_id'      : $('#event_id').val(),
            'name_badge_id' : $('#name_badge_id').val()
        };
        dataParam.push(dataParamObj);
    })
    $.ajax({
        type: 'POST',
        url: $('#position_store').val(),
        dataType:'json',
        data: 'dataParam='+JSON.stringify(dataParam)+'&event_id='+$('#event_id').val()+'&name_badge_id='+$('#name_badge_id').val(),
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
                    
                    if(response.name_badge_position_status){                                
//                        $.each(response.name_badge_position, function (key, val) {
//                            $("#" + key).remove();
//                        });
                        $(".edit_field_class").remove();
                        $("#containment-wrapper").append(response.positionEditView);
                    }
                }else{
                    $('#content_loader').hide();
                    $('#containment-wrapper').css('background-image', '');
                    swal("Error!", response.message, "error");
                }
            }
        })
    }
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
                    $('#content_loader').hide();
                    $('#measure_unit').val(response.data.measure_unit);
                    $('#namebadge_width').val(response.data.namebadge_width);
                    $('#namebadge_height').val(response.data.namebadge_height);
                    $('#namebadge_orientation').val(response.data.namebadge_orientation);
                    $("#previous_bg_template").show();
                    $("#previous_bg_template_img").attr("src",response.bg_template_url);
                }else{
                    $('#content_loader').hide();
                    $('#measure_unit').val('');
                    $('#namebadge_width').val('');
                    $('#namebadge_height').val('');
                    $('#namebadge_orientation').val(''); 
                    $("#previous_bg_template").hide();
                    $("#previous_bg_template_img").attr("src",'');
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
            console.log('Take');
            console.log(response);
            if (response.status == 'success') {
                // updated the new value
                var id  =   $('#nameBadgeFieldsId').val();
                $('#badge_field_font_unit_'+id).val(response.data.font_unit);
                $('#badge_field_font_size_'+id).val(response.data.font_size);
                $('#badge_field_font_weight_'+id).val(response.data.font_weight);
                
                // in form deselect all values
                $('#nameBadgeFieldsId').val('');
                $('#font_unit').val('');
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
  