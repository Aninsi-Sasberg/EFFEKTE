// Roboter beschicken

s.meter();
s.plotTree();

TempoClock(75/60);

(
Ndef(\trig, {
	var snd;

	snd = Impulse.ar([4/3, 16/4]);
})
)

(
SynthDef(\bass, {
	arg out = 0, amp = 0.5, gate = 0.0;
	var snd, env;

	//env = EnvGen.ar(Env.perc(), \trigin.ar([0, 0]), doneAction:2);
	env = EnvGen.ar(Env.perc(0.01, 0.1), gate, doneAction:2);
	snd = SinOsc.ar(40) * 0.5 + SinOsc.ar(40 * env.range(1, 2) * SinOsc.ar([5000, 200, 20]).range(0.5, 2)) * env;

//	snd = snd * \lfo1.ar([0, 0]);

	snd = Splay.ar(snd);

	Out.ar(out, snd * amp);
}).add();

)

(
SynthDef(\hat, {
	arg out = 0, amp = 0.005, gate = 0.0;
	var snd, env;

	env = EnvGen.ar(Env.perc(0.01, 0.8, curve:-16), gate, doneAction:2);
	snd = WhiteNoise.ar() !2 * env;
	snd = RHPF.ar(snd, 600, 0.3);

	Out.ar(out, snd * amp);
}).add();
)

(
Ndef(\lfo1, {
	arg freq = 0.4;
	var lfo;

	lfo = LFNoise2.kr([freq, freq * pi]).range(0.0, 1.0);
})
)

Ndef(\bass) <<>.trigin Ndef(\trig);
Ndef(\bass) <<>.lfo1 Ndef(\lfo1);

(
var division = 32;

Pdef(\kick,
	Pbind(\instrument, \bass,
		\amp, 0.5,
		\dur, P[division/3, division/7, division/9, division/16]
	);

).play();

Pdef(\hat,
	Pbind(\instrument, \hat,
		\amp, 0.01,
	);

).play();
)