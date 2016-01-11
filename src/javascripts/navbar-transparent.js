/**********************************************************************
* begin JQuery
* Run the command 'grunt build' after modifying.
*/
jQuery(document).ready(function(){


    // Menu transparent scroll
    $(window).scroll(

        function(e){
            var scrollTop = $(window).scrollTop();
            if(scrollTop > 90)
                $('.navbar').stop().animate({'opacity':'0.8'},400);
            else
                $('.navbar').stop().animate({'opacity':'1'},400);
        }

    );

    $('.navbar').hover(
        function (e) {
            var scrollTop = $(window).scrollTop();
            if(scrollTop != 0){
                $('.navbar').stop().animate({'opacity':'1'},400);

            }
        },
        function (e) {
            var scrollTop = $(window).scrollTop();
            if(scrollTop != 0){
                $('.navbar').stop().animate({'opacity':'0.8'},400);
            }
        }
    ); // Menu transparent scroll

});
/*
*
* end JQuery
-------------------------------------------------------------------------------------------------------
*  Script by William C. Canin
**************************************************************************/
