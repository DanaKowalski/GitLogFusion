GitLogFusion
============

# Description

This code provides web based Git Log statistics via ColdFusion. It will provide:

* Author List from the Git repo.
* Commit counts, by author. A date range is optional.
* A range/author filtered listing of the git log. This can be provided in text or xml format.
* Related file changes, by commit id.
* Optional regex linking of commit msgs to issue tracking.

# Requirements
* cfexecute enabled on the machine, please don't use this on a production server.
* CF10-11
* patience with my lazy/quick coding.


# Installation

Refer to the application.cfc file, and configure the following for an init call:
* application.gitPath 		= (reqd) set to the path of the Git executable on the machine running this code
* application.gitRepo 		= (reqd) set to the path of the git repo on the machine that you want statistics from. 
* application.gitIssueRegex = (opt)  set to a regex to replace in a commit message with a link to your issue tracker
* application.issuePath 	= (opt)  set a path for the regex var to use in setting a link off a commit message.

