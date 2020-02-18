# A sample configuration of redis-sentinel on three nodes

An example of a [redis-sentinel](https://redis.io/topics/sentinel)
configuration on three nodes, including a testing Python client.

_For educational and experimental use only._

Here is the architecture:
```
       +----+
       | M1 |
       | S1 |
       +----+
          |
+----+    |    +----+
| R2 |----+----| R3 |
| S2 |         | S3 |
+----+         +----+
```
`R` denotes a redis-server instance, `S` denotes redis-sentinel instance, and
`M` is the master.

Configuration files are in the [configs](configs) directory.

## Requirements

* [Virtualbox](https://www.virtualbox.org/) for running virtual machines
* [Vagrant](https://www.vagrantup.com/) for setting up virtual machines

Tested on Linux.

## Installation

To create all the three boxes, run
```
vagrant up
```

## Use

To SSH into the boxes, execute
```
vagrant ssh redis1
vagrant ssh redis2
vagrant ssh redis3
```
Then, run `sudo -Hs` to get `root` access. To see how failover works, you can
stop redis-server by running
```
systemctl stop redis-server
```
To stop redis-sentinel, run
```
systemctl stop redis-sentinel
```
You can `tail -f` logs in `/var/log/redis` to see what is happening.

## Python client

In [test-client](test-client), there is a simple Python script that you can use
for your experiments. It is based on
[redis-py](https://redis-py.readthedocs.io/en/latest/).

## License

Copyright (c) 2020 Petr Zemek (<s3rvac@gmail.com>)

Distributed under the MIT license. See the `LICENSE` file for more details.
