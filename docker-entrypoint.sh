#!/bin/sh
python mojo/manage.py migrate --noinput
exec python mojo/manage.py runserver 0.0.0.0:8000
