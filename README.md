To run the app:

```
bundle
rake db:migrate
rake db:seed (if in development)
rails server
```

To log in as an admin, go to [/admins/sign_in](http://localhost:3000/admins/sign_in).

== TODO

* edit delivery address
* payment
* allow access to a window of recent and future pods
* pods need a 'published' flag when they are good to go
* pod needs a general summary
