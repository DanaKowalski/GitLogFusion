<cfparam name="URL.start" default="0" />
<cfparam name="URL.end" default="0" />
<cfset gitCounts = application.git.commitCounts(url.start, url.end) />

<div>
	<table class="table table-bordered">
		<thead>
		<tr>
			<th>Author</th>
			<th>Count</th>
		</tr>
		</thead>
		<tbody>
			<cfif structIsEmpty(gitCounts)>
				<tr>
					<td colspan="2">No results available.</td>
				</tr>
			<cfelse>
				<cfloop collection="#gitCounts#" item="author">
					<tr>
						<td><cfoutput>#author#</cfoutput></td>
						<td><cfoutput>#gitCounts[author]#</cfoutput></td>
					</tr>
				</cfloop>
			</cfif>
		</tbody>
	</table>
</div>

<cfif !structIsEmpty(gitCounts)>
	<div>
		<cfchart format="png" backgroundcolor="##272B30">
			<cfchartseries type="pie">
				<cfloop collection="#gitCounts#" item="author">
					<cfchartdata item="#author#" value="#gitCounts[author]#" />
				</cfloop>
			</cfchartseries>
		</cfchart>
	</div>
</cfif>