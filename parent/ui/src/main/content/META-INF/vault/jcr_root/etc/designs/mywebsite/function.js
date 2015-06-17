$(document).ready(function(){
	$('.languageii-wrapper').click(function() {    			
    	return false;
    });
    $('*:not(.languageii-wrapper, .languageii-wrapper *)').click(function() {
		$('#languageii-dropdown').hide();$('#languageii-js-wrapper').removeClass('languageii-open');	$('.language-arrow-up').hide(); $('.language-arrow-down').show();
	});


	$("#languageii-header").click(function(){
		$('#languageii-dropdown').toggle();$('#languageii-js-wrapper').toggleClass('languageii-open');		$('.language-arrow-up').toggle(); $('.language-arrow-down').toggle();
	});
	$("#languageii-close-link").click(function(){
		$('#languageii-dropdown').hide();$('#languageii-js-wrapper').removeClass('languageii-open');	$('.language-arrow-up').hide(); $('.language-arrow-down').show();
	});
	$(".opt1").click(function(){
		flag=$('.flag1');	lang=$('.lang1');	swap(); navToLang();
	});
	$(".opt2").click(function(){

		flag=$('.flag2');	lang=$('.lang2'); 	swap(); navToLang();
	});
	$(".opt3").click(function(){

		flag=$('.flag3');	lang=$('.lang3');	swap();	navToLang();
	});
    $(".opt4").click(function(){

		flag=$('.flag4');	lang=$('.lang4');	swap();	navToLang();
	});
    $(".opt5").click(function(){

		flag=$('.flag5');	lang=$('.lang5');	swap();	navToLang();
	});
	function swap(){
		headFlag=$('.languageii-header-flag');
		headLang=$('.languageii-header-name');

		var temp;
		temp=flag[0].src;	flag[0].src=headFlag[0].src;	headFlag[0].src=temp;
		temp=flag[0].alt;	flag[0].alt=headFlag[0].alt;	headFlag[0].alt=temp;
		temp=lang[0].innerHTML;	lang[0].innerHTML=headLang[0].innerHTML;	headLang[0].innerHTML=temp;

	}

    function initSwap(){
		var curLoc = location.href;

        if	(curLoc.indexOf("IE") > -1)
        {	flag=$('.flag1');	lang=$('.lang1'); swap();	}

        else if	(curLoc.indexOf("FR") > -1)
        {	flag=$('.flag2');	lang=$('.lang2'); swap();	}

        else if	(curLoc.indexOf("BE") > -1)
        {	flag=$('.flag3');	lang=$('.lang3'); swap();	}

        else if	(curLoc.indexOf("DE") > -1)
        {	flag=$('.flag4');	lang=$('.lang4'); swap();	}

        else if	(curLoc.indexOf("AT") > -1)
        {	flag=$('.flag5');	lang=$('.lang5'); swap();	}



    }

    function navToLang(){
        var newLang = headLang[0].innerHTML;
        var newLoc = 'en_GB';


        if		(newLang.indexOf("(GB)") > -1)
			newLoc = 'en_GB';

        else if	(newLang.indexOf("(Ireland)") > -1)
            newLoc = 'en_IE';

        else if	(newLang.indexOf("(France)") > -1)
            newLoc = 'fr_FR';

        else if	(newLang.indexOf("(Belgium)") > -1)
            newLoc = 'fr_BE';

        else if	(newLang.indexOf("(Germany)") > -1)
            newLoc = 'de_DE';

        else if	(newLang.indexOf("(Austria)") > -1)
            newLoc = 'de_AT';

        location.href = "/content/DessPoc/"+newLoc+".html";
    }



	//$( "#datepicker" ).datepicker({ minDate: -20, maxDate: "+1M +10D" });


	initSwap();
});
