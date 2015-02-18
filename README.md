sendgrid-datadog
===============

So this works and it creates pretty graphs:

<img src='http://shared.froese.org/2015/evvb6-14-17.jpg' border="0" />

But it's pretty inefficient as an Iron.io worker and will end up being pretty expensive.

Going to abandon for now and re-do as a small Sinatra web app.

You can adjust the Sendgrid Events webhook from [this page](https://sendgrid.com/app).

`curl -XPOST -H 'Content-Type:application/json' -H 'Accept: application/json' --data-binary @sendgrid.json http://localhost:4567/sendgrid/ -v -s`

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)
