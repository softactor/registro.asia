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
                    {{ $page_details['page_title'] }}
                    <div class="pull-right">
                        <a href='{{ url($page_details['link_url']) }}'>{{ $page_details['link_title'] }}</a>
                    </div>
                </h2>
                <form action="{{ url($page_details['form_url']) }}" method="post" enctype="multipart/form-data">
                    {{ csrf_field() }}
                    <div class="form-group">
                        <label for="title">Title:</label>
                        <input type="text" class="form-control" id="title" placeholder="Enter title" name="title" value="<?php echo ((isset($events->title) && !empty($events->title))? $events->title: '') ?>">
                    </div>
                    <div class="form-group">
                        <label for="comment">Embedded Code: <button type="button" class="btn btn-sm" onclick="generateEmbeddedEventsUrl('{{ url("su/generateEmbeddedEventsUrl")}}');">Create</button></label>
                        <textarea class="form-control" rows="5" id="iframe_events_url" name="iframe_events_url"><?php
                                    if (isset($events->iframe_events_url) && !empty($events->iframe_events_url)) {
                                        echo $events->iframe_events_url;
                                    }
                                    ?></textarea>
                    </div>
                    <div class="form-group">
                        <label>Local Country</label>
                        <select class="form-control" id="event_country" name="event_country">
                            <option value="">Please select</option>
                            <?php
                            $orderBy = [
                                'order_by_column' => 'country_name',
                                'order_by' => 'ASC',
                            ];

                            $countries = get_table_data_by_table('countries', $orderBy);
                            if (isset($countries) && !empty($countries)) {
                                foreach ($countries as $country) {
                                    ?>
                                    <option value="<?php echo $country->id; ?>"<?php echo ((isset($events->event_country) && $events->event_country == $country->id) ? 'selected' : '') ?>><?php echo $country->country_name; ?></option>
                                    <?php
                                }
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="organizer">Organizer:</label>
                        <input type="text" class="form-control" id="organizer" placeholder="Enter Organizer" name="organizer" value="<?php echo ((isset($events->organizer) && !empty($events->organizer))? $events->organizer: '') ?>">
                    </div>
                    <div class="form-group">
                        <label for="start_date">Start date:</label>
                        <input type="text" class="form-control" id="event_start_date" placeholder="Enter start date" name="start_date" value="<?php echo ((isset($events->start_date) && !empty($events->start_date))? $events->start_date: '') ?>">
                    </div>
                    <div class="form-group">
                        <label for="end_date">End date:</label>
                        <input type="text" class="form-control" id="event_end_date" placeholder="Enter End date" name="end_date" value="<?php echo ((isset($events->end_date) && !empty($events->end_date))? $events->end_date: '') ?>">
                    </div>
                    <div class="form-group">
                        <label for="venue_name">Venue name:</label>
                        <input type="text" class="form-control" id="venue_name" placeholder="Enter Venue name" name="venue_name" value="<?php echo ((isset($events->venue_name) && !empty($events->venue_name))? $events->venue_name: '') ?>">
                    </div>
                    <div class="form-group">
                        <label for="venue_address">Venue address:</label>
                        <input type="text" class="form-control" id="venue_address" placeholder="Enter Venue address" name="venue_address" value="<?php echo ((isset($events->venue_address) && !empty($events->venue_address))? $events->venue_address: '') ?>">
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                @if ($errors->has('event_header'))
                                <div class="alert-error">{{ $errors->first('event_header') }}</div>
                                @endif
                                <label for="namebadge_height">Event template header:</label>
                                <input type="file" class="form-control" name="event_header">
                            </div>
                            <?php if(isset($events->event_header) && !empty($events->event_header)){ ?> 
                            <div class="col-md-6">
                                <div id="previous_bg_template">
                                    <img src="<?php echo asset('events/' . $events->event_header) ?>" alt="Event header" style="width: 350px; margin-top: 3%;" />
                                </div>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                @if ($errors->has('email_template_pdf'))
                                <div class="alert-error">{{ $errors->first('email_template_pdf') }}</div>
                                @endif
                                <label for="email_template_pdf">Email PDF:</label>
                                <input type="file" class="form-control" name="email_template_pdf">
                            </div>
                            <?php if(isset($events->email_template_pdf) && !empty($events->email_template_pdf)){ ?> 
                            <div class="col-md-6">                                
                                <div id="previous_bg_template">
                                    <h6><a href="<?php echo asset('events/' . $events->email_template_pdf) ?>">Email PDF Template have been uploaded</a></h6>
                                </div>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                    <input type="hidden" name="event_edit_id" value="<?php echo $events->id; ?>">
                    <input type="submit" name='create_event' value="Update" class="btn btn-default">
                </form>
            </div><!--/tab-content-->

        </div><!--/col-9-->        
    </div>
</section>
@endsection