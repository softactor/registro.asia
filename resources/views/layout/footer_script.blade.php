<script type="text/javascript" src="{{ asset('js/jquery-3.3.1.min.js')}}"></script>
<script type="text/javascript" src="{{ asset('bootstrap/js/bootstrap.min.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/sweetalert.min.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/jquery-ui.min.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/jquery.steps.min.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/sjfb-html-generator.js')}}"></script>
<script src="http://formbuilder.online/assets/js/form-builder.min.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script type="text/javascript" src="{{ asset('js/dashboard_report.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/printThis.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/jspdf.min.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/tinymce/tinymce.min.js')}}"></script>
<script type="text/javascript" src="{{ asset('js/datatables.min.js')}}"></script>
<script type="text/javascript">
  tinymce.init({
    selector: '.rich_editor'
  });
  </script>
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
    function searchFilterData(urlAddress, formId, tableSelector){
        $.ajax({
                url:urlAddress,
                type:'POST',
                dataType:'json',
                data:$("#"+formId).serialize(),
                headers: {
                    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
                },
                success: function(response){
                    if(response.status=='success'){
                        $(".box-body").empty();
                        $(".box-body").append(response.data);
                        $('#userRegisList').DataTable();
                    }else{
                        $(".box-body").empty();
                        swal("Error", response.message, "error")
                    }
                }
            });
    }
</script>
<script>
  $( function() {
      var serial_digits;
      var mobiles;
      var emails;
      var first_names;
    $.ajax({
        url         : "{{ url('su/get_registration_tickets') }}",
        type        : 'GET',
        dataType    : 'json',
        success     : function (response) {
            serial_digits = response.data.serial_digits;
            mobiles = response.data.mobiles;
                  emails = response.data.emails;
                  first_names = response.data.first_names;
              },
              async: false
          });

          $("#ticket").autocomplete({
              source: serial_digits
          });
          $("#mobile").autocomplete({
              source: mobiles
          });
          $("#email").autocomplete({
              source: emails
          });
          $("#name").autocomplete({
              source: first_names
          });
      });
      
      $(function() {
        $('span.edit_text').on('click', function() {
          var div = $(this);
          var tb = div.find('input:text');//get textbox, if exist
          if (tb.length) {//text box already exist
            div.text(tb.val());//remove text box & put its current value as text to the div
          } else {
            tb = $('<input>').prop({
              'type': 'text',
              'value': div.text()//set text box value from div current text
            });
            div.empty().append(tb);//add new text box
            tb.focus();//put text box on focus
          }
        });
      });
      
      // emailConfirmType will hold withemail and withoutemail;
      function csv_upload_confirm(urlAddress, emailConfirmType){
          var valuesSelected = new Array();
           $.each($("input[name='item_child[]']:checked"), function() {
            valuesSelected.push($(this).val());
            // or you can do something to the actual checked checkboxes by working directly with  'this'
            // something like $(this).hide() (only something useful, probably) :P
          }); 
          if(valuesSelected.length < 1 || valuesSelected == undefined){
              swal("Error!", "No data selected!", "error")
          }else{
              swal({
              title: 'Do you want to import',
              type: "warning",
              showCancelButton: true,
              confirmButtonClass: "btn-success",
              confirmButtonText: "Yes",
              cancelButtonText: 'No',
              closeOnConfirm: false
          },
          function () {
              var csvData   =   [];              
              var table = $("table#csv_data tbody");
                table.find('tr').each(function (i) {
                    var $tds = $(this).find('td');
                    var csvDataiTems   =   {};
                    var inputId =   $tds.eq(0).find('input').attr('id');
                    if($('#'+inputId).is(':checked')){
                        csvDataiTems['id']                  =   $('#'+inputId).val();
                        csvDataiTems['salutation']          =   $tds.eq(2).text();
                        csvDataiTems['first_name']          =   $tds.eq(3).text();
                        csvDataiTems['last_name']           =   $tds.eq(4).text();
                        csvDataiTems['company']             =   $tds.eq(5).text();
                        csvDataiTems['company_address']     =   $tds.eq(6).text();
                        csvDataiTems['gender']              =   $tds.eq(7).text();
                        csvDataiTems['designation']         =   $tds.eq(8).text();
                        csvDataiTems['mobile']              =   $tds.eq(9).text();
                        csvDataiTems['country']             =   $tds.eq(10).text();
                        csvDataiTems['email']               =   $tds.eq(11).text();
                        csvData.push(csvDataiTems);  
                    }
                }); // end of each function
                $.ajax({
                    url:urlAddress,
                    type:'POST',
                    dataType:'json',
                    data:'tempData='+ JSON.stringify(csvData) + '&event_id='+ $('#event_id').val() + '&emailConfirmType=' + emailConfirmType,
                    headers: {
                        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
                    },
                    success: function(response){
                        if(response.status == 'success'){
                            window.location = response.redirect_url;
                        }
                    }
                });
          });
          }
        }
      
  </script>
  
  <script type="text/javascript">
    $('#checkall').click(function(){
        if($("#checkall").is(':checked')){
            $('input:checkbox').prop('checked',true);
        }
        else{
            $('input:checkbox').prop('checked',false);
        }
    });
    
    function editBasicRegistrationDetails(details_id, urlAddress){
        $.ajax({
            url:urlAddress,
            type:'GET',
            dataType:'json',
            data:'details_id='+ details_id,
            success: function(response){
                if(response.status == 'success') {
                    $('#registrationEditModal').modal('show');
                    $('#details_id').val(response.data.id);
                    $('#salutation').val(response.data.salutation);
                    $('#first_name').val(response.data.first_name);
                    $('#last_name').val(response.data.last_name);
                    $('#company_name').val(response.data.company_name);
                    $('#company_address').val(response.data.company_address);
                    $('#gender').val(response.data.gender);
                    $('#designation').val(response.data.designation);
                    $('#mobile').val(response.data.mobile);
                    $('#country_id').val(response.data.country_id);
                    $('#fax').val(response.data.fax);
                    $('#tel').val(response.data.tel);
                    $('#email').val(response.data.email);
                    $('#namebadge_user_label').val(response.data.namebadge_user_label);
                }
            }
        }); 
    }
    
    function userRegistrationDetails(details_id, urlAddress){
        $.ajax({
            url:urlAddress,
            type:'GET',
            dataType:'json',
            data:'details_id='+ details_id,
            success: function(response){
                if(response.status == 'success') {
                    $('#registrationDetailsModal').modal('show');
                    $('#registration_details_area').html(response.data);
                }
            }
        });
    }
    
    function updateUserRegisterationData(urlAddress){
        $.ajax({
            url:urlAddress,
            type:'POST',
            dataType:'json',
            data:$('#registration_details_edit_view').serialize(),
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content'),
            },
            success: function(response){
                if(response.status == 'success'){
                    $('#registrationEditModal').modal('hide');
                    swal("Updated", response.message, "success");
                    setTimeout(function(){
                        location.reload();
                    }, 2000);
                }
            }
        });
    }
    function documents_print(print_id){
        $('#'+print_id).printThis(); 
    }
    function documents_pdf_backup(){
        var doc = new jsPDF();
            var specialElementHandlers = {
                '#editor': function (element, renderer) {
                    return true;
                }
            };
                doc.addHTML($('#pdf_content').html(), 15, 15, {
                    'width': 970,
                        'elementHandlers': specialElementHandlers
            });
            doc.save('sample-file.pdf');
    }
    function documents_pdf(print_id, urlAddress){
        $.ajax({
            url:urlAddress,
            type:'GET',
            dataType:'html',
            data: "data=" + JSON.stringify($("#"+print_id).html()),
            success: function(response){
                console.log('ok');
                console.log(response);
            }
        });
    }
  </script>
  <script type="text/javascript">
    $(document).ready( function () {
    $('#userRegisList').DataTable();
} );
</script>