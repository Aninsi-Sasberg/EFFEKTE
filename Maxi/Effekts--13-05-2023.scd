(
s.reboot();
s.meter();
s.treeView();
)

(
SynthDef(\juice, {
	arg out, amp = 0.2, freq = 430, trig, attack = 0.01, release = 0.8;
	var snd, snd1, snd2, snd3, env, lfo1, lfo2, filt;

	//env = Env.perc(0.01, 0.8).kr(2);
	env = Env([0, 1, 0], [attack, release]).kr(2);

	snd1 = SinOsc.ar(freq);
	snd2 = Pulse.ar([XLine.ar(freq, freq * 1.01, attack + release), XLine.ar(freq * 1.01, freq, attack + release)], Line.ar(0.1, 0.9, attack + release * 0.01));

	snd2 = RLPF.ar(snd2, Env([[freq * 1.01, freq], [freq * 4, freq * 4.01]], [attack, release]).kr(2), 0.2) * 0.1 + snd2;

	snd = snd1 * snd2 * env;

	snd = Splay.ar(snd);

	Out.ar(out, snd * amp);
}).add;
)

(
Pdef(
	Pbind(
		\instrument, \juice,
		//\midinote, Pbrown(20, 60, 10, inf),
		\midinote, 20,
		\stretch, Pseq([0.5], inf),
		\amp, 0.5,
	).play;
)
)