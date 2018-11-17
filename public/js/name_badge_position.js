$(function () {
    $(".draggable").draggable();
    $( "#containment-wrapper" ).droppable({
      drop: function( event, ui ) {
        $( this )
          .addClass( "ui-state-highlight" )
          .find( "p" )
            .html( "Dropped!" );
      }
    });
});

$(document).on("mouseup", ".draggable", function () {

    var elem = $(this),
            id = elem.attr('id'),
            desc = elem.attr('data-desc'),
            pos = elem.position();
            $('#'+id).attr("data-left",pos.left);
            $('#'+id).attr("data-top",pos.top);
    console.log('Left: ' + pos.left + '; Top:' + pos.top);

});

function save_position(){
    var dataParam   =   [];
    $(".draggable").each(function () {
        var elem = $(this),
                id      = elem.attr('id');
                newleft = elem.attr('data-left'),
                newtop = elem.attr('data-top');
        var dataParamObj = {
            'field_id'      : id,
            'newleft'       : newleft,
            'newtop'        : newtop,
            'event_id'      : $('#event_id').val(),
            'name_badge_id' : $('#name_badge_id').val()
        };
        dataParam.push(dataParamObj);
    })
    $.ajax({
        type: 'POST',
        url: $('#position_store').val(),
        data: 'dataParam='+JSON.stringify(dataParam)+'&event_id='+$('#event_id').val()+'&name_badge_id='+$('#name_badge_id').val(),
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
        },
        success: function(response){
            location.reload();
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
            success: function(response){
                $('#content_loader').hide();
                var imageUrl    =   $('#namebadge_bg_image_path').val()+'/'+response.data.image_path;
                $('#containment-wrapper').css('background-image', 'url(' + imageUrl + ')');
                $('#containment-wrapper').css('background-repeat', 'no-repeat');
                $('#containment-wrapper').css('width', response.data.namebadge_width + response.data.measure_unit);
                $('#containment-wrapper').css('height', response.data.namebadge_height + response.data.measure_unit);
                $('#name_badge_id').val(response.data.id);
            }
        })
    }
}
  