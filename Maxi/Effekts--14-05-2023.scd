s.reboot;
s.meter;

(
SynthDef(\bank, {
	arg out = 0, amp = 0.2, warp = 1.0;
	var snd, sines, env;

	sines = Array.interpolation(4, 400 * warp, 800 * warp);
	env = Env.perc().kr(2);

	sines.postln;

	snd = SinOsc.ar(sines);

	snd = snd * env;

	Out.ar(out, snd * amp);
}).add;
)

(
var
warp = [1, 0.5, 2, 0.25, 1/3, 2/3],
lerp = [4, 7, 6, 5, 3, 8];

Pdef(\poopie,
	Pbind(
		\instrument, \bank,
		\warp, Pseq(warp, inf),
		\dur, Pseq((1/warp) * 0.25, inf),
		\lerp, Pseq(lerp, inf),
	)
).play;
)

// lerp doesn't work
_______________________________


// from "Week 1: Itermediate Coding with SuperCollider - MUS 499C Spring 2021" - Eli Fieldsteel, "https://www.youtube.com/watch?v=ztVLMS15n1c&list=PLPYzvS8A_rTbTAn-ZExGuVFZgVMwYi1kJ"

(
SynthDef(\ding, {
	var sig, env, lfo1;

	env = Env([0, 1, 0.6, 0], [\atk.ir(0.01), \sus.ir(0.45), \rel.ir(2)], [\atkcrv.ir(2), \suscrv.ir(-3), \relcrv.ir(-2)]).ar(2);
	lfo1 = SinOsc.kr(5);

	sig = SinOsc.ar(\freq.ir(1000) * env.range(1, 1.04) * lfo1.range(0.99, 1.01));
	sig = sig * env;

	sig = Pan2.ar(sig, \freq.ir(1000).fold(-1.0, 1.0) * lfo1.range(-1.0, 1.0).lag(0.2), \amp.ir(0.3));

	Out.ar(\out.ir(0), sig);
	Out.ar(\outfx.ir(0), sig * \send.ir(-30).dbamp);
}).add;
)

Synth(\ding, [\freq, rrand(220, 1500.0), \atk, 0.01, \sus, 0.01, \rel, 0.1]);


TempoClock.default.tempo = 1;

// nice 3-note-chord-gen ©Aninsi Sasberg, 14-05-2023
(
var left, right;

left = Pbindef(\leftside,
	\instrument, \ding,
	\degree, Plazy({
		var rnd = rrand(0, 12), maj = rrand(0, 1);
		switch(maj, 0, Pseq([rnd, rnd + 3, rnd + 7], inf), 1, Pseq([rnd, rnd + 4, rnd + 7], inf));
	}),
);

right = left.copy(\rightside);

Ppar([left, right], inf).play();

Pbindef(\leftside).fadeTime = 2;
Pbindef(\rightside).fadeTime = 2;
)

(
Pbindef(\leftside).clear;
Pbindef(\rightside).clear;
)

(
var left, right;

Pdef(\place,
	left = Pbind(
		\instrument, \ding,
		\degree, Plazy({
			var rnd = rrand(0, 12), maj = rrand(0, 1);
			switch(maj, 0, Pseq([rnd, rnd + 3, rnd + 7], inf), 1, Pseq([rnd, rnd + 4, rnd + 7], inf));
		}),
	);

	right = left.copy;

	Ppar([left, right], inf)

).play();

Pdef(\place).fadeTime = 2;
)

Pdef(\place).clear;

(
SynthDef(\kick, {
	var env, snd;

	env = Env.perc(\atk.ir(0.003), \rel.ir(0.2), 1, \crv.ir(-20)).ar(2);

	snd = Saw.ar([\freq.ir(45.0), \freq.ir(45.0) * 1.1, \freq.ir(45.0) * 0.9, \freq.ir(45.0) * 0.8], 1).distort.tanh;
	snd = RLPF.ar(snd, env.range(\freq.ir(45.0), \freq.ir(45.0) * 4), 0.2);
	snd = snd * env;
	//snd = Pan2.ar(snd, 0, \amp.ir(1));
	snd = Splay.ar(snd, 1, \amp.ir(1));

	Out.ar(\out.ir(0), snd);
}).add;
)


(
Pdef(\kick, Pbind(\instrument, \kick,
	\freq, Prand([45, 50, 35, 55], inf),
	\rel, Prand([0.2, 0.25, 0.3, 0.1, 0.15, 0.4, 0.6, 0.7], inf),
	\crv, Prand([-12, -2, -5, -7, -20, -10, -15, -16, -25, -30], inf),
)).play;
)

Pdef(\kick).fadeTime = 2;

Pdef(\kick).clear;