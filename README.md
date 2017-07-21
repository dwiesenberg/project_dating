# project_dating
Everyone needs a little love.

Author: David Wiesenberg

Notes:





Your Task:

Build a dating application which matches users based on their responses to a series of qualifying questions (e.g. "How much do you like grilled cheese sandwiches?"). The app should allow the following behaviors:

1. Users can create accounts with basic information about themselves (there is no login system right now)
2. Users can answer questions with multiple-choice responses either when creating their accounts or at any time thereafter. Bonus: Have the user rank the "importance" that their potential partner also answered the same way so some questions will have a higher weight than others.
3. A user can display the feed of other users, ranked by the number of overlapping responses.
4. Add additional features as desired... have fun with this! The goal is to fulfill the requirements listed below, so however you do that is a victory.
5. Maybe users can send messages to each other
6. Maybe users can propose new questions
7. Maybe users can "like" someone and it's only a match if they are liked back.

Requirements
------------

Upon implementation, ensure that you have included at least one instance of each of the following new concepts:

1. Collection forms ... profile menus in questionnaire eg country
2. Nested forms ... profile
3. Polymorphic relationships ... client and Matchmaker
4. Self-referencing associations ... man and woman assoc from client
5. Use a seeds file to help with user creation!

6. (Optional) Social Graphing

Implement "Liking" and, if a "Like" is returned, it is a "Match". When displaying a list of users, also display how many degrees of separation are between each person. This means that, if Greg matches with Jill and Jill matches with Gerry and Gerry matches with Julia, then Greg is a 3rd degree match to Julia.




