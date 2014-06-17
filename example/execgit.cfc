<cfcomponent  hint="execgit since there is no cfscript equiv for cfexecute before CF11" output="false">
	<cffunction name="execGit" access="private" output="false" returntype="string">
		<cfargument name="gitCommand" 	required="true" 	type="string" />
		<cfargument name="gitArguments" required="true" 	type="string" />
		<cfargument name="logType" 			required="false" 	type="string" default="log" />
		
		<cftry>
			<cfexecute name="#getGitPath()#" arguments="--git-dir=#getRepoPath()# #arguments.gitCommand# #arguments.gitArguments#" timeout="20" variable="local.return" errorvariable="local.error"></cfexecute>
			
			<cfcatch>
				<cfreturn "Error - " & cfcatch.message & ' - ' & cfcatch.detail />
			</cfcatch>
		</cftry>
		
		<cfif len(trim(local.error))>
			<cfreturn "Error - " & local.error />
		<cfelse>
			<!--- convert to valid xml before returning --->
			<cfif trim(arguments.logType) IS "xml">
				<cfset local.return = gitLogXML(local.return) />
			</cfif>
			
			<cfreturn local.return />
		</cfif>
	</cffunction>
</cfcomponent>