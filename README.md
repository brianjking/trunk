# Trunk

[![Build Status](https://travis-ci.org/timdavies/trunk.svg?branch=master)](https://travis-ci.org/timdavies/trunk)

Trunk is a simple, web-based notes app.

![Trunk Screenshot](http://i.imgur.com/4GCQ1pr.png)

## Installation

Trunk is a regular Rails app and is therefore pretty straight forward to set up.
It requires Ruby 2.2 and prefers Postgres, although other databases should
work too.

### Set up the database

Go into `config/` and copy `database.yml.postgres` to `database.yml` and edit
as required, or create your own `database.yml` config from scratch.

### Create a user

By default Trunk does not allow users to sign up from the web interface. To
enable this, set an environmental variable `ENABLE_SIGNUP` to true and restart.
If you do not want to allow any other users to sign up you should remove this
environmental variable once your user is created.

## Development

Contributions are always welcome. If you introduce a new feature, please write
tests for it. Trunk uses Cucumber for integration tests.

## License

Trunk is released under the [MIT License](http://www.opensource.org/licenses/MIT).
See the attribution section below for any exceptions.

## Attribution

Thanks to Paomedia for the pin icon used in the sidebar.
https://www.iconfinder.com/icons/299069/pin_icon
