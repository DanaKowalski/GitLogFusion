component {

    this.name 							    = "GitLogFusion";
    this.applicationTimeout 		= CreateTimeSpan(0, 0, 30, 0); 
    this.sessionManagement 			= true;
    this.sessionTimeout 				= CreateTimeSpan(0, 0, 30, 0);
		setting showdebugoutput			= "no";
    function onApplicationStart() {
      //path to run git executable
      application.gitPath				= "C:\Program Files (x86)\Git\bin\git.exe";
      //path for git repo to generate stats from
      application.gitRepo				= "C:\inetpub\wwwroot\whatever.git";
      //optional regex if found in git commit message will use application.issueTrackingPath to pop a link to the issue 
	  //(ex rm## would make rm#1036 pop a link to issue 1036)
      application.gitIssueRegex = 'rm##';
      //url for viewing a specific item using the regex
      application.issuePath 		= 'http://address/issuetracker/issues/';
      //create object
      application.git					  = createObject("component", "git").init(application.gitPath,application.gitRepo,application.issuePath,application.gitIssueRegex);
      return true;
    }

    function onSessionStart() {
    	
    }

    function onRequestStart( string targetPage ) {
    	
    }

    function onRequest( string targetPage ) {
        include arguments.targetPage;
    }

    function onRequestEnd() {}

    function onSessionEnd( struct SessionScope, struct ApplicationScope ) {}

    function onApplicationEnd( struct ApplicationScope ) {}

    function onError( any Exception, string EventName ) {}

}