<!DOCTYPE HTML><html><head><meta charset="utf-8"><cfinclude template="inc_includes_all.cfm"><title>Page Title Here</title><cfset scriptCssLinks()><script type="text/javascript">jQuery(document).ready(function(){	$('.fadein img:gt(0)').hide();	setInterval(function(){jQuery('.fadein :first-child').fadeOut(200).next('img').fadeIn(600).end().appendTo('.fadein');}, 3500);});function butTog(thisObj,locID){ //uses set prefixes to identify affected toggle	$('#' + locID).toggle('fast');	//console.log($(thisObj).find('i').hasClass('icon-chevron-up icon-white'));	if($(thisObj).find('i').hasClass('icon-chevron-up icon-white')){		$(thisObj).find('i').attr('class','icon-chevron-down icon-white');		$(thisObj).find('span').html('More ');	} else {		$(thisObj).find('i').attr('class','icon-chevron-up icon-white');		$(thisObj).find('span').html('Less ');	}	}</script></head><body><!-- header --><cfset headerNav(dsn)><!-- /header --><div class="container">   <!-- Main hero unit for a primary marketing message or call to action -->    <div style="position:relative;min-height:300px;width:946px;overflow:hidden;">      <cfoutput>      <div style="position:absolute; left:0;top:0;z-index:30;margin-top:-4px;width:946px;text-align:center;">      		<a href="#QUOTE_URL#" class="btn btn-primary">Free Auto Quote NOW &raquo;</a>            <a href="#QUOTE_URL#" class="btn btn-primary" style="margin-left:50px;margin-right:25px;">Free Home Quote NOW &raquo;</a>             <a href="#QUOTE_URL#" class="btn btn-primary" style="margin-left:25px;margin-right:50px;">Need Life Insurance NOW &raquo;</a>             <a href="#QUOTE_URL#" class="btn btn-primary">Annuity Information NOW &raquo;</a>       </div>	  </cfoutput>      <div class="fadein" style="position:absolute; left:0;top:0;z-index:10;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px;height:300px; background-color:white;overflow:hidden;">        <img src="assets/header_1.jpg" style="-webkit-border-radius:6px;" alt="Teachers Insurance Specialists">        <img src="assets/header_2.jpg" style="-webkit-border-radius:6px;" alt="Teachers Insurance Specialists">        <img src="assets/header_3.jpg" style="-webkit-border-radius:6px;" alt="Teachers Insurance Specialists">        <img src="assets/header_4.jpg" style="-webkit-border-radius:6px;" alt="Teachers Insurance Specialists">      </div>        </div>    <section id="homepage" style="margin-top:12px;">    <div class="row">    	<div class="span12">        	<cfset subNav(true)>        </div>    </div>    <hr class="soften">           <div class="row">   	<cfset tabsDisp(dsn,4)>   </div>        <cfset qrs_splash_text = get_splash_text(dsn)><!--- Expecting only 2 records --->   <div class="row">      <cfoutput query="qrs_splash_text">      <div class="span6">     		#body#      </div>	  </cfoutput>	</div>                  </section>  <hr class="space"></div><!-- end container --><cfset footer_code()>   <script type="text/javascript"> 	  var _gaq = _gaq || [];	  _gaq.push(['_setAccount', 'UA-???-1']);	  _gaq.push(['_trackPageview']);	 	  (function() {		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);	  })();	 	</script></body></html>