(
~pb_out = 4;
~pb_amp = 2;
~pb_rate = 1/5;
~pb_dur = 2;

~b_hi = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/hi.wav");
~b_stress = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/stress.wav");

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


