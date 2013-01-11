jQuery(document).ready(function(){
  /* Do running totals */

  jQuery('input.d.score').change(function(){
    var ptotal;
    ptotal = 0;
    jQuery('input.d.score').each(function(){
      try{
        var parsed;
        parsed = parseInt(jQuery(this).val());
        if (!isNaN(parsed)){ /* add number check here */
          ptotal += parsed;
          jQuery(this).removeClass('failbox');
        }else{
          if(jQuery(this).val() != ""){
            jQuery(this).addClass('failbox');
          }
        }
      }catch(e){}
    });
    jQuery('span#d_total').text(ptotal);
  });

  jQuery('input.p.score').change(function(){
    var ptotal;
    ptotal = 0;
    jQuery('input.p.score').each(function(){
      try{
        var parsed;
        parsed = parseInt(jQuery(this).val());
        if (!isNaN(parsed)){ /* add number check here */
          ptotal += parsed;
          jQuery(this).removeClass('failbox');
        }else{
          if(jQuery(this).val() != ""){
            jQuery(this).addClass('failbox');
          }
        }
      }catch(e){}
    });
    jQuery('span#p_total').text(ptotal);
  });
});
