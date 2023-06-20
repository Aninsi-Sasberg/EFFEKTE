import os

voices_dict = {}

quote_lines = []
wavfiles = []
mouthlines = []

# Path to render Text + Audio to
# directory_in_str = "your/path"
directory_in_str = "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts"
# supercollider_mouth_path = "your/path/scdfile.scd"
supercollider_mouth_path = "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/set/mouth.scd"

# set global SC variables
pb_out = "3"
pb_amp = "2"
pb_rate = "1/5"
pb_dur = "2"


# new file or choose text file to read from
filename = input(f'Enter your filename: ')

# enter Text
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


# choose voice
voices = os.popen('say -v "?"')
voices = voices.readlines()
voices.insert(0, "System Standard")

# voices
while True:
    print("You can choose between the following voices.\n\nname\t\t\tlang\texample")
    for i, voice in enumerate(voices):
        voices_dict[i] = voice
        print(f'{i:03} {voice}')
    print(voices_dict)
    chosen_voice = int(input("Voice (number): "))
    if chosen_voice in voices_dict:
        chosen_voice = voices_dict[chosen_voice].split(" ")
        chosen_voice = chosen_voice[0]
        break

while True:
    try:
        rate = int(input("Please enter the speaking rate (in words per minute, standard was 6): "))
        break
    except:
        print("Please enter a valid number. Just integers are accepted.\n")

os.popen(f'say -rate={rate} {filename}')

if chosen_voice == "System":
    os.system(f'say -rate={rate} {filename} -o "{filename}.wav" --data-format=LEI16@15000')
else:
    os.system(f'say -v "{chosen_voice}" -rate={rate} {filename} -o "{filename}.wav" --data-format=LEI16@15000')

directory = os.fsencode(directory_in_str)
    
for file in os.listdir(directory):
     filename = os.fsdecode(file)
     if filename.endswith(".wav"): 
         wavfiles.append(os.path.join(directory_in_str, filename))


with open(supercollider_mouth_path, "w+", encoding="utf-8") as scdfile:
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
        mouthlines.append(f'(\nPdef(\p_{filename}, Pbind(\n\t\\instrument, \\s_{filename},\n\t\\dur, ~pb_dur,\n)).play(l);\n)\n\n')
        mouthlines.append(f'Pdef(\p_{filename}).stop;\n\n\n')

    scdfile.writelines(mouthlines)