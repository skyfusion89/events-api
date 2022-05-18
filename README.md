# Event API

Rails API storing data from a JSON object

## Requirements

* Ruby. Install it with [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io). Check [.ruby-verion](.ruby-version) for the required version.

## Getting Started

This guide outlines the steps needed to start events-api.

### Basic System Setup

For the `events-api` repository on GitHub under your username. You'll end up with something like `your_user_name/events-api`.

Clone the forked repository to your development machine:

```sh
git clone git@github.com:your_user_name/event-api.git
```

and add a git remote with the git URL of the main repository:

```sh
git remote add upstream git@github.com:skyfusion89/event-api.git
```

Finally, install the Ruby version as used by the application. This information is defined in `.ruby-version` file at the root of the repository.git

### Application Setup

Execute the following steps.

#### Install the GEM dependencies

```sh
gem install bundler
bundle install
```

#### Setup Database

```sh
bundle exec rake db:create db:migrate
```

#### Generate Access Token

```sh
bundle exec rake auth:generate_access_token['<CUSTOM_CLIENT_ID>']
```
it should produce:
```sh
Your App Access ID is: TestApp
Your App Token is: MkAh2d8wOtLc/Uh3vwiUyr5UquPSYrlGLoO/Ercr6eoe1vim/rrc3Dqx/r9vf0QUZvn1iOU6hhrsof/hwyt6Hg==
```

*CUSTOM_CLIENT_ID - custom string of your choice

### Start the delayed_job Workers

```sh
bundle exec rake jobs:work
```

### Start the Application

```sh
bundle exec rails s
```

Now you can hit http://localhost:3000 in your favourite browser!

## Running the event-api Tests

To run the RSpec tests:

```sh
bundle exec rspec
```

## Test POST /events

```sh
POST http://localhost:3000/events HTTP/1.1
content-type: application/json
ClientId: <CUSTOM_CLIENT_ID>
Authorization: Token <TOKEN>

{
	"event": {
		"customer_id": "5",
		"event_code": "5",
		"event_id": "7",
		"timestamp": "2022-05-18 13:13:40 +0300",
		"property_attributes": {
			"custom_property": "foobar",
			"other_property": "foobar"
		}
	}
}
```
