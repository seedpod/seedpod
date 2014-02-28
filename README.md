[![Build Status](http://img.shields.io/travis/seedpod/seedpod.svg)](https://travis-ci.org/seedpod/seedpod)
[![Dependency Status](http://img.shields.io/gemnasium/seedpod/seedpod.svg)](https://gemnasium.com/seedpod/seedpod)
[![Coverage Status](http://img.shields.io/coveralls/seedpod/seedpod.svg)](https://coveralls.io/r/seedpod/seedpod)
[![Code Climate](http://img.shields.io/codeclimate/github/seedpod/seedpod.svg)](https://codeclimate.com/github/seedpod/seedpod)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://seedpod.mit-license.org)
[![Badges](http://img.shields.io/:badges-6/6-ff6799.svg)](https://github.com/pikesley/badger)

# Seedpod

The source code that runs the http://getseedpod.com site.

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