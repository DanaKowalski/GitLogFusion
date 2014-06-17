<cfparam name="URL.range" default="0" />
<cfset gitCounts = application.git.commitCounts(url.range,0) />

<div>
	<table class="table table-bordered">
		<thead>
		<tr>
			<th>Author</th>
			<th>Count</th>
		</tr>	
		</thead>
		<tbody>
			<cfloop from="1" to="#structCount(gitCounts)#" index="i">
				<tr>
					<td><cfoutput>#gitCounts[i]['author']#</cfoutput></td>
					<td><cfoutput>#gitCounts[i]['count']#</cfoutput></td>
				</tr>
			</cfloop>
		</tbody>
	</table>
</div>

<div>
	<cfchart format="png" backgroundcolor="##272B30">
		<cfchartseries type="pie">
			<cfloop from="1" to="#structCount(gitCounts)#" index="i">
				<cfchartdata item="#gitCounts[i]['author']#" value="#gitCounts[i]['count']#" />
			</cfloop>
		</cfchartseries>
	</cfchart>
</div>