# depressed_numbers.py

Today I found this script on the web... depressed refers to **déprimé** in french I found it entertaining. 😄

- I've not tested... I don't need it... I already knew it... It's fun fact

```py
import sys
import zlib
import base64

def binary_file_to_number(path):
    with open(path, "rb") as f:
        data = f.read()
    return int.from_bytes(data, "big")

def number_to_binary_file(number, output_path):
    length = (number.bit_length() + 7) // 8
    data = number.to_bytes(length, "big")
    with open(output_path, "wb") as f:
        f.write(data)

def binary_file_to_number_compressed(path):
    with open(path, "rb") as f:
        data = f.read()
    compressed = zlib.compress(data)
    return int.from_bytes(compressed, "big")

def number_to_binary_file_decompressed(number, output_path):
    length = (number.bit_length() + 7) // 8
    compressed = number.to_bytes(length, "big")
    original = zlib.decompress(compressed)
    with open(output_path, "wb") as f:
        f.write(original)

def encode_number(n, fmt):
    """
    Convert integer to chosen textual representation.
    fmt = 'dec' | 'hex' | 'b64'
    """
    if fmt == "dec":
        return str(n)

    length = (n.bit_length() + 7) // 8
    raw = n.to_bytes(length, "big")

    if fmt == "hex":
        return raw.hex()

    if fmt == "b64":
        return base64.b64encode(raw).decode("ascii")

    raise ValueError("Unknown format")

def decode_number(s, fmt):
    """
    Convert textual representation back to integer.
    """
    if fmt == "dec":
        return int(s)

    if fmt == "hex":
        return int.from_bytes(bytes.fromhex(s), "big")

    if fmt == "b64":
        raw = base64.b64decode(s)
        return int.from_bytes(raw, "big")

    raise ValueError("Unknown format")

def read_text_from_file_or_arg(arg):
    try:
        with open(arg, "r") as f:
            return f.read().strip()
    except FileNotFoundError:
        return arg

if __name__ == "__main__":

    if len(sys.argv) < 3:
        print("Usage:")
        print("  python e.py [-c] [--hex|--b64] to_number <binary_file>")
        print("  python e.py [-c] [--hex|--b64] to_binary <text_or_file> <output_file>")
        sys.exit(1)

    # Flags
    compress = False
    fmt = "dec"
    i = 1

    while i < len(sys.argv) and sys.argv[i].startswith("-"):
        if sys.argv[i] == "-c":
            compress = True
        elif sys.argv[i] == "--hex":
            fmt = "hex"
        elif sys.argv[i] == "--b64":
            fmt = "b64"
        else:
            break
        i += 1

    mode = sys.argv[i]

    # ========= to_number =========
    if mode == "to_number":
        path = sys.argv[i+1]

        if compress:
            n = binary_file_to_number_compressed(path)
        else:
            n = binary_file_to_number(path)

        print(encode_number(n, fmt))

    # ========= to_binary =========
    elif mode == "to_binary":
        text_arg = sys.argv[i+1]
        output_path = sys.argv[i+2]

        text = read_text_from_file_or_arg(text_arg)
        n = decode_number(text, fmt)

        if compress:
            number_to_binary_file_decompressed(n, output_path)
        else:
            number_to_binary_file(n, output_path)

        print(f"Wrote {output_path}")

    else:
        print("Unknown mode")
        sys.exit(1)


```

Les nombres déprimé 😸

# lol®
