# Git Workflow - Solution chronology

## Requirement 6: *Concurrent changes in user.py both in local and origin*
**What Happened:** There were two concurrent changes. One in the local copy of the branch and one in github. Both targeting the same file and the same lines in that file.

**How the issue was solved:** Git pull in the local copy of the branch and the conflict appeared. Both the local copy changes to that file and the origin (*Github*) changes were kept during the conflict resolution. Three screenshots were taken in gitkraken from three stages of the problem resolution - 
- before pull
- after pull when conflict surfaced 
- after conflict resolution

These screenshots can be found inside the screenshots folder.

**How the issue could have been avoided:** If the changes happened sequentially. Example - pulling the latest remote changes before making any local edits.

## Requirement 19: *Inadequate pull request commit message*
**What Happened:** The pull request was submitted with an inadequate "Some changes" message. This prompted the reviewer to close the pull request and instruct the individual who made the pull request to take certain steps. These steps are defined in the comment in the pull request and the comment is verbatim: 

*This pull request cannot be merged since the commit message "Some changes" is insufficient and does not follow git best practices when concerning git commit messages. Commit messages should follow conventional commits - https://www.conventionalcommits.org/en/v1.0.0/*

*How to fix this:*

- *Close this pull request*
- *Update the commit message to follow the conventional commits practices*
- *Push the altered commit into the branch*
- *Create a new pull request targeting develop branch*

**How the task was resolved** All the instructed steps were followed in order:
- The pull request was closed
- The commit message was adjusted via *git commit --amend -m* following the patterns specified in the provided link
- The commit was pushed via *git push --force-with-lease origin*
- A new pull request was submitted 
- The pull request was then "approved". *In our case since we were reviewing our own pull request - it was accepted and merged*

**Why was it resolved this way** The only issue here was the message. Since there were no other issues the only necessary steps were to cancel the pull request because of the commit message and have the committer redo it with a proper message following the conventional commit rules. Once that was achieved there was no other reason to not accept the pull request.

## Requirement 21: *First release*
**The steps followed:** The first release of all the features was requested under the description "version 1 of the software". Chronologically these were the steps taken:
- Switch to the develop branch locally
- Merge "feature/step-1" branch into "develop" branch → *git merge feature/step-1* 
- Handle any conflicts surfaced during merge
- Merge "feature/step-2" branch into "develop" branch → *git merge feature/step-2* 
- Handle any conflicts surfaced during merge
- Merge "feature/step-3" branch into "develop" branch → *git merge feature/step-3* ***Important: This was a mistake. Find description below.*** 
- Handle any conflicts surfaced during merge
- Merge "feature/step-4" branch into "develop" branch → *git merge feature/step-4* 
- Handle any conflicts surfaced during merge
- Push develop into origin (*GitHub repository*)
- Create a pull request from "develop" into "master" 
- "Accept" pull request
- Get the latest version of master locally → *git switch master* followed by *git pull origin*
- Add tag to the master branch → *git tag -a v1.0.0 -m "Release version 1.0.0"* followed by *git push origin v1.0.0*
- Go to github and create a release related to the v1.0.0 tag

**Why was it resolved this way:** Since the product manager requested all the completed features to go into production then the next logical step was to take all the features and place them into one branch which is then ready to go to production (master). \
That branch by convention was the develop branch, therefore all other feature branches were merged into the develop branch. \
Once that was completed all that was left was to get master branch up-to-date with all the changed hence a pull request (develop branch → master branch). \
The next two steps were creating a tag and a release so we can track and mark the versions that were deployed to the customer/client. 

**Other considerations:** Once a feature branch has been merged to the "develop" branch in this case its use has basically run out. It is good practice to delete these branches so they do not clog up the repository or have someone reference them in the future by mistake. However, they were not deleted as I do not have information on the future tasks of the excercise or whether the instructor would have any need for them otherwise.

**Note on feature/step-3 integration:** Earlier in the workflow feature/step-3 was intended to be merged via a pull request assigned to the instructor. Because the collaborator invitation was still pending acceptance, GitHub prevented assignment to the instructor as a reviewer. The branch was then inadvertently merged into develop during Requirement 21's implementation. The issue was only noticed once v1.1.0 was released. Rewriting repository history to retroactively open that pull request was intentionally avoided to preserve the history and integrity of the published releases.

## Requirement 22: *New requirement from the customer*
**The steps followed:** Considering a new requirement there was the need to create a branch. A new branch was created from the "develop" branch. This branch was named "feature/step-5". The requested changes were made and in user.py and then these changes were staged and committed. This commit was then pushed to origin. Once that happened there was a pull request to merge "feature/step-5" into "develop". Once that was done there was another pull request - now "develop" was being merged into "master". After that was finished a new tag was created "v1.1.0" followed by a release related to this tag. 

**Why was it resolved this way:** Proper gitflow practice is the creation of a separate branch when working on a feature. \
Having established that, the naming convention then follows our current pattern and best practices thus resulting in the name of the new branch being "feature/step-5". \
Considering the "develop" branch must be up-to-date since that is supposed to be the only branch merging into master (*other than hot-fixes for issues that are in production*), a pull request was made to merge changes from "feature/step-5" into develop. \
Now that "develop" was up to date it was time to merge its changes into "master" in order to give the customers the latest version with the required feature. \
Once that was done it was just a question of tagging and releasing the latest production version so we can track and mark the versions sent to the customers as described previously. 