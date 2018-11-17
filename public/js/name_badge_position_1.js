$(document).on("ready", function(){
    $(".draggable").draggable({
        containment: "#containment-wrapper"
    });
})

$(document).on("mouseup", ".draggable", function(){

    var elem = $(this),
        id = elem.attr('id'),
        desc = elem.attr('data-desc'),
        pos = elem.position();
        
    console.log('Left: '+pos.left+'; Top:'+pos.top);
    
});
  
$(document).on("ready", "#save", function(){

    $(".draggable").each(function(){
        var elem = $(this),
            id = elem.attr('id');
            newleft = elem.attr('data-left'),
            newtop = elem.attr('data-top');
            
        $.ajax({
            type: 'POST',
            url: 'save-position.php',
            data: {'id':id, 'newleft': newleft, 'newtop':newtop},
            success: function(result){
                $("#message").show(200);
            }
        })            
            
    })

})