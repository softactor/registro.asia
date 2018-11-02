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
            console.log('onStepChanged');
            console.log(currentIndex);
            console.log(priorIndex);
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
            console.log('onStepChanging');
            console.log(currentIndex);
            console.log(newIndex);
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
            if(formId){
                $.ajax({
                    url: $('#client_registration_others_step_varifications').val(),
                    type: 'POST',
                    dataType: 'json',
                    data: $("#sjfb_form_" + currentIndex).serialize() + '&event_id=' + $("#event_id").val() + '&access_token=' + $("#access_token").val() + '&form_id=' + $("#event-form-id-"+currentIndex).val(),
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
            }else{
                returnType = true;
            }
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
                                swal.close();
                                $("#open_name_badge_container_modal").modal();
                                $('#printBody').html(response.data.data);
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