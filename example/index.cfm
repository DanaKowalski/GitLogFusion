<cfset gitAuthorList 	= application.git.gitLogAuthorList() />

<!doctype html>
<html>
	<head>
	    <link rel="stylesheet" href="inc/slate.min.css">
		<link rel="stylesheet" href="inc/style.css">
	    <script type="text/javascript" src="inc/jquery.2.1.1.min.js"></script>
		<script type="text/javascript" src="inc/devdb.js"></script>
			
		<title>Git Development</title>
	</head>
	
	<body style="padding:.5em;">
		<nav class="navbar navbar-default navbar-static-top" role="navigation"><h2><a href="index.cfm">Git Development</a></h2></nav>
		
		<div class="row">
			<div class="col-md-9">
				<div class="navbar centered padded">
					<span class="padded">Author</span>
					<span class="padded">
						<select name="author" id="authorList">
							<option value="">All</option>
							<cfloop from="1" to="#arrayLen(gitAuthorList)#" index="curGitAuthor">
								<cfoutput><option value="#gitAuthorList[curGitAuthor]#">#gitAuthorList[curGitAuthor]#</option></cfoutput>
							</cfloop>
						</select>
					</span>
				</div>
				
				<div id="gitLog">
					
				</div>
			</div>
			
			<div class="col-md-3">
				<fieldset>
					<legend>Git Counts</legend>
					<div>
						<button type="button" class="gitCntBtn btn btn-primary" id="cntTotals">Totals</button>
						<cfoutput>
						<button type="button" class="gitCntBtn btn btn-default" id="01-01-#Year(now())#">#Year(now())#</button>
						<button type="button" class="gitCntBtn btn btn-default" id="01-01-#(Year(now()) - 1)#">#(Year(now()) - 1)#</button>
						<button type="button" class="gitCntBtn btn btn-default" id="#dateFormat(dateAdd('d',-30,now()), 'mm-dd-yyyy')#">Last 30 Days</button>
						</cfoutput>
					</div>
					<div id="gitCount"></div>
				</fieldset>
			</div>
		</div>
	</body>
</html>