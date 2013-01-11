jQuery(document).ready(function() {
    newRoomInputFunc();
});
function newRoomInputFunc(){
  jQuery('.clonedInput').filter(':last').bind('focus.addrooms', function() {
    jQuery('.clonedInput').filter(':last').unbind('focus.addrooms');
    var num     = jQuery('.clonedInput').length;
    var newNum  = new Number(num + 1);
 
    var newElem = jQuery('#roominput' + num).clone().attr('id', 'roominput' + newNum);

    newElem.children(':first').attr('id', 'name' + newNum).attr('name', 'name' + newNum);
    jQuery('#roominput' + num).after(newElem);
    newRoomInputFunc();
  });
}

