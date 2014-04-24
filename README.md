Qwubble
=================

Run
---

```
$ bundle install
$ bundle exec ruby app.rb -sv
[92117:INFO] 2013-10-18 12:54:33 :: Starting server on 0.0.0.0:9000 in test mode. Watch out for stones.
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

