To run the app:

```
bundle
rake db:migrate
rake db:seed (if in development)
cp env.example .env
vi .env (and add your details)
rails server
```

To log in as an admin, go to [/admins/sign_in](http://localhost:3000/admins/sign_in).

## TODO

* edit delivery address
* payment
* allow access to a window of recent and future pods