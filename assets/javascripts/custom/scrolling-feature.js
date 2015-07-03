/**********************************************************************
* begin JQuery
* Run the command 'grunt build' after modifying.
*/
jQuery(document).ready(function(){

// jQuery for page scrolling feature - requires jQuery Easing plugin
    $('#parallax a').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });

});
/*
*
* end JQuery
-------------------------------------------------------------------------------------------------------
*  Script by William C. Canin
**************************************************************************/
