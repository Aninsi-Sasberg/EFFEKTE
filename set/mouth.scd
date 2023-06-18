b = Buffer.read(s, "/Users/aninsi/Desktop/CURENT-PROJs/Video/ttsasberg/.wav");
b = Buffer.read(s, "/Users/aninsi/Desktop/CURENT-PROJs/Video/ttsasberg/The Picture of Dorian Gray.wav");
~byes = Buffer.read(s, "/Users/aninsi/Desktop/yes.wav");
~bair = Buffer.read(s, "/Users/aninsi/Desktop/air.wav");
~bhyped = Buffer.read(s, "/Users/aninsi/Desktop/hyped.wav");
~bpepps = Buffer.read(s, "/Users/aninsi/Desktop/pepps.wav");


{Out.ar(1, PlayBuf.ar(1, ~byes, 1/2))}.play;
{Out.ar(1, PlayBuf.ar(1, ~bair, 1/7))}.play;
{Out.ar(1, PlayBuf.ar(1, ~bhyped, 1/2))}.play;
{Out.ar(1, PlayBuf.ar(2, ~bpepps, 1/4)) * 0.2}.play;