(function($){
    $.fn.showMsg=function(){
        alert("jqtabUI");
    }
    $.fn.jqtabUI=function(){
        var $this =$(this);
        $this.find("li").bind("mouseenter",function(){
            $(this).css("cursor","pointer");
            //alert($(this).text());
        });
        $this.find("li").bind("click",function(){
            $(".current").attr("class","");
            $(this).attr("class","current");
            show($(this).attr("id"));
        });
    }
    function show(id){
        $("div[class~='show']").attr("class","hide");
        $("div[id~='"+id+"']").attr("class","show");
        //debug($("div[id~='"+id+"']").attr("class"));
    }
    function debug(content){
        console.log(content);
    }
})(jQuery);