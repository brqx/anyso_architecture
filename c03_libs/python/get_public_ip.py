#!/usr/local/bin/python3

import logging
import pif
import sys 
public_ip = pif.get_public_ip()

print("Public IP:" + public_ip)

