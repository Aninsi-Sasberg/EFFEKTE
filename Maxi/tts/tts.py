import os

quote_lines = []

filename = input(f'Enter your filename: ')

while True:
    line = input("Enter a line of text, or a blank line to finish:\n")
    if len(quote_lines) == 0 and not line:
        exit()
    elif line == "":
        break
    else:
        quote_lines.append(line)
quote = "".join(quote_lines)

with open(f"{filename}.txt", "w+", encoding="utf-8") as textfile:
    textfile.writelines(quote)


os.system(f'say -rate=6 {filename} -o "{filename}.wav" --data-format=LEI16@15000')