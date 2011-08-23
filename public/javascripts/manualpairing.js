
if(Object.isUndefined($))
  throw("manualpairing.js requires jquery.min.js library");

$(document).ready(function(){
  $('form#manual_pairing').hide();
  $('a#manual_pairing').click(function(){
    $('form#manual_pairing').show();
  });
});
