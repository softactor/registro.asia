<script type="text/javascript" src="{{ asset('js/jquery-3.3.1.min.js')}}"></script>
<script type="text/javascript" src="{{ asset('bootstrap/js/bootstrap.min.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/sweetalert.min.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/jquery-ui.min.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/jquery.steps.min.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/sjfb-html-generator.js')}}"></script>
<script src="http://formbuilder.online/assets/js/form-builder.min.js"></script>
<script type="text/javascript">
    $( function() {
      $( "#event_start_date" ).datepicker({ dateFormat: 'dd-mm-yy' });
      $( "#event_end_date" ).datepicker({ dateFormat: 'dd-mm-yy' });
    });
        var formBuilder = $('#fb-editor').formBuilder();
    function add_more_colleagues(){
        var cln= $("#registration_area").first().clone().find("input,textarea").val("").end();
        $('#cloneItem').append(cln)
//        $(".registration_area").clone().insertAfter("div.registration_area:last").find("input[type='text']").val("");;
    }
    function remove_more_colleagues() {
        $(this).closest(".registration_area").remove();
    }

    function registerBusinessOwners(urlAddress, formId, RedirecturlAddress) {
        $.ajax({
            url: urlAddress,
            type: 'POST',
            dataType: 'json',
            data: $("#" + formId).serialize(),
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
            },
            success: function (response) {
                if (response.status == 'success') {
                    swal({
                        title: response.message,
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonClass: "btn-danger",
                        confirmButtonText: "Yes",
                        cancelButtonText: 'No',
                        closeOnConfirm: false
                    },
                            function () {
                                window.location = RedirecturlAddress;
                            });
                }
            }
        });
    } // end method    

    function createForm(urlAddress, redirectUrl) {
        var fields  = formBuilder.actions.getData('json');
        var formID  = $('#event_id').val();
        var label   = $('#title').val();
        var data    = JSON.stringify([{"name": "formID", "value": formID}, {"name": "label", "value": label}, {"name": "formFields", "value": fields}]);
        $.ajax({
            method: "POST",
            url: urlAddress,
            data: data,
            dataType: 'json',
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
            },
            success: function (response) {
                if(response.status == 'success'){
                    window.location = redirectUrl;
                }
            }
        });
    }
    // End
    
    $("#example-basic").steps({
        headerTag: "h3",
        bodyTag: "section",
        transitionEffect: "slideLeft",
        autoFocus: true,
        onStepChanged: function(event, currentIndex, priorIndex) {
            if(currentIndex > 0){
                var eventFormId =   $('#event-form-id-'+currentIndex).val();
                var data_url =   $('#data_url').val();
                generateHtmlForm(currentIndex, eventFormId, data_url);
            }
          },
        onStepChanging: function (event, currentIndex, newIndex) {
            if(currentIndex == 0){
                console.log('do something');
            }
            if(currentIndex > 0){
                var cD      =   $("#sjfb_form_" + currentIndex).serialize();
                $.ajax({
                    url         : $('#store_data_url').val(),
                    type        : 'POST',
                    dataType    : 'json',
                    data        : $("#sjfb_form_" + currentIndex).serialize(),
                    headers     : {
                        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
                    },
                    success     : function (response) {
                        console.log(response);
                    }
                });
            }
            return true;
        },
        onCanceled: function (event) { },
        onFinishing: function (event, currentIndex) { return true; }, 
        onFinished: function (event, currentIndex) { },
    });
    $("#edit_events_form").steps({
        headerTag: "h3",
        bodyTag: "section",
        transitionEffect: "slideLeft",
        autoFocus: true,
        onStepChanged: function(event, currentIndex, priorIndex) {
            if(currentIndex > 0){
                var eventFormId =   $('#event-form-id-'+currentIndex).val();
                var data_url =   $('#data_url').val();
                generateHtmlForm(currentIndex, eventFormId, data_url);
            }
          },
        onStepChanging: function (event, currentIndex, newIndex) {
            if(currentIndex > 0){
                console.log('I am callling..');
            }
            return true;
        },
    });
    function generateEmbeddedEventsUrl(url){
        var eventTitle  =   $('#title').val();
        if(eventTitle){
            $.ajax({
                url         : url,
                type        : 'GET',
                dataType    : 'json',
                data        : 'event_title='+eventTitle,
                success     : function (response) {
                    $('#iframe_events_url').val(response.data);
                }
            });
        }else{
            swal("Error", "Event title was required!", "error")
        }
    }
</script>