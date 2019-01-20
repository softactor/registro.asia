/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function get_event_print_configuration(event_id, url){
    $('#response_message').hide();
    if (event_id) {
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'json',
            data: 'event_id=' + event_id,
            success: function (response) {
                $('#response_message').show();
                if (response.status == 'success') {
                    $('#response_message').html(response.message);
                    $('#page_height').val(response.data.page_height);
                    $('#page_width').val(response.data.page_width);
                    $('#margin_top').val(response.data.margin_top);
                    $('#margin_right').val(response.data.margin_right);
                    $('#margin_bottom').val(response.data.margin_bottom); 
                    $('#margin_left').val(response.data.margin_left); 
                    $("#font_color").val(response.data.font_color);
//                    $("#template_per_page").val(response.data.template_per_page);
                }else{
                    $('#response_message').html(response.message);
                    $('#page_height').val('9.7cm');
                    $('#page_width').val('21cm');
                    $('#margin_top').val('.5cm');
                    $('#margin_right').val('.5cm');
                    $('#margin_bottom').val('.5cm'); 
                    $('#margin_left').val('.5cm'); 
                    $("#font_color").val('#000000');
//                    $("#template_per_page").val('2');
                }
            },
            async: false // <- this turns it into synchronous
        });
    }else{
        $('#response_message').html('configuration not found, the following value is default value');
        $('#page_height').val('297mm');
        $('#page_width').val('210mm');
        $('#margin_top').val('.5cm');
        $('#margin_right').val('.5cm');
        $('#margin_bottom').val('.5cm');
        $("#font_color").val('#000000');
//        $("#template_per_page").val('2');
    }
}

function savePrintLayoutConfiguration(url) {
    $.ajax({
        type: 'POST',
        url: url,
        dataType: 'json',
        data: $("#printLayoutConfigurationForm").serialize(),
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
        },
        success: function (response) {
            if (response.status == 'success') {
                // updated the new value
                $('#print_layout_template').modal('hide');
                swal("Print configuration Saved!", response.message, "success");
                setTimeout(function () {
                    location.reload();
                }, 2000);
            } else {
                swal("Error!", response.message, "error");
            }
        }
    })
}

function saveNameBadgeLabel(url) {
    if($('#label_name').val()){
        $.ajax({
            type: 'POST',
            url: url,
            dataType: 'json',
            data: $("#printLabelConfiguration").serialize(),
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
            },
            success: function (response) {
                if (response.status == 'success') {
                    $('#label_name').val("");
                    // updated the new value
                    $('#name_badge_values').html(response.data);
                } else {
                    swal("Error!", response.message, "error");
                }
            }
        });
    }
}

function deleteNamebadgeValues(id, url, actionType = 'Delete'){
    if(actionType == 'Delete'){
        swal({
            title: 'Confirmed?',
            type: "warning",
            showCancelButton: true,
            confirmButtonClass: "btn-danger",
            confirmButtonText: "Yes",
            cancelButtonText: 'No',
            closeOnConfirm: false
        },
        function () {
            $.ajax({
                url: url,
                type: 'GET',
                dataType: 'json',
                data: 'del_id=' + id + '&typeParam = '+ actionType,
                success: function (response) {
                    if(response.status == 'success'){
                        $('#name_badge_list_values_'+id).hide();
                        swal("Delete complete", "Data have successfully deleted!", "success"); 
                    }
                },
                async: false // <- this turns it into synchronous
            });
        });
    }else{
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'json',
            data: 'del_id=' + id + '&typeParam = '+ actionType,
            success: function (response) {
                $('#label_name').val(response.data.name);
                $('#text_clor').val(response.data.text_clor);
                $('#label_color').val(response.data.background_color);
            },
            async: false // <- this turns it into synchronous
        });
    }
}

function get_email_text(event_id, url){
    if(event_id){
        $.ajax({
            type        : 'GET',
            url         : url,
            dataType    : 'json',
            data        : 'event_id='+event_id,
            success     : function (response) {
                if (response.status == 'success') {
                    tinymce.get('mail_body').setContent(response.data);
                } else {
                    tinymce.get('mail_body').setContent('');
                }
            }
        });
    }
}
function get_pdf_text(event_id, url){
    if(event_id){
        $.ajax({
            type        : 'GET',
            url         : url,
            dataType    : 'json',
            data        : 'event_id='+event_id,
            success     : function (response) {
                if (response.status == 'success') {
                    tinymce.get('mail_body').setContent(response.data);
                } else {
                    tinymce.get('mail_body').setContent('');
                }
            }
        });
    }
}