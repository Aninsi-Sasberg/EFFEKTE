(
~pb_out = 0;
~pb_amp = 2;
~pb_rate = 1/5;
~pb_dur = 2;

~b_hi = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/hi.wav");
~b_stress = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/stress.wav");
~b_hellga_solo = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/hellga_solo.wav");

SynthDef(\s_hi, {
	var snd;

	snd = PlayBuf.ar(1, ~b_hi, ~pb_rate, doneAction: 2);

	Out.ar(~pb_out, snd * ~pb_amp)
}).add;

SynthDef(\s_stress, {
	var snd;

	snd = PlayBuf.ar(1, ~b_stress, ~pb_rate, doneAction: 2);

	Out.ar(~pb_out, snd * ~pb_amp)
}).add;

SynthDef(\s_hellga_solo, {
	arg out = 0;
	var snd;

	snd = PlayBuf.ar(2, ~b_hellga_solo, 1, loop:1.0, doneAction: 2);

	Out.ar(out, snd * ~pb_amp)
}).add;

)


//##################################################
//Pdefs

//hi.wav
(
Pdef(\p_hi, Pbind(
	\instrument, \s_hi,
	\dur, ~pb_dur,
)).play(l);
)

Pdef(\p_hi).stop;


//stress.wav
(
Pdef(\p_stress, Pbind(
	\instrument, \s_stress,
	\dur, ~pb_dur,
)).play(l);
)

Pdef(\p_stress).stop;


//hellga_solo.wav
(
Pdef(\p_hellga_solo, Pbind(
	\instrument, \s_hellga_solo,
	\dur, Pseq([0]),
	\out, 8,
)).play(l);
)

Pdef(\p_hellga_solo).stop;


