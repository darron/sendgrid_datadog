sendgrid-datadog
===============

So this works and it creates pretty graphs:

<img src='http://shared.froese.org/2015/evvb6-14-17.jpg' border="0" />

But it's pretty inefficient as an Iron.io worker and will end up being pretty expensive.

The Iron.io worker was abandoned and now it works as a small Sinatra app that you can deploy on Heroku.

You can adjust the Sendgrid Events webhook from [this page](https://sendgrid.com/app).

`curl -XPOST -H 'Content-Type:application/json' -H 'Accept: application/json' --data-binary @sendgrid.json http://localhost:4567/sendgrid/ -v -s`

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

The Heroku deploy button may not work, but push the code to Heroku and setup your required [environment variables](https://github.com/darron/sendgrid_datadog/blob/master/envrc) and you'll be off to the races.
