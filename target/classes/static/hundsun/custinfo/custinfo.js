$(function(){
    var address = "";
    debugger;
    $("#searchBut").on("click",function(){
        $('.select-item').each(function(i){
            var tradeflag = $(this).text();
            address = address + tradeflag;
        })
        $("#address").val(address);
        address = "";
    })


});