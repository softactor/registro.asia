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
            // to save actual position:
            var absPos = elem.offset();
            
            $("#" + draggableId).attr("data-absulate-left",pos.left);
            $("#" + draggableId).attr("data-absulate-top",pos.top);
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
                        $("#containment-wrapper").append(response.positionEditView);
                    }
                }else{
                    swal("Error!", response.message, "error");
                    $('#content_loader').hide();
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
  