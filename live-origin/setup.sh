#!/bin/bash
DOMAIN_NAME="ec2-35-158-106-130.eu-central-1.compute.amazonaws.com"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt
