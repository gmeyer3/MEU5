﻿<div class="accordion" id="accordionPagination">  <div class="accordion-group">    <div class="accordion-heading"> <a style="text-align: left;text-decoration: none" class="accordion-toggle btn"                           data-toggle="collapse" data-parent="#accordion2" href="#collapsePagination"> <i class="icon-list"></i> Users <i class="icon-minus pull-right"></i> </a> </div>    <div id="collapsePagination" class="accordion-body collapse in">      <div class="accordion-inner" style="background-color: #ffffff;">        <cfset qrs_users = get_users_level(dsn)>        <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered" id="example">          <thead>            <tr>              <th></th>              <th>Username</th>              <th>Email</th>              <th>Auth</th>              <th></th>            </tr>          </thead>          <tbody>            <cfoutput query="qrs_users">              <cfif auth_level EQ 1>                <cfset btn = "btn-danger">                <cfelseif auth_level EQ 2>                <cfset btn = "btn-warning">                <cfelseif auth_level EQ 3>                <cfset btn = "btn-primary">              </cfif>              <cfif session.userlevel LTE auth_level>                <tr<cfif NOT enabled> class="not_enabled"</cfif>>                  <td><a href="#thisScript#?edit=#id#" class="btn btn-mini btn-warning"><i class="icon-edit"></i> edit</a></td>                  <td>#username#                     <!---  <button class="btn btn-mini btn-danger pull-right"  onclick="pwModal('#id#','#username#');"><i class="icon-key"></i> pw <i class="icon-lock"></i></button> ---></td>                  <td class="center">#email#</td>                  <td class="center"><button class="btn btn-mini #btn#"><i class="icon-user"></i> #auth_title#</button></td>                  <td class="center"><button class="btn btn-mini btn-danger" onClick="confirmation(#id#,'#username#');"><i class="icon-trash"></i> delete</button></td>                </tr>              </cfif>            </cfoutput>          </tbody>        </table>      </div>    </div>  </div></div>