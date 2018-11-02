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
<?php
    foreach($user_datas as $user_data){
?>
<table class="table table-user-information">
    <tbody>
        <tr>
            <td>Salutation:</td>
            <td>{{ $user_data->salutation }}</td>
        </tr>
        <tr>
            <td>First name:</td>
            <td>{{ $user_data->first_name }}</td>
        </tr>
        <tr>
            <td>Last name</td>
            <td>{{ $user_data->last_name }}</td>
        </tr>
        <tr>
            <td>Gender</td>
            <td>{{ $user_data->gender }}</td>
        </tr>
        <tr>
            <td>Company</td>
            <td>{{ $user_data->company_name }}</td>
        </tr>
        <tr>
            <td>Company Address</td>
            <td>{{ $user_data->company_address }}</td>
        </tr>
        <tr>
            <td>Email</td>
            <td>{{ $user_data->email }}</td>
        </tr>
        <tr>
            <td>Phone Number</td>
            <td>{{ $user_data->tel }}(Landline)<br><br>{{ $user_data->mobile }}(Mobile)
            </td>

        </tr>
    </tbody>
</table>
<?php } ?>