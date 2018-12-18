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

function printExecuteSingleNameBadge(url, print_id){
    $('#printBody').printThis();   
}

function refreshCurrentPage(){
    location.reload();
}

function printBulkNameBadge(url){
    var print_id = $('input[name="name_badge_check[]"]').map(function(){return $(this).val();}).get();
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