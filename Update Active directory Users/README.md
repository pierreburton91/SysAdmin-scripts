# Update Active Directory users

Performs a loop through an array of OUs to retrieve all users.
Then, performs a loop through this user list and do the appropriate update.

Here I clear an attribute's value and update their logon name based on their full name.
I also output results in two text files to check for errors.

**Other updates can be performed.**
