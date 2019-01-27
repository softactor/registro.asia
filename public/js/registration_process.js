/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$("#profileSectionArea").steps({
        headerTag: "h3",
        bodyTag: "section",
        transitionEffect: "slideLeft",
        autoFocus: true,
        onStepChanged: function(event, currentIndex, priorIndex) {
            var wizardLength = $("#profileSectionArea").find('h3').length;
            var lastSteps   =   wizardLength-1;
            
            if (currentIndex > 0 && currentIndex!=lastSteps) {
                if (!$('#generate-form-id-' + currentIndex).val()) {
                    var eventFormId = $('#event-form-id-' + currentIndex).val();
                    var data_url = $('#data_url').val();
                    generateHtmlForm(currentIndex, eventFormId, data_url);
                }
            }
            
            if (currentIndex == lastSteps) {
                $.ajax({
                    url: $('#confirmation_preview_url').val(),
                    type: 'GET',
                    dataType: 'json',
                    data: 'access_token=' + $("#access_token").val(),
                    success: function (response) {
                        $("#preconfirm_data").html(response.data);
                    },
                    async: false // <- this turns it into synchronous
                });
            }
        },
        onStepChanging: function (event, currentIndex, newIndex) {
            var formId  =   $("#event-form-id-"+currentIndex).val();
            if (currentIndex == 0) {
                var returnType = false;
            $.ajax({
                url: $('#client_registration_first_step_varifications').val(),
                type: 'POST',
                dataType: 'json',
                data: $("#profileSection").serialize() + '&event_id=' + $("#event_id").val() + '&access_token=' + $("#access_token").val(),
                headers: {
                    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
                },
                success: function (response) {
                    if (response.status == 'error') {
                        $('#error_message_show_area').html(response.data);
                        returnType = false;
                    }else{
                        $('#error_message_show_area').hide();
                        $('#access_token').val(response.data);
                        returnType = true;
                    }                    
                },
                async: false // <- this turns it into synchronous
            });
            return returnType;
        } else {            
            var returnType = false;
            returnType = true;
            return returnType;
        }
        },
        onCanceled: function (event) { },
        onFinishing: function (event, currentIndex) {
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
                    url: $('#confirmation_process').val(),
                    type: 'GET',
                    dataType: 'json',
                    data: 'access_token=' + $("#access_token").val(),
                    success: function (response) {
                        if(response.status == 'success'){
                            if(response.registration_type == 'Onsite'){
                                swal("Registeration complete", "Registeration have been successfully done!", "success");
                                setTimeout(function(){
                                    window.location = $('#onsiteRedirectUrl').val();
                                }, 2000);
                                //swal.close();
                                //$("#open_name_badge_container_modal").modal();
                                //$('#printBody').html(response.data.data);
                                //onsiteRedirectUrl
                            }else{
                                swal("Registeration complete", "Registeration have been successfully done!", "success");
                                setTimeout(function(){
                                    window.location = $('#redirectUrl').val();
                                }, 2000);
                            } 
                        }
                    },
                    async: false // <- this turns it into synchronous
                });
            });
        }, 
        onFinished: function (event, currentIndex) {
        console.log('finishd...');
        },
        saveState: true
    });
    
    function checkEmailMatching(repeat_email){
        var emailvalues = $("input[name='email[]']")
              .map(function(){return $(this).val();}).get();
        var rep_emailvalues = $("input[name='rep_email[]']")
              .map(function(){return $(this).val();}).get();        
        var ind = $.inArray(repeat_email, rep_emailvalues);
        if(repeat_email == emailvalues[ind]){
            $('div.actions').show();
        }else{
             $(this).css("border", "1px solid red");
            $('div.actions').hide();
        }
        
    }
    
    function storeUserWiseData(formId, url, userEmail, divKey){
        var currentIndex  =   $('#form_current_index').val();
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'json',
            data: $("#" + formId).serialize() + '&event_id=' + $("#event_id").val() + '&access_token=' + $("#access_token").val() + '&form_id=' + $("#event-form-id-"+currentIndex).val() + '&user_email=' + userEmail,
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
            },
            success: function (response) {
                if(response.status == 'success'){
                    $("#access_token").val(response.data)
                    $('#collapse'+divKey).html('');
                    swal("Store complete", "Data Store have been successfully done!", "success");  
                }else{
                   swal("Failed to Save!", response.message, "error"); 
                }
            },
            async: false // <- this turns it into synchronous
        });
    }