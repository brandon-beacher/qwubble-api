Qwubble
=================

Run
---

```
$ bundle install
$ gem install foreman
$ foreman start
```

### Hello World

Navigate to http://localhost:9000/api/ping with a browser or use `curl`.

```
$ curl http://localhost:9000/api/ping

{"ping":"pong"}
```

List Routes
-----------

```
rake routes
```

