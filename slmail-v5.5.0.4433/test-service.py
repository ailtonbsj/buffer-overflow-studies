import socket

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(("192.168.1.4", 110))
b = s.recv(1024)
print(b)
s.send(b'USER teste\r\n')
b = s.recv(1024)
print(b)
s.send(b'PASS teste\r\n')
b = s.recv(1024)
print(b)
s.send(b'QUIT\r\n')
s.close()
