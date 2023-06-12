(
o = Server.default.options;
o.numInputBusChannels = 16;
o.numOutputBusChannels = 16;
s.options.memSize_(65536 * 4);
s.reboot;
)

(
SynthDef(\atmo, {
	arg out = 0, amp = 0.5;
	var bss1, bss2, env, envL, flt, ns1, ns2, snd, inn;

	inn = SoundIn.ar(8);
	inn = BPF.ar(inn, SinOsc.kr(LFNoise2.kr(6).range(0.2, 500)).range(50, 4000));

	env = Env([0, 1, 0], [0.1, 1], -4.0).ar(0);
	envL = Env([0, 1, 0], [0.1, 6], -4.0).ar(2);

	flt = MoogFF;
	ns1 = LFNoise2.kr(0.6).range(80, 120);
	ns2 = LFNoise2.kr(5).range(50, 120);

	bss1 = Saw.ar(ns1);
	bss2 = Saw.ar(ns2);
	// snd = JPverb.ar([flt.ar(bss1, ns1 * 2), flt.ar(bss2, ns2 * 8)] + inn * env, 5.0, 0.6, 3);
	snd = inn * env;

	snd = Splay.ar(snd);

	Out.ar(out, snd * amp);

}).add;
)

s.scope();

Synth(\atmo);

(
Pdef(\atmoo,
	Pbind(
		\instrument, \atmo,
		\dur, 6.0,
		\amp, 1,
	).play;

/*	Pbind(
		\
	)*/
)
)

{JPverb.ar(SoundIn.ar(8), 20, 0.5, 4) * SinOsc.ar(LFNoise2.kr(0.4).range(40, 600));}.play();