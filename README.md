<div align="center">

# `ping` 🏓

Easily ping (wake) an idle Heroku App from slumber.

[![Build Status](https://img.shields.io/travis/dwyl/ping/master.svg?style=flat-square)](https://travis-ci.org/dwyl/ping)
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/ping/master.svg?style=flat-square)](http://codecov.io/github/dwyl/ping?branch=master)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/ping/issues)
[![HitCount](http://hits.dwyl.io/dwyl/ping.svg)](https://github.com/dwyl/ping)

</div>

<br />

## Why? 🤷

We have _several_ demo/example/tutorial Apps deployed to Heroku. <br />
Apps on the "free" tier
go to sleep after **30 minutes** of inactivity. <br />
see: https://devcenter.heroku.com/articles/free-dyno-hours

In order to wake them,
we wrote a few lines of code that can be added to any
Elixir/Phoenix App and invoked as an image
in the `README.md` of the project that links to the App.
So the app is ready to go by the time the person
_reading_ the `README.md` clicks on the link. 🔗

We had implemented the "wake from sleep" endpoint
several times in our Heroku Apps,
most recently in our
[`email`](https://github.com/dwyl/email/blob/b4c2c4f4d96773c326cf3fa8cd4838973c9a78f5/lib/app_web/controllers/sent_controller.ex#L113-L170)
app.
After copy-pasting the code a couple of times,
we decided to make it a DRY reusable package
that we can use in our _next_ app(s)!

<br />

## What? 💡

An easy way for us to wake our Heroku demo apps.


> Note: our use case for this module is "just in time" waking of Heroku dynos. <br />
If you need your "Free" Heroku app to be _always_ awake
or awake during specific times of day,
consider _combining_ the `ping` package with a CRON job.
You can use a _free_ service such as: https://cron-job.org
as described by [Mahdhi Rezvi](https://github.com/Mahdhir) in:
https://medium.com/better-programming/keeping-my-heroku-app-alive-b19f3a8c3a82

<br />

## Who? 👤

This package is for anyone building
an Elixir/Phoenix app deployed to Heroku.

<br />

# How? 💻

Add `ping` to your Phoenix App
and use it to wake your Heroku App in 4 easy steps:

<br />

## 1. Installation 📝

Install by adding `ping` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ping, "~> 1.0.1"},
  ]
end
```

e.g:
[`mix.exs#L61`](https://github.com/dwyl/phoenix-content-negotiation-tutorial/blob/87de50be353e372007cff3b1c4e7d4e0927a61b4/mix.exs#L61)

<br />

## 2. Create a `get /ping` Route in your `router.ex`

Open the `router.ex` file of your Phoenix project
and add the following route to your default pipeline:

```elixir
get "/ping", PingController, :ping
```

e.g:
[`lib/app_web/router.ex#L21`](https://github.com/dwyl/phoenix-content-negotiation-tutorial/blob/909c80e4dd23d99589cd13c9ecb5fee1b9575c71/lib/app_web/router.ex#L21)

<br />

## 3. Create the `ping/2` Function in your Controller

```elixir
defmodule AppWeb.PingController do
  use AppWeb, :controller

  # see: github.com/dwyl/ping
  def ping(conn, params) do
    Ping.render_pixel(conn, params)
  end
end
```

e.g:
[`lib/app_web/controllers/ping_controller.ex#L5-L7`](https://github.com/dwyl/phoenix-content-negotiation-tutorial/blob/909c80e4dd23d99589cd13c9ecb5fee1b9575c71/lib/app_web/controllers/ping_controller.ex#L5-L7)

<br />

You can either create a brand new controller,
or use an existing one if you prefer. <br />
We've created a new controller for clarity/separation.


### 3.b Create the Corresponding Test (Optional+Recommended)

Create the corresponding test file
to keep your Test coverage complete:

```elixir
defmodule AppWeb.PingControllerTest do
  use AppWeb.ConnCase

  test "GET /ping (GIF) renders 1x1 pixel", %{conn: conn} do
    conn = get(conn, Routes.ping_path(conn, :ping))
    assert conn.status == 200
    assert conn.state == :sent
    assert conn.resp_body =~ <<71, 73, 70, 56, 57>>
  end
end
```

e.g:
[`test/app_web/controllers/ping_controller_test.exs#L5-L10`](https://github.com/dwyl/phoenix-content-negotiation-tutorial/blob/909c80e4dd23d99589cd13c9ecb5fee1b9575c71/test/app_web/controllers/ping_controller_test.exs#L5-L10)


## 4. Add a `GIF` to the `README.md` of the Heroku App

Add an image linking to the endpoint of the App
to the `README.md` file:

```md
![wake-sleeping-heroku-app](http://phxtodo.herokuapp.com/ping)
```

e.g: [pull/5/files](https://github.com/dwyl/phoenix-content-negotiation-tutorial/pull/5/files)

![ping-image-added-to-readme](https://user-images.githubusercontent.com/194400/83339303-71843180-a2c4-11ea-8719-675c96121a8b.png)



> The GIF is a _transparent_ 1x1 pixel,
so it's both minimal in size
to minimise response time
and _invisible_ to the person.
The idea is just to make the most basic HTTP request
to the Heroku app in order to wake it.
We don't actually care what is returned.
But we don't want it to `404`
so the person reading the `README.md`
doesn't see an error in their console/browser.





Docs available at
[https://hexdocs.pm/ping](https://hexdocs.pm/ping).
But there's really not much to it.
