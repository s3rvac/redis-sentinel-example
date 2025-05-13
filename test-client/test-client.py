#!/usr/bin/env python3

import datetime
import time

import redis
import redis.sentinel


sentinel = redis.sentinel.Sentinel(
    sentinels=[
        ('192.168.0.11', 26379),
        ('192.168.0.12', 26379),
        ('192.168.0.13', 26379),
    ],
    sentinel_kwargs={'password': 'sentinelpassword123'},
    password='serverpassword123',
)

while True:
    try:
        master = sentinel.master_for('mymaster')
        master.set('foo', 'bar')
        result = master.get('foo')
        print(datetime.datetime.now(), 'ok:', result)
    except Exception as ex:
        print(datetime.datetime.now(), 'error:', ex)
    time.sleep(1)
