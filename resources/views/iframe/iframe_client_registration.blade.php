<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Registration</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <!-- Bootstrap core CSS -->
        <link href="{{ asset('bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
        <!-- Fontawesome core CSS -->
        <link href="{{ asset('font_awosome/css/font-awesome.min.css')}}" rel="stylesheet">
        <!-- main stylesheet link -->        
        <link rel="stylesheet" type="text/css" href="{{ asset('css/latofonts.css') }}">  
        <link rel="stylesheet" type="text/css" href="{{ asset('css/latostyle.css') }}">  
        <link rel="stylesheet" type="text/css" href="{{ asset('css/style.css') }}">        
        <link rel="stylesheet" type="text/css" href="{{ asset('css/sweetalert.css') }}">        
        <link rel="stylesheet" type="text/css" href="{{ asset('css/jquery-ui.min.css') }}">        
        <link rel="stylesheet" type="text/css" href="{{ asset('css/super_admin_dashboard_menu.css') }}">        
        <link rel="stylesheet" type="text/css" href="{{ asset('css/jquery.steps.css') }}">
    </head>
    <body>
        <section class="container">
            <?php
                $data   =   [
                    'page_details'  =>  $page_details,
                    'events'        =>  $events,
                    'event_forms'   =>  $event_forms,
                    'step_form_selector'    =>  'profileSectionArea',
                ];
            ?>
            @include('partial.registration_container', $data)
        </section>
        <script type="text/javascript" src="{{ asset('js/jquery-3.3.1.min.js')}}"></script>
        <script type="text/javascript" src="{{ asset('bootstrap/js/bootstrap.min.js')}}"></script>
        <script type="text/javascript" src="{{ asset('js/sweetalert.min.js')}}"></script>
        <script type="text/javascript" src="{{ asset('js/jquery-ui.min.js')}}"></script>
        <script type="text/javascript" src="{{ asset('js/jquery.steps.min.js')}}"></script>
        <script type="text/javascript" src="{{ asset('js/registration_process.js')}}"></script>
        <script type="text/javascript" src="{{ asset('js/sjfb-html-generator.js')}}"></script>
        <script src="http://formbuilder.online/assets/js/form-builder.min.js"></script>
        <script type="text/javascript">
            function add_more_colleagues(){
                var cln= $("#registration_area").first().clone().find("input,textarea").val("").end();
                $('#cloneItem').append(cln)
        //        $(".registration_area").clone().insertAfter("div.registration_area:last").find("input[type='text']").val("");;
            }
        </script>
    </body>
</html>