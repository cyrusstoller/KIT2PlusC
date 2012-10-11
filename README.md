KIT2PlusC
=========

## Setting up your development/test environment

```
$ bundle install
$ rake db:create # first time only
$ rake db:migrate # only if you updated the database
$ foreman start
$ bundle exec autotest
```

## Deploying on Heroku

Setting up your application
```
$ heroku create --stack cedar
$ git push heroku master
$ heroku run rake db:create
$ heroku run rake db:migrate
```

Updating your application
```
$ git push heroku master
$ heroku run rake db:migrate # only if you updated the database
```

## Admin for dashboard and downloads
`.env`
```
ADMIN_USER=user
ADMIN_PASS=pass
ad_test=1 # either 0 or 1 - defaults to 0
```