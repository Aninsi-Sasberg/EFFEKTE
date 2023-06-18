import os

quote_lines = []
wavfiles = []
mouthlines = []
directory_in_str = "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts"

pb_out = "3"
pb_amp = "2"
pb_rate = "1/5"
pb_dur = "2"

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

directory = os.fsencode(directory_in_str)
    
for file in os.listdir(directory):
     filename = os.fsdecode(file)
     if filename.endswith(".wav"): 
         wavfiles.append(os.path.join(directory_in_str, filename))


with open("/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/set/mouth.scd", "w+", encoding="utf-8") as scdfile:
    mouthlines.append(f"(\n~pb_out = {pb_out};\n~pb_amp = {pb_amp};\n~pb_rate = {pb_rate};\n~pb_dur = {pb_dur};\n\n")
    
    for wavfile in wavfiles:
        filename, extension = os.path.splitext(os.path.basename(wavfile))
        mouthlines.append(f'~b_{filename} = Buffer.read(s, "{wavfile}");\n')
    mouthlines.append("\n")
    
    for wavfile in wavfiles:
        filename, extension = os.path.splitext(os.path.basename(wavfile))
        mouthlines.append(f'SynthDef(\s_{filename}, {{\n\tvar snd;\n\n\tsnd = PlayBuf.ar(1, ~b_{filename}, ~pb_rate, doneAction: 2);\n\n\tOut.ar(~pb_out, snd * ~pb_amp)\n}}).add;\n\n')
    
    mouthlines.append(")\n\n\n\n")

    for wavfile in wavfiles:
        filename, extension = os.path.splitext(os.path.basename(wavfile))
        mouthlines.append(f'//{filename}{extension}\n')
        mouthlines.append(f'(\nPdef(\p_{filename}, Pbind(\n\t\\instrument, \\s_{filename},\n\t\\dur, ~pb_dur,\n)).play;\n)\n\n')
        mouthlines.append(f'Pdef(\p_{filename}).stop;\n\n\n')

    scdfile.writelines(mouthlines)