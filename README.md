# Seedpod

The source code that runs the http://getseedpod.com site.

[![Build Status](https://travis-ci.org/seedpod/seedpod.png?branch=master)](https://travis-ci.org/seedpod/seedpod)
[![Coverage Status](https://coveralls.io/repos/seedpod/seedpod/badge.png)](https://coveralls.io/r/seedpod/seedpod)
[![Dependency Status](https://gemnasium.com/seedpod/seedpod.png)](https://gemnasium.com/seedpod/seedpod)
[![Code Climate](https://codeclimate.com/github/seedpod/seedpod.png)](https://codeclimate.com/github/seedpod/seedpod)

## License

This code is open source under the MIT license. See the LICENSE.md file for 
full details.

## Development

To run the app:

```

ensure in top level directory and then
cd seedpod
bundle
rake db:migrate
rake db:seed (if in development)
cp env.example .env
vi .env (and add your details)
rails server
```

To log in as an admin, go to [/admins/sign_in](http://localhost:3000/admins/sign_in).
