# A testing client for our redis-sentinel example

Installation:
```
python -m venv virtualenv
source virtualenv/bin/activate
pip install -r requirements.txt
```

Now, after you have set up all the three nodes, run
```
./test-client.py
```

It should start writing `bar`s until the current master shuts down. After a
short delay due to the failover, it will start responding again with `bar`:
```
[..]
2020-02-18 18:41:32.676767 ok: b'bar'
2020-02-18 18:41:33.680525 error: Error 111 connecting to 192.168.0.11:6379. Connection refused.
2020-02-18 18:41:34.683779 error: Error 111 connecting to 192.168.0.11:6379. Connection refused.
2020-02-18 18:41:35.687585 error: Error 111 connecting to 192.168.0.11:6379. Connection refused.
2020-02-18 18:41:36.691237 error: Error 111 connecting to 192.168.0.11:6379. Connection refused.
2020-02-18 18:41:37.694758 error: Error 111 connecting to 192.168.0.11:6379. Connection refused.
2020-02-18 18:41:38.701496 ok: b'bar'
[..]
```

The client uses the [redis-py](https://redis-py.readthedocs.io/en/latest/)
library.
