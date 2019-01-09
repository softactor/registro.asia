/**
 * Simple Jquery Form Builder (SJFB)
 * Copyright (c) 2015 Brandon Hoover, Hoover Web Development LLC (http://bhoover.com)
 * http://bhoover.com/simple-jquery-form-builder/
 * SJFB may be freely distributed under the included MIT license (license.txt).
 */

//generates the form HTML
function generateHtmlForm(currentIndex, eventFormId, urlAddress){
    $.ajax({
            method: "POST",
            url: urlAddress,
            data: 'eventFormId='+eventFormId + '&current_access_token=' + $('#access_token').val(),
            dataType: 'json',
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
            },
            success: function (response) {
                //empty out the preview area
                $('#sjfb_fields_'+currentIndex).empty();
                $('#generate-form-id-'+currentIndex).val(1);
                if (response.status == 'success') {
                    if (response.data) {
                        $('#sjfb_fields_' + currentIndex).append(response.data);
                    }
                }
            }
        });
}