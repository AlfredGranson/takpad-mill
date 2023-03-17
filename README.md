
# Takpad mill [![Ruby on Rails CI](https://github.com/AlfredGranson/takpad-mill/actions/workflows/rubyonrails.yml/badge.svg)](https://github.com/AlfredGranson/takpad-mill/actions/workflows/rubyonrails.yml)

Backend for takpad note sharing and collaboration app.

## Prerequisites

Ruby v3.1.1

## Installation

Download repo

```bash
git@github.com:AlfredGranson/takpad-mill.git
cd takpad-mill
```
Install the app/gems

```bash
bundle install
```

Run migrations

```bash
bundle exec rails db:migrate
```

Optionally seed some test data

```bash
bundle exec rails db:seed
```

Run the server

```bash
rails s
```
