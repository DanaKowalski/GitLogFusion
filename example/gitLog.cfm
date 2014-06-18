<cfparam name="URL.author" 	default="" />
<cfparam name="URL.keyword" default="" />
<cfparam name="URL.limit" 	default="10" />
<cfset gitLog 	= application.git.log('xml','',URL.limit,URL.author) />
<cfset gitLog 	= xmlParse(gitLog) />
<cfset xmlNodes = xmlSearch(gitLog,'/GitLog/entry') />

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
		<cfloop from="1" to="#arrayLen(xmlNodes)#" index="i">
			<cftry>
				<tr>
					<td>#dateFormat(xmlNodes[i].commitDate.xmltext, "mm/dd/yy")#</td>
					<td>#xmlNodes[i].author.xmltext#</td>
					<td>
						<div style="font-weight:bold;">ID: #xmlNodes[i].id.xmltext#</div>
						<div>#application.git.gitIssueTrackingLink(xmlNodes[i].messageBody.xmltext)#</div>
						<div><pre><em>#application.git.commitFileList(xmlNodes[i].id.xmltext)#</em></pre></div>
					</td>
				</tr>

				<cfcatch>
					<tr><td colspan="3">ERROR - <cfoutput>#cfcatch.message# - #cfcatch.detail#</cfoutput></td></tr>
				</cfcatch>
			</cftry>

			<!--- dump to the screen if its a larger data set --->
			<cfif i MOD 50>
				<cfflush />
			</cfif>
		</cfloop>
	</tbody>
	</cfoutput>
</table>