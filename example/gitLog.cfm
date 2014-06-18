<cfparam name="URL.author" 	default="" />
<cfparam name="URL.keyword" default="" />
<cfparam name="URL.limit" 	default="10" />
<cfset gitLog 	= application.git.log('piped','',URL.limit,URL.author) />
<cfset gitLog 	= listToArray(gitLog, chr(10)) />

<table class="table table-bordered">
	<thead>
		<tr>
			<th>Date</th>
			<th>Author</th>
			<th>Commit</th>
		</tr>
	</thead>

	<cfoutput>
	<tbody>
		<cfloop array="#gitLog#" index="logEntry">
			<cfset lineDetail = listToArray(logEntry, "||") />
			<cfset author = lineDetail[1] />
			<cfset date = lineDetail[2] />
			<cfset logText = lineDetail[3] />
			<cfset id = lineDetail[4] />
			<cftry>
				<tr>
					<td>#dateFormat(date, "mm/dd/yy")#</td>
					<td>#author#</td>
					<td>
						<div style="font-weight:bold;">ID: #id#</div>
						<div>#application.git.gitIssueTrackingLink(logText)#</div>
						<div><pre><em>#application.git.commitFileList(id)#</em></pre></div>
					</td>
				</tr>

				<cfcatch>
					<tr><td colspan="3">ERROR - <cfoutput>#cfcatch.message# - #cfcatch.detail#</cfoutput></td></tr>
				</cfcatch>
			</cftry>

			<!--- dump to the screen if its a larger data set --->
			<cfif arrayFind(gitLog, logEntry) MOD 50>
				<cfflush />
			</cfif>
		</cfloop>
	</tbody>
	</cfoutput>
</table>