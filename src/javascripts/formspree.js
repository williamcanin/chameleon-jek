// Requerid fields
jQuery(document).ready(function($) {
  $('form#formspree-contact').find('input,textarea').each(function(){
    $(this).prop('required',true);
  });
});