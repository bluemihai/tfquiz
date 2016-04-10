TRUE/FALSE SELF-QUIZ
====================


Issues
------
If you have a bug report or feature request, please submit an issue in Github.

Getting Started
---------------
This application requires:

- Ruby 2.2.3
- Rails 5.0.0.beta3
- Postgres

* Rename database.yml.example to database.yml and fill it out
* Rename application.yml.example to application.yml and fill it out.
  * We are not currently emailing users, so don't worry about GMAIL_USERNAME
  * Create your own [local Github auth app](https://github.com/settings/applications/new)
    * Set Authorization callback URL to http://localhost:3000/auth/github/callback


Contributing
------------

Please do!  Like using this app and don't love everything about it?  Get in the kitchen and improve it.

You can contribute by either writing questions, or writing code.  For the latter

* Pick a story from our [Trello board backlog](https://trello.com/b/wgbIjbj1/tf-quiz) - ask bluemihai for access
* Create a new branch with a descriptive name
* Don't forget to write specs for it!
* When done, either
  * send a pull request
  * get a code review on your own, push to development, let bluemihai know
* This is a permissive contribution policy.  Please...
  * do not merge failing specs into development
  * do not push to master without checking in with bluemihai
* Notify bluemihai so he can merge into master and push into production

Credits
-------
Contributors: Mihai Banulescu.

License
-------
[MIT License](https://en.wikipedia.org/wiki/MIT_License)


Rails Apps Composer
-------------------
This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).  Thank you!
