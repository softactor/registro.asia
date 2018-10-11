<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <!--<link rel="shortcut icon" href="" type="image/x-icon">-->
        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>Register Asia</title>        
        @section('header_css_js_scrip_area')
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
        @show
    </head>

    <body>
        <div class="container">
            @yield('content')
            <!--End Main Content Area-->
           <!--Start Footer Area-->
            @include('layout.footer')
            <!--End Footer Area-->
            
        </div><!--End Main Content Area-->
        <!--All footer script are in this page-->
        @include('layout.footer_script')
    </body>
</html>
<!-- * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  
 * @author      	: TEO (http://registro.asia.com/)
 * @date        	: 17-10-2018 
 * @website     	: Registro
 * @URL 		: http://registro.asia.com/


 * @project owner 	: Tanveer Qureshee
 * @information		: https://www.linkedin.com/in/tanveer-qureshee-788663164/
			  

 * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ --> 

