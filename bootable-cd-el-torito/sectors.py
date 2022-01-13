#!/usr/bin/python3
import sys

cd = (b"\00" * 34816) # Offset for ISO

# First Volume Descriptor
cd += b"\x00" # Type ( 0 = boot record )
cd += b"CD001" # Indentifier
cd += b"\x01" # Version
cd += b"EL TORITO SPECIFICATION" # Boot System Identifier
cd += (b"\x00" * 9) # Padding
cd += (b"\x00" * 32) # Unused
cd += b"\x13\x00\x00\x00" # Bot catalog address (in adsolute sectors)
cd += (b"\x00" * 1973) # Unused

# Volume descriptor Set Terminator
cd += b"\xff" # Type (255 = terminator)
cd += b"CD001" # Identifier
cd += b"\x01" # Version
cd += (b"\x00" * 2041) # Unused

# Validation Entry
cd += b"\x01" # Header ID
cd += b"\x00" # Platform ID ( 0 = Intel x86 )
cd += b"\x00\x00" # Reserved
cd += b"a" # ID string
cd += (b"\x00" * 23) # Padding
cd += b"\x00\x00" # Checksum (2 bytes) b"\x49\x55"
cd += b"\x55\xaa" # Key bytes

# Default Entry
cd += b"\x88" # Boot Indicator (0x88 = bootable)
cd += b"\x00" # Boot Media Type (0 = no emulation)
cd += b"\x00\x00" # Load segment
cd += b"\x00" # System Type
cd += b"\x00" # Unused
cd += b"\x01\x00" # Number of sectors to load
cd += b"\x14\x00\x00\x00" # Virtual disk address (in absolute sectors)
cd += (b"\x00" * 20) # Unused

# End of sector
cd += (b"\x00" * 1984) # Unused

sys.stdout.buffer.write(cd)