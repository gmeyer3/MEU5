<!DOCTYPE html><html lang="en"><head><cfinclude template="inc_includes_all.cfm"><cfif NOT structKeyExists(session,'username')>  <cflocation url="index.cfm"></cfif><cfif session.userlevel GT 2>    	<cflocation url="#rejectPageLoc#"></cfif><cfset head_tag_code()></head><body><cfset header_html('Users')><div class="container-fluid">  <div class="row-fluid">    <div class="span2">      <cfset left_top_html()>      <cfset left_nav_html()>            <!--/.well -->     </div>    <!--/span-->    <div class="span10">             <!--- <div class="row-fluid">    <ul class="breadcrumb pull-right">        <li><a href="#">Home</a> <span class="divider">/</span></li>        <li><a href="#">Library</a> <span class="divider">/</span></li>        <li class="active">Data</li>    </ul></div> --->            <div class="well">                <cfif structKeyExists(form,'action')>            <div class="alert alert-success" data-close="normal">                <h2>Your update was successful!</h2>            </div>        </cfif><!-----------------------------------------------------------------------------------------------------------------------------SHOW ADD FORM----------------------------------------------------------------------------------------------------------------------------->                 <cfinclude template="admin_users/add_form.cfm">            <!-----------------------------------------------------------------------------------------------------------------------------SHOW SINGLE RECORD FOR EDITING (IF URL.EDIT EXISTS)----------------------------------------------------------------------------------------------------------------------------->                           <!--- Only show if url.edit is defined --->            <cfif structKeyExists(url,'edit')>                        	                <cfinclude template="admin_users/edit_form.cfm">            </cfif>           <!-----------------------------------------------------------------------------------------------------------------------------PROCESS **INSERT** RECORD IF PASSED----------------------------------------------------------------------------------------------------------------------------->   <cfif structKeyExists(form,'action')>	<cfif form.action EQ 'add'>        	<cfset form.password = hash(form.password,'md5')>		<cfset insert_admin_users(dsn,form)>        </cfif></cfif>         <!-----------------------------------------------------------------------------------------------------------------------------PROCESS **UPDATE** RECORD IF PASSED----------------------------------------------------------------------------------------------------------------------------->   <cfif structKeyExists(form,'action')>	<cfif form.action EQ 'edit'>        	<cfif structKeyExists(form,'password')>        	<cfset form.password = hash(form.password,'md5')>        <cfelse>        	<cfset form.password = ''>        </cfif>		<cfset set_users_nopass(dsn,form,form.rid)>        </cfif></cfif><!-----------------------------------------------------------------------------------------------------------------------------PROCESS **DELETE** RECORD IF PASSED----------------------------------------------------------------------------------------------------------------------------->   <cfif structKeyExists(url,'delete')>	        	<cfset del_admin_users(dsn,url.delete)>                <!--- Re-visit page with clean url --->        <cflocation url="#thisScript#">    </cfif>         <!-----------------------------------------------------------------------------------------------------------------------------SHOW EDITABLE RECORDS WITH PAGINATION----------------------------------------------------------------------------------------------------------------------------->                     <cfinclude template="admin_users/edit_index.cfm">          </div>      </div>      </div></div><!--/.fluid-container--> <cfset footer_script_links()><script>    $('.textarea').wysihtml5();</script> <script type="text/javascript" charset="utf-8">    $(prettyPrint);			function confirmation(delRecID,dispString) {		var answer = confirm("Delete " + dispString + "?")		if (answer){			window.location = "?delete=" + delRecID;		}		//else{		//	alert("Record Untouched...")		//}	}		$(document).ready(function(){			// Validate		// http://bassistance.de/jquery-plugins/jquery-plugin-validation/		// http://docs.jquery.com/Plugins/Validation/		// http://docs.jquery.com/Plugins/Validation/validate#toptions					$('#Add_form').validate({			rules: {			   username: {				required: true				//,email: true			  }, password: {				required: true				//,email: true			  }, user_auth_level_id: {				required: true				//,email: true			  }, email: {				required: true				,email: true			  } 			},			highlight: function(label) {				$(label).closest('.control-group').addClass('error');			},			success: function(label) {				label					.text('OK!').addClass('valid')					.closest('.control-group').addClass('success');			},			focusCleanup: true		  });		  		  $('#Edit_form').validate({			rules: {			    username: {				required: true				//,email: true			  }, user_auth_level_id: {				required: true				//,email: true			  }, email: {				required: true				,email: true			  } 			},			highlight: function(label) {				$(label).closest('.control-group').addClass('error');			},			success: function(label) {				label					.text('OK!').addClass('valid')					.closest('.control-group').addClass('success');			},			focusCleanup: true		  });		  	}); // end document.ready</script></body></html>