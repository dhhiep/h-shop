$(function(){
  var onClass = "on";
  var showClass = "show";

  $(".floating-label input").bind("checkval",function(){
    var label = $(this).parents('.floating-label').find('label');
    if (this.value !== "") {
      label.addClass(showClass);
    } else {
      label.removeClass(showClass);
    }
  }).on("keyup", function(){
    $(this).trigger("checkval");
  }).on("focus", function(){
    var label = $(this).parents('.floating-label').find('label');
    label.addClass(onClass);
  }).on("blur", function(){
    var label = $(this).parents('.floating-label').find('label');
    label.removeClass(onClass);
  }).trigger("checkval");
});
