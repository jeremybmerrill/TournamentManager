$(document).ready(function(){
  /* Do running totals */

  $('input.d.score').change(function(){
    var dtotal;
    $('input.d.score').val(); /* sum all of those */
    $('span.d_total').val(ptotal);
  }
  $('input.p.score').change(function(){
    var ptotal;
    $('input.p.score').val(); /* sum all of those */
    $('span.p_total').val(ptotal);
  }

  
  /* Ensure values are 0 - 10 */
  $('input.p.score').change(function(){
    var pval = $('input.p.score').val();

    if(pval /* isn't an int */ or pval > 10 or pval < 0){
      /* reject it, highlight the textbox red?, focus the textbox */
    }
  }
});
