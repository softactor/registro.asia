<!--Extends parent app template-->
@extends('layout.app')
<!--Content insert section-->
@section('content')
<style type="text/css">
    .user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.toppad
{margin-top:20px;
}
</style>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">{{ $event_data->title }} Registration Details</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3 col-lg-3 " align="center">
                            <!--<img alt="User Pic" src="http://babyinfoforyou.com/wp-content/uploads/2014/10/avatar-300x300.png" class="img-circle img-responsive">-->
                        </div>
                        <div class=" col-md-9 col-lg-9 "> 
                            <table class="table table-responsive table-user-information">
                                <tbody>
                                    <tr>
                                        <td>QR Code</td>
                                        <td><img src="<?php echo $qrcode; ?>" /></td>
                                    </tr>
                                    <tr>
                                        <td>Salutation:</td>
                                        <td>{{ $user_data['salutation'] }}</td>
                                    </tr>
                                    <tr>
                                        <td>First name:</td>
                                        <td>{{ $user_data['first_name'] }}</td>
                                    </tr>
                                    <tr>
                                        <td>Last name</td>
                                        <td>{{ $user_data['last_name'] }}</td>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td>{{ $user_data['gender'] }}</td>
                                    </tr>
                                    <tr>
                                        <td>Company</td>
                                        <td>{{ $user_data['company_name'] }}</td>
                                    </tr>
                                    <tr>
                                        <td>Company Address</td>
                                        <td>{{ $user_data['company_address'] }}</td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td>{{ $user_data['email'] }}</td>
                                    </tr>
                                    <tr>
                                        <td>Phone Number</td>
                                        <td>{{ $user_data['tel'] }}(Landline)<br><br>{{ $user_data['mobile'] }}(Mobile)
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>Registration Type</td>
                                        <td>{{ $user_data['namebadge_user_label'] }}
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection