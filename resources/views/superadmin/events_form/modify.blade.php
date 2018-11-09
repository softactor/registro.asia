<!--Extends parent app template-->
@extends('layout.app')
<!--Content insert section-->
@section('content')
<section class="container">
    <div class="container-page">
        <div class="row">
            <div class="col-sm-1"><!--left col-->
                @include('layout.superadmin_dashboard_menu')
            </div><!--/col-3-->
            <div class="col-sm-11">
                <h2>
                    {{ $page_details['page_title'] }} Update
                    <div class="pull-right">
                        <a href='{{ url($page_details['link_url']) }}'>{{ $page_details['link_title'] }}</a>
                    </div>
                </h2>
                <h4>{{ $page_details['base_url'] }}</h4>
                <form action="{{ url($page_details['form_url']) }}" method="post">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label for="title">Label title:</label>
                        <input type="text" class="form-control" id="title" placeholder="Enter title" name="title" value="<?php echo $event_forms->lebel_name ?>">
                    </div>
                    <div id="build-wrap"></div>
                    <div class="setDataWrap">
                        <input type="hidden" id="event_id" value="{{$events->id}}" >
                        <input type="hidden" id="event_form_edit_id" value="{{$event_forms->id}}" >        
                    </div>
                </form>                
                <button style="margin-bottom: 2%" class="btn btn-info" id="getJSON" type="button" onclick="editForm('{{ url("su/store_events_form") }}', '{{ url("su/event_form") }}');">Update</button>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@section('footer_js_scrip_area')
@parent
<script type="text/javascript">
    var fbEditor = document.getElementById('build-wrap');
        var formBuilderEdit = $(fbEditor).formBuilder();
    $( document ).ready(function() {        
        var formData = '<?php echo $event_forms->form_data ?>';
        setTimeout(function(){ formBuilderEdit.actions.setData(formData); }, 500);
    });
    function editForm(urlAddress, redirectUrl) {
        var fields              = formBuilderEdit.actions.getData('json');
        var formID              = $('#event_id').val();
        var event_form_edit_id  = $('#event_form_edit_id').val();
        var label               = $('#title').val();
        var data                = JSON.stringify([{"name": "formID", "value": formID}, {"name": "label", "value": label}, {"name": "formFields", "value": fields},{"name": "event_form_edit_id", "value": event_form_edit_id}]);
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
</script>
@endsection
@endsection