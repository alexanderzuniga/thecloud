jQuery(document).ready(function(){

  console.log('WPE Sandbox javascript loaded.');

  function wpe_output_response(stuff){
    jQuery("#wpe-blackout-bg").fadeIn(500);
    jQuery("#wpe-break-output").html(stuff).fadeIn(500);
  }

  // On break link click
  jQuery(".wpe-break").click(function(){

    // idk what this is
    //if ( jQuery(".wpe-break-done").length > 0 ){
    //  alert('nah');
    //  return
    //}

    // Pull break number from link's html attribute defined in sandboxes_admin.php
    break_num = jQuery(this).attr('break_num');

    // Loading page for breaks that take awhile
    wpe_output_response("<h3>Running Break #" + break_num + "...</h3>"
      + "<p>This may take awhile... Sit tight!</p>"
      + "<center><img src='" + loading_gif.url + "'></center>");
    var data = {
      'action': 'wpe_break',
      'break': break_num
    };

    // Delay for now to see animations.
    // Remove later.
    setTimeout(function(){
      // Run the actual break, and output response.
      jQuery.post(ajax_object.ajax_url, data, function(response){
        jQuery("#wpe-break-output").slideUp(500,function(){
          wpe_output_response(response);
        }).slideDown();
      });
    }, 500);

  }); // end wpe-break click

  jQuery(".wpe-break-done").click(function(){
    break_num = jQuery(this).attr('break_num');
    var data = {
      'action': 'wpe_break_done',
      'break': break_num
    };
    // Run the actual break, and output response.
    jQuery.post(ajax_object.ajax_url, data, function(response){
      jQuery("#wpe-break-output").slideUp(500,function(){
        wpe_output_response(response);
      }).slideDown();
    });
  }); // end break done.


  jQuery('.wpe-break-submit').click(function(){
    break_num = jQuery(this).attr('break_num');
    var data = {
      'action': 'wpe_breakathon_submit',
      'break': break_num
    };
    // Run the actual break, and output response.
    jQuery.post(ajax_object.ajax_url, data, function(response){
      jQuery("#wpe-break-output").slideUp(500,function(){
        wpe_output_response(response);
      }).slideDown();
    });

  });

});
