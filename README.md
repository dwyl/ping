<div align="center">

# ping

Easily ping (wake) a Heroku App from its' slumber.

[![Build Status](https://img.shields.io/travis/dwyl/ping/master.svg?style=flat-square)](https://travis-ci.org/dwyl/ping)
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/ping/master.svg?style=flat-square)](http://codecov.io/github/dwyl/ping?branch=master)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/ping/issues)
[![HitCount](http://hits.dwyl.io/dwyl/ping.svg)](https://github.com/dwyl/ping)

</div>


## Why?

We have _several_ demo/example/tutorial Apps deployed to Heroku.
These are all "free" tier apps which go to sleep after 30 minutes of inactivity.
see: https://devcenter.heroku.com/articles/free-dyno-hours

In order to wake them,
we wrote a few lines of code that can be added to any
Elixir/Phoenix App and invoked as an image
in the `README.md` of the project that links to the App.

We had implemented the "wake from sleep" endpoint
several times in our Heroku Apps,
most recently in our
[`email`](https://github.com/dwyl/email/blob/b4c2c4f4d96773c326cf3fa8cd4838973c9a78f5/lib/app_web/controllers/sent_controller.ex#L113-L170)
app.

We aren't fans of copy-paste coding,
so we decided to make it a reusable package
that we can use in our _next_ app(s)!

## What?

An easy way for us to wake our Heroku demo apps.


> Note: our use case for this module is "just in time" waking of Heroku dynos.
If you need your "Free" Heroku app to be _always_ awake
or awake during specific times of day,
consider _combining_ the `ping` package with a CRON job.
You can use a _free_ service such as: https://cron-job.org
as described by [Mahdhi Rezvi](https://github.com/Mahdhir) in:
https://medium.com/better-programming/keeping-my-heroku-app-alive-b19f3a8c3a82


## Who?

This package is for anyone building an Elixir/Phoenix app deployed to Heroku
We don't expect this to be our most popular package ever.



# How?

## Installation

Install by adding `ping` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ping, "~> 1.0.0"}
  ]
end
```

Documentation available at [https://hexdocs.pm/ping](https://hexdocs.pm/ping).
