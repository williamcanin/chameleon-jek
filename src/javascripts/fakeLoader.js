/*--------------------------------------------------------------------
 *JAVASCRIPT "FakeLoader.js"
 *Version:    1.1.0 - 2014
 *author:     João Pereira
 *website:    http://www.joaopereira.pt
    * https://github.com/joaopereirawd
    * http://joaopereirawd.github.io/fakeLoader.js/
 *Licensed MIT
-----------------------------------------------------------------------*/
(function ($) {

    $.fn.fakeLoader = function(options) {

        //Defaults
        var settings = $.extend({
            timeToHide:1200, // Default Time to hide fakeLoader
            pos:'fixed',// Default Position
            top:'0px',  // Default Top value
            left:'0px', // Default Left value
            width:'100%', // Default width
            height:'100%', // Default Height
            zIndex: '999',  // Default zIndex
            bgColor: '#2D4F25', // Default background color
            spinner:'spinner2', // Default Spinner
            spinnerColor:'#fff', // Default color to Spinner
            hideNav:'yes', // Default yes
            // textSpinner under construction
            textSpinner:'Please wait, loading page', // Default Please wait, loading page
            imagePath:'' // Default Path custom image
        }, options);



        //Customized Spinners
        // var htmlTextSpinner = '<div class="fl-text"><div class="fl-please-wait">'+ settings.textSpinner +'</div></div>'
        var spinner01 = '<div class="fl spinner1"><div class="double-bounce1"></div><div class="double-bounce2"></div></div>';
        var spinner02 = '<div class="fl spinner2"><div class="spinner-container container1"><div class="circle1"></div><div class="circle2"></div><div class="circle3"></div><div class="circle4"></div></div><div class="spinner-container container2"><div class="circle1"></div><div class="circle2"></div><div class="circle3"></div><div class="circle4"></div></div><div class="spinner-container container3"><div class="circle1"></div><div class="circle2"></div><div class="circle3"></div><div class="circle4"></div></div></div>';
        var spinner03 = '<div class="fl spinner3"><div class="dot1"></div><div class="dot2"></div></div>';
        var spinner04 = '<div class="fl spinner4"></div>';
        var spinner05 = '<div class="fl spinner5"><div class="cube1"></div><div class="cube2"></div></div>';
        var spinner06 = '<div class="fl spinner6"><div class="rect1"></div><div class="rect2"></div><div class="rect3"></div><div class="rect4"></div><div class="rect5"></div></div>';
        var spinner07 = '<div class="fl spinner7"><div class="circ1"></div><div class="circ2"></div><div class="circ3"></div><div class="circ4"></div></div>';

// $(this).html(htmlTextSpinner);

        //The target
        var el = $(this);

        //Init styles
        var initStyles = {
            'position':settings.pos,
            'width':settings.width,
            'height':settings.height,
            'top':settings.top,
            // 'background-color':settings.spinnerColor,
            'left':settings.left
        };

        //Apply styles
        el.css(initStyles);




        //Each
        el.each(function() {
            var a = settings.spinner;
            //console.log(a)
                switch (a) {
                    case 'spinner1':
                            el.html(spinner01);
                        break;
                    case 'spinner2':
                            el.html(spinner02);

                        break;
                    case 'spinner3':
                            el.html(spinner03);
                        break;
                    case 'spinner4':
                            el.html(spinner04);
                        break;
                    case 'spinner5':
                            el.html(spinner05);
                        break;
                    case 'spinner6':
                            el.html(spinner06);
                        break;
                    case 'spinner7':
                            el.html(spinner07);
                        break;
                    default:
                        el.html(spinner02);

                    }



                //Add customized loader image

                if (settings.imagePath !='') {
                    el.html('<div class="fl"><img src="'+settings.imagePath+'"></div>');
                }
                centerLoader();
        });



        // Change by William C. Canin
        $('.spinner1 > div,.spinner2 > div > div,.spinner3 > div,.spinner4,.spinner5 > div,.spinner6 > div,.spinner7 > div').css({
                'background-color':settings.spinnerColor
         });
        if (settings.hideNav == 'yes') {
            $('.banner').css({'display':'none'},100);
            $('.scroll-top > .btn').css({'display':'none'},100);
            $('body').css({'overflow-Y':'hidden'},100);
         }else{
            $('.scroll-top > .btn').css({'display':'none'},100);
            $('body').css({'overflow-Y':'hidden'},100);
         };

        //Time to hide fakeLoader
        setTimeout(function(){
            $(el).fadeOut();
                if (settings.hideNav == 'yes') {
                    $('.banner').css({'display':'block'},100);
                    $('.scroll-top > .btn').css({'display':'block'},100);
                    $('body').css({'overflow-Y':'auto'},100);
                }else{
                    $('.scroll-top > .btn').css({'display':'block'},100);
                    $('body').css({'overflow-Y':'auto'},100);
                };
        }, settings.timeToHide);
        // Change by William C. Canin

        //Return Styles
        return this.css({
            'backgroundColor':settings.bgColor,
            'zIndex':settings.zIndex
        });


    }; // End Fake Loader


        //Center Spinner
        function centerLoader() {

            var winW = $(window).width();
            var winH = $(window).height();

            var spinnerW = $('.fl').outerWidth();
            var spinnerH = $('.fl').outerHeight();


            $('.fl').css({
                'position':'absolute',
                'left':(winW/2)-(spinnerW/2),
                'top':(winH/2)-(spinnerH/2)
            });

        }

        $(window).load(function(){
                centerLoader();
              $(window).resize(function(){
                centerLoader();
              });
        });


}(jQuery));




