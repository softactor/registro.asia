<!--Extends parent app template-->
@extends('layout.app')
<!--Content insert section-->
@section('content')
<section class="container">
    <div class="container-page">
        <div class="row">
            <div class="col-sm-3"><!--left col-->                
            @include('layout.superadmin_dashboard_menu')
            </div><!--/col-3-->
            <div class="col-sm-9">
                <h3 class="dark-grey">Superadmin Dashboard</h3>
            </div><!--/tab-content-->
        </div><!--/col-9-->
    </div>
</section>
@endsection