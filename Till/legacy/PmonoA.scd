(
SynthDef(\test,{
	arg out = 0;
	var snd, freq = 500;
	snd = LFSaw.ar(freq);
	Out.ar(out, snd!2);
}).add;
)

(
Pdef(\testt,
	PmonoArtic(\test, \dur, 1, \legato, 1.1)
).play;
)




