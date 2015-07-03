/**********************************************************************
* begin JQuery
* Run the command 'grunt build' after modifying.
*/
jQuery(document).ready(function(){

// Button ScrollTop
 $(window).scroll(
function(e){
    var scroll = $(window).scrollTop();

            if (scroll > 150){
                $('.scroll-top').css({'display':'block'},400);
                $('.scroll-top').stop().animate({'opacity':'0.8'},400);            }
            else{
                $('.scroll-top').css({'display':'none'},400);
                $('.scroll-top').stop().animate({'opacity':'0'},400);
            }

    }); // Button ScrollTop'

});
/*
*
* end JQuery
-------------------------------------------------------------------------------------------------------
*  Script by William C. Canin
**************************************************************************/
