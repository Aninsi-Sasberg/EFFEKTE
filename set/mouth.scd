(
~pb_amp = 0.5;
~pb_rate = 1/10;

~b_hi = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/hi.wav");
~b_stress = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/stress.wav");
~b_blink_brueder = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/blink_brueder.wav");
~b_nice = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/nice.wav");
~b_level = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/level.wav");
~b_hello = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/hello.wav");

SynthDef(\s_hi, {
	var snd;

	snd = PlayBuf.ar(1, ~b_hi, ~pb_rate, doneAction: 2);

	Out.ar(1, snd * ~pb_amp)
}).add;
SynthDef(\s_stress, {
	var snd;

	snd = PlayBuf.ar(1, ~b_stress, ~pb_rate, doneAction: 2);

	Out.ar(1, snd * ~pb_amp)
}).add;
SynthDef(\s_blink_brueder, {
	var snd;

	snd = PlayBuf.ar(1, ~b_blink_brueder, ~pb_rate, doneAction: 2);

	Out.ar(1, snd * ~pb_amp)
}).add;
SynthDef(\s_nice, {
	var snd;

	snd = PlayBuf.ar(1, ~b_nice, ~pb_rate, doneAction: 2);

	Out.ar(1, snd * ~pb_amp)
}).add;
SynthDef(\s_level, {
	var snd;

	snd = PlayBuf.ar(1, ~b_level, ~pb_rate, doneAction: 2);

	Out.ar(1, snd * ~pb_amp)
}).add;
SynthDef(\s_hello, {
	var snd;

	snd = PlayBuf.ar(1, ~b_hello, ~pb_rate, doneAction: 2);

	Out.ar(1, snd * ~pb_amp)
}).add;
)


//hi.wav
(
Pdef(\p_hi, Pbind(
	\instrument, \s_hi,
	\dur, 2,
)).play;
)
Pdef(\p_hi).stop;

//stress.wav
(
Pdef(\p_stress, Pbind(
	\instrument, \s_stress,
	\dur, 1/4,
)).play;
)
Pdef(\p_stress).stop;

//blink_brueder.wav
(
Pdef(\p_blink_brueder, Pbind(
	\instrument, \s_blink_brueder,
	\dur, 1/4,
)).play;
)
Pdef(\p_blink_brueder).stop;

//nice.wav
(
Pdef(\p_nice, Pbind(
	\instrument, \s_nice,
	\dur, 1/4,
)).play;
)
Pdef(\p_nice).stop;

//level.wav
(
Pdef(\p_level, Pbind(
	\instrument, \s_level,
	\dur, 1/4,
)).play;
)
Pdef(\p_level).stop;

//hello.wav
(
Pdef(\p_hello, Pbind(
	\instrument, \s_hello,
	\dur, 1/4,
)).play;
)
Pdef(\p_hello).stop;

