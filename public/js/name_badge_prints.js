/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function printSingleNameBadge(url, print_id){
    $.ajax({
        url: url,
        type: 'GET',
        dataType: 'json',
        data: 'print_id=' + print_id,
        success: function (response) {
            $("#open_name_badge_container_modal").modal();
            $('#printBody').html(response.data);
        },
        async: false // <- this turns it into synchronous
    });
    
}

function printExecuteSingleNameBadge(url){
    $.ajax({
        url: url,
        type: 'GET',
        dataType: 'json',
        data:$('#namebadgeprintcount').serialize(),
        success: function (response) {
            $('#printBody').printThis(); 
        },
        async: false // <- this turns it into synchronous
    });
      
}

function refreshCurrentPage(){
    location.reload();
}

function printBulkNameBadge(url){
   $.ajax({
        url: url,
        type: 'GET',
        dataType: 'json',
        data:$('#bulkEmailPrint').serialize(),
        success: function (response) {
            $("#open_name_badge_container_modal").modal();
            $('#printBody').html(response.data);
        },
        async: false // <- this turns it into synchronous
    }); 
}

function sendBulkEmail(url, checkStatusUrl){
   $.ajax({
        url: url,
        type: 'GET',
        dataType: 'json',
        data:$('#bulkEmailPrint').serialize(),
        success: function (response) {
            if (response.status == 'success') {
                swal("Progress", "Email send is on progress!", "success");
                setTimeout(function () {
                    window.location = checkStatusUrl;
                }, 2000);
            }
        },
        async: false // <- this turns it into synchronous
    }); 
}