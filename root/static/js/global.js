$(document).ready(function(){

    var width = $(window).width(); // get window width
    // Init carousel
    $('#flexslider').flexslider({
        animation: "slide",
        directionNav: false,
        start: function(slider) {
            $('.slide-thumbs').eq(slider.currentSlide).addClass('current');
        },
        after: function(slider) {
            $('.slide-thumbs').eq(slider.currentSlide).addClass('current');
            $('.slide-thumbs').eq(slider.currentSlide-1).removeClass('current');
        }
    });
    

    // Adjust video content to fit the wallpaper ads
    if ($('#wallpaper_ad div').length > 0){
        $('#startsiden_wrapper').css({ 'margin-top' : '0','background-color' : '#FFFDF8'});  
        $('#wrapper').css({'margin-left' : '10px'});      
    }
    else if($('#topbanner').length > 0){ 
        $('#topbanner').css({ 'padding-top' : '7px' });
        $('#startsiden_wrapper').css({ 'margin-top' : '0','padding' : '0'});
    }

    // When mouse hover on the main category, the second level category will show up.
    if (width > 1280 ){
        $("ul.dropdown li").hover(function(){
            $('ul.dropdownbox',this).show();
            $('.arrow',this).show();
        }, function(){
            $('ul.dropdownbox',this).hide();
            $('.arrow',this).hide();
        }); 
    }

    // Update the hit count on the play page, bypassing the Varnish cache
    var hits_link = $('#hits_counter a');
    var update_hit_count = function() {
        $.get(
            hits_link.attr('href'),
            function (data) { hits_link.text(data.hits); }); // Runs only on success 
    }
    if ( hits_link.length ) {
    	update_hit_count();
        // Make link unclickable
        hits_link.click(function() { return false; });
    }


    // Show/hide search box on mobile
    $("#search_btn").toggle(function(){
        $(this).addClass('search-active');
        $('#search_dropbox').show();
    }, function(){
        $(this).removeClass('search-active');
        $('#search_dropbox').hide();
    });

    $(window).load(function(){
        if (width < 1280){
            if(width > 480){
                // Set height on Slide category menu
                var height = $('#wrapper').height();
                $('#slide_nav').height(height);
            }            
            // Set height on Dropdown category menu on ipad
            height = $('#content').height();
            if(height > $('#kategorier_nav').height()){
               $('#kategorier_nav').css('min-height' , height+20); 
            }
        }
    });

    // Check orientation 
    var previousOrientation = 0;
    var checkOrientation = function(){
        if(window.orientation !== previousOrientation){
            previousOrientation = window.orientation;
            // orientation changed
            var height = 0;
            if(width > 480){
                // Set height on Slide category menu
                var height = $('#wrapper').height();
                $('#slide_nav').height(height);
            }
            height = $('#content').height();
            if(height > $('#kategorier_nav').height()){
               $('#kategorier_nav').css('min-height' , height+20); 
            }
            else $('#kategorier_nav').css('min-height' , height+20);                        
        }
    };

    window.addEventListener("resize", checkOrientation, false);
    window.addEventListener("orientationchange", checkOrientation, false);

    // (optional) Android doesn't always fire orientationChange on 180 degree turns
    setInterval(checkOrientation, 2000);

    // Show/hide category menu on mobile/tablet
    if (document.all && document.addEventListener) { 
        // For IE only
        $("#nav").toggle(function(){
            $(this).addClass('sideout-active');
            $('.container').addClass('slide-nav-active').css({
                'width': $(window).width(),
                'height': $(window).height()
            });
            $('#slide_nav').show();
        }, function(){
            $(this).removeClass('sideout-active');
            $('.container').removeClass('slide-nav-active').css({
                'width': 'auto',
                'height': 'auto'
            });
            $('#slide_nav').hide();
        });    
    }
    else{
        $("#nav").toggle(function(){
            $(this).addClass('sideout-active');
            $('#slide_nav').show();
            $('#startsiden_wrapper').css({'position' : 'absolute' , 'left' : '270px'});
            $('#wrapper').css({'position' : 'fixed', 'overflow' : 'visible'});
        }, function(){
            $(this).removeClass('sideout-active');
            $('#slide_nav').hide();
            $('#startsiden_wrapper').css({'position' : 'relative' , 'left' : '0'});
            $('#wrapper').css({'position' : 'absolute', 'overflow' : 'hidden'});
        });
    }


});
