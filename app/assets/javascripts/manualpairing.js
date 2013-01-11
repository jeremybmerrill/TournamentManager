
jQuery(document).ready(function(){
  jQuery('form#manual_pairing').hide();
  jQuery('a#manual_pairing_show').click(function(){
    jQuery('form#manual_pairing').show();
    jQuery('a#manual_pairing_show').hide();
  });
});
