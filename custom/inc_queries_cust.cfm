﻿<!--- users user_auth_level_id   ---><cffunction name="get_users_auth" output="no" returntype="query"><cfargument name="dsn" type="string" required="yes"><cfargument name="username" type="string" required="yes"><cfargument name="password" type="string" required="yes">	<cfset password_md5 = Hash(arguments.password, "MD5")>         <cfquery name="qrs" datasource="#arguments.dsn#">	  SELECT ID,          username,          user_auth_level_id,          email	  FROM admin_users	  WHERE username = <cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.username#">      AND password = <cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#password_md5#">     </cfquery><cfreturn qrs></cffunction><!--- users plus level ---><!--- users SELECT   ---><cffunction name="get_users_level" output="no" returntype="query"><cfargument name="dsn" type="string" required="yes">     <cfquery name="qrs" datasource="#arguments.dsn#">	  SELECT admin_users.ID AS id,          admin_users.username,          admin_users.email,          admin_users.enabled,          user_auth_level.level AS auth_level,          user_auth_level.title AS auth_title          	  FROM admin_users,user_auth_level	  WHERE admin_users.user_auth_level_id = user_auth_level.ID     </cfquery><cfreturn qrs></cffunction><!--- users UPDATE WITHOUT TOUCHING PASSWORD  ---><cffunction name="set_users_nopass" output="no"><cfargument name="dsn" type="string" required="yes"><cfargument name="colStruct" type="struct" required="yes"><cfargument name="ID" type="numeric" default=0>     <cfset var constraintstring = "">     <cfif arguments.ID NEQ 0>          <cfset constraintstring = "WHERE ID = " & arguments.ID>     </cfif>     <cfquery name="qrs" datasource="#arguments.dsn#">	  UPDATE admin_users	  SET                      username = <cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.colStruct.username#">,                     <cfif arguments.colStruct.password NEQ ''>                     password = <cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.colStruct.password#">,                     </cfif>					                      user_auth_level_id = <cfqueryparam  cfsqltype="CF_SQL_TINYINT" null="#NOT len(arguments.colStruct.user_auth_level_id)#" value="#arguments.colStruct.user_auth_level_id#">,                     email = <cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.colStruct.email#">,                     enabled = <cfqueryparam  cfsqltype="CF_SQL_TINYINT" null="#NOT len(arguments.colStruct.enabled)#" value="#arguments.colStruct.enabled#">	  #constraintstring#     </cfquery></cffunction><!--- users UPDATE  PASSWORD  ---><cffunction name="set_users_pass" output="no"><cfargument name="dsn" type="string" required="yes"><cfargument name="password" type="string" required="yes"><cfargument name="ID" type="numeric" default=0>     <cfset var constraintstring = "">     <cfif arguments.ID NEQ 0>          <cfset constraintstring = "WHERE ID = " & arguments.ID>     </cfif>     <cfquery name="qrs" datasource="#arguments.dsn#">	  UPDATE admin_users	  SET                     password = <cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.password#">	  #constraintstring#     </cfquery></cffunction><!--- pages SELECT (custom choices between main/sub/tab)  ---><cffunction name="get_pages_options" output="no" returntype="query"><cfargument name="dsn" type="string" required="yes"><cfargument name="insert_type"  type="numeric" required="yes" hint="1,2 or 3">          <cfquery name="qrs" datasource="#arguments.dsn#">	  SELECT ID,          keyword,          nav_main_id,          nav_sub_id,          tab_sections_id,          nav_main_priority,          nav_sub_priority,          tab_sections_priority,          img,          img_alt_splash,          img_alt_page,          meta_description,          meta_keywords,          tag_title,          headline,          sub_headline,          body,          enabled,               google_conversion_code	  FROM pages	  <cfif arguments.insert_type EQ 1>WHERE nav_main_id <> ''</cfif>            <cfif arguments.insert_type EQ 2>WHERE nav_sub_id <> ''</cfif>            <cfif arguments.insert_type EQ 3>WHERE tab_sections_id <> ''</cfif>     </cfquery><cfreturn qrs></cffunction><!--- pages SELECT (custom choices between main/sub/tab)  ---><cffunction name="get_pages_options2" output="no" returntype="query"><cfargument name="dsn" type="string" required="yes"><cfargument name="insert_type"  type="numeric" required="yes" hint="1,2 or 3">          <cfquery name="qrs" datasource="#arguments.dsn#">	  SELECT             pages.`ID`,             pages.`keyword`,             pages.`nav_main_id`,             pages.`nav_sub_id`,             pages.`tab_sections_id`,             pages.`nav_main_priority`,             pages.`nav_sub_priority`,             pages.`tab_sections_priority`,             pages.`img`,             pages.`enabled`,                          <cfif arguments.insert_type EQ 1>             nav_main_sections.`ID` AS nav_main_sections_ID,             nav_main_sections.`title` AS nav_main_sections_title             </cfif>			 <cfif arguments.insert_type EQ 2>             nav_sub_sections.`ID` AS nav_sub_sections_ID,             nav_sub_sections.`title` AS nav_sub_sections_title             </cfif>			 <cfif arguments.insert_type EQ 3>             tab_sections.`ID` AS tab_sections_ID,             tab_sections.`title` AS tab_sections_title             </cfif>        FROM                          	  <cfif arguments.insert_type EQ 1>      	`nav_main_sections` nav_main_sections RIGHT OUTER JOIN `pages` pages ON nav_main_sections.`ID` = pages.`nav_main_id`      	WHERE nav_main_id <> ''      </cfif>            <cfif arguments.insert_type EQ 2>      	`nav_sub_sections` nav_sub_sections RIGHT OUTER JOIN `pages` pages ON nav_sub_sections.`ID` = pages.`nav_sub_id`      	WHERE nav_sub_id <> ''              </cfif>            <cfif arguments.insert_type EQ 3>      	`tab_sections` tab_sections RIGHT OUTER JOIN `pages` pages ON tab_sections.`ID` = pages.`tab_sections_id`      	WHERE tab_sections_id <> ''      </cfif>     </cfquery><cfreturn qrs></cffunction><!--- pages SELECT (one record matching the keyword)  ---><cffunction name="get_pages_keyword" output="no" returntype="query"><cfargument name="dsn" type="string" required="yes"><cfargument name="keyword"  type="string" required="yes" hint="matching keyword">          <cfquery name="qrs" datasource="#arguments.dsn#">	  SELECT ID,          keyword,          nav_main_id,          nav_sub_id,          tab_sections_id,          nav_main_priority,          nav_sub_priority,          tab_sections_priority,          img,          img_alt_splash,          img_alt_page,          meta_description,          meta_keywords,          tag_title,          headline,          sub_headline,          body,          enabled,                  google_conversion_code	  FROM pages	  WHERE keyword = '#arguments.keyword#' AND enabled = 1     </cfquery><cfreturn qrs></cffunction><!--- pages INSERT (custom choices between main/sub/tab)  ---><cffunction name="insert_pages_options" output="no"><cfargument name="dsn" type="string" required="yes"><cfargument name="insert_type" type="numeric" required="yes" hint="1,2 or 3"><cfargument name="colStruct" type="struct" required="yes"><!--- <cfdump var="#colStruct#"><cfabort> --->     <cfquery name="qrs" datasource="#arguments.dsn#">	  INSERT INTO pages (keyword,            <cfif arguments.insert_type EQ 1>nav_main_id,nav_main_priority,</cfif>            <cfif arguments.insert_type EQ 2>nav_sub_id,nav_sub_priority,</cfif>            <cfif arguments.insert_type EQ 3>tab_sections_id,tab_sections_priority,</cfif>            img,img_alt_splash,img_alt_page,meta_description,meta_keywords,tag_title,headline,sub_headline,body,enabled,google_conversion_code)VALUES (<cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.colStruct.keyword#">,<cfif arguments.insert_type EQ 1>    <cfqueryparam  cfsqltype="CF_SQL_INTEGER" null="#NOT len(arguments.colStruct.nav_main_id)#" value="#arguments.colStruct.nav_main_id#">,    <cfqueryparam  cfsqltype="CF_SQL_INTEGER" null="#NOT len(arguments.colStruct.nav_main_priority)#" value="#arguments.colStruct.nav_main_priority#">,</cfif><cfif arguments.insert_type EQ 2>    <cfqueryparam  cfsqltype="CF_SQL_INTEGER" null="#NOT len(arguments.colStruct.nav_sub_id)#" value="#arguments.colStruct.nav_sub_id#">,    <cfqueryparam  cfsqltype="CF_SQL_INTEGER" null="#NOT len(arguments.colStruct.nav_sub_priority)#" value="#arguments.colStruct.nav_sub_priority#">,</cfif><cfif arguments.insert_type EQ 3>    <cfqueryparam  cfsqltype="CF_SQL_INTEGER" null="#NOT len(arguments.colStruct.tab_sections_id)#" value="#arguments.colStruct.tab_sections_id#">,    <cfqueryparam  cfsqltype="CF_SQL_INTEGER" null="#NOT len(arguments.colStruct.tab_sections_priority)#" value="#arguments.colStruct.tab_sections_priority#">,</cfif><cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.colStruct.img#">,<cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.colStruct.img_alt_splash#">,<cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.colStruct.img_alt_page#">,<cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.colStruct.meta_description#">,<cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.colStruct.meta_keywords#">,<cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.colStruct.tag_title#">,<cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.colStruct.headline#">,<cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.colStruct.sub_headline#">,<cfqueryparam  cfsqltype="CF_SQL_LONGVARCHAR" value="#arguments.colStruct.body#">,<cfqueryparam  cfsqltype="CF_SQL_TINYINT" null="#NOT len(arguments.colStruct.enabled)#" value="#arguments.colStruct.enabled#">,<cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.colStruct.google_conversion_code#">)     </cfquery></cffunction><!--- xref_partners_cats SELECT JOINED WITH PARTNER COMPANIES AND PARTNER CATEGORIES   ---><cffunction name="get_xref_partners_cats_all" output="no" returntype="query"><cfargument name="dsn" type="string" required="yes"><cfargument name="ID" type="numeric" default=0>     <cfset var constraintstring = "">     <cfif arguments.ID NEQ 0>          <cfset constraintstring = "AND xref_partners_cats.ID = " & arguments.ID>     </cfif>     <cfquery name="qrs" datasource="#arguments.dsn#">        SELECT            partner_company_categories.title AS cat_title,            partner_company_categories.description,            partner_companies.title,            partner_companies.img,            partner_companies.url,            partner_companies.phone,            partner_companies.email        FROM            hm_insurance_site.xref_partners_cats xref_partners_cats,            hm_insurance_site.partner_company_categories partner_company_categories,            hm_insurance_site.partner_companies partner_companies        WHERE            xref_partners_cats.partner_company_category_id =             partner_company_categories.ID AND            xref_partners_cats.partner_company_id = partner_companies.ID AND            xref_partners_cats.enabled = 1        ORDER BY partner_company_categories.title     </cfquery><cfreturn qrs></cffunction><!--- tab_sections_pages SELECT tab sections with pages for home page listing   ---><cffunction name="get_tab_sections_pages" output="no" returntype="query"><cfargument name="dsn" type="string" required="yes">     <cfquery name="qrs" datasource="#arguments.dsn#">	  	SELECT             tab_sections.`ID` AS tab_sections_ID,             tab_sections.`title` AS tab_sections_title,             pages.`ID` AS pages_ID,             pages.`tab_sections_priority` AS pages_tab_sections_priority,             pages.`headline` AS pages_headline,             pages.`sub_headline` AS pages_sub_headline,             pages.`tab_sections_id` AS pages_tab_sections_id,             pages.`img` AS pages_img,             pages.`keyword` AS pages_keyword        FROM             `tab_sections` tab_sections LEFT JOIN `pages` pages ON tab_sections.`ID` = pages.`tab_sections_id` AND pages.`enabled` = 1 AND tab_sections.`enabled` = 1                                     ORDER BY             tab_sections.`priority` ASC,             pages.`tab_sections_priority` ASC     </cfquery><cfreturn qrs></cffunction><!--- tab_sections_pages SELECT tab sections with pages for home page listing   ---><cffunction name="get_main_sections_pages" output="no" returntype="query"><cfargument name="dsn" type="string" required="yes">     <cfquery name="qrs" datasource="#arguments.dsn#">        		SELECT                     nav_main_sections.`ID`,                     nav_main_sections.`title`,                     pages.`ID` AS pages_ID,                     pages.`keyword`,                     pages.`nav_main_id` AS pages_nav_main_id                FROM                     `nav_main_sections` nav_main_sections LEFT JOIN `pages` pages ON nav_main_sections.`ID` = pages.`nav_main_id` AND pages.`enabled` = 1        		WHERE nav_main_sections.`enabled` = 1                 ORDER BY                     nav_main_sections.`priority` ASC,                     pages.`nav_main_priority` ASC     </cfquery><cfreturn qrs></cffunction><!--- nav_sub_sections INSERT   ---><cffunction name="insert_nav_sub_sections_plus" output="no"><cfargument name="dsn" type="string" required="yes"><cfargument name="colStruct" type="struct" required="yes">     <cfquery name="qrs" datasource="#arguments.dsn#">	  INSERT INTO nav_sub_sections (title,enabled,priority)VALUES (<cfqueryparam  cfsqltype="CF_SQL_VARCHAR" value="#arguments.colStruct.title#">,<cfqueryparam  cfsqltype="CF_SQL_TINYINT" null="#NOT len(arguments.colStruct.enabled)#" value="#arguments.colStruct.enabled#">,<cfqueryparam  cfsqltype="CF_SQL_SMALLINT" null="#NOT len(arguments.colStruct.priority)#" value="#arguments.colStruct.priority#">)     </cfquery>          <cfquery name="maxID" datasource="#arguments.dsn#">     SELECT MAX(id) AS ID FROM nav_sub_sections     </cfquery>     <cfquery name="insertIntoPages" datasource="#arguments.dsn#">     INSERT INTO pages (nav_sub_id) VALUES (#maxID.ID#)     </cfquery></cffunction><!--- nav_sub_sections DELETE   ---><cffunction name="del_nav_sub_sections_plus" output="no"><cfargument name="dsn" type="string" required="yes"><cfargument name="ID" type="numeric" required="yes">     <cfset var constraintstring = "">     <cfif arguments.ID NEQ 0>          <cfset constraintstring = "WHERE ID = " & arguments.ID>     </cfif>     <cfquery name="qrs" datasource="#arguments.dsn#">	  DELETE 	  FROM nav_sub_sections	  #constraintstring#     </cfquery>               <cfif arguments.ID NEQ 0>          <cfset constraintstring = "WHERE nav_sub_id = " & arguments.ID>     </cfif>          <cfquery name="qrs" datasource="#arguments.dsn#">	  DELETE 	  FROM pages	  #constraintstring#     </cfquery></cffunction><cffunction name="get_sub_sections_pages" output="no" returntype="query"><cfargument name="dsn" type="string" required="yes">	<cfquery name="qrs" datasource="#arguments.dsn#">	  SELECT         nav_sub_sections.`title` AS nav_sub_sections_title,         pages.`keyword`        FROM             `pages` pages INNER JOIN `nav_sub_sections` nav_sub_sections ON pages.`nav_sub_id` = nav_sub_sections.`ID`        WHERE             nav_sub_sections.`enabled` = 1                ORDER BY             nav_sub_sections.`priority` ASC     </cfquery>          <cfreturn qrs></cffunction><!--- company_locations SELECT   ---><cffunction name="get_company_main_location" output="no" returntype="query"><cfargument name="dsn" type="string" required="yes">     <cfquery name="qrs" datasource="#arguments.dsn#">	  SELECT ID,          address_1,          address_2,          city,          state,          postal,          phone_1,          phone_2,          fax,          email_1,          email_2,          enabled,          priority,          is_primary_location	  FROM company_locations      LIMIT 1	  WHERE is_primary_location = 1     </cfquery><cfreturn qrs></cffunction>