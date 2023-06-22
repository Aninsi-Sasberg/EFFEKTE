// Bass

(
SynthDef(\bass, {
	arg out = 0, amp = 1, freq = 55, filfreq = 220, sus = 1/2, v_suss = 5.0, dist = 3, f_q = 0.1, atk = 0.01;
	var snd, env, v_env, mod;

	env = Env.perc(atk, sus, 1, -8.0).ar(0);
	v_env = Env([1, 0], [v_suss]).ar(2);

	mod = (LFSaw.kr(0.01).range(freq / 4, freq * 8) * LFNoise2.kr(0.4).range(0.5, 1.5) * env.range(0.5, 1.5));

	snd = Saw.ar(freq);

	snd = BLowPass4.ar(snd, filfreq * 1, f_q) * env;

	snd = CrossoverDistortion.ar(snd, dist, 0.2) + snd;

	snd = Splay.ar(snd) * env;

	// snd = (GVerb.ar(snd, 30, v_suss, 0.2, 0.2, 30, 0.0) * 0.15) + (snd * 0.25);

	snd = snd.clip(-1.0, 1.0);

	Out.ar(out, snd * amp);
}).add;
)

(
var fil = Array.interpolation(100, 40, 25 + (24 * 4));

Pdef(\bass, Pbind(
	\instrument, \bass,

	// \amp, 0.38,
	// \amp, 0.30,
	\amp, 0.25,
	// \amp, 0.18,
	// \amp, 0.1,
	\amp, 0.0,

	\midinote, Pseq([25, 27, 28, 32, 30, 37, 13] + 0 - 0, inf),
	// \midinote, Prand([0, 2, 3, 7, 5, 12, -12] + 25 + 12 - 0, inf),
	// \midinote, Pseq([0, 2, 3, 5, 7, 8] + 25 + 0, inf),
	// \midinote, 25,

	\dur, 1/6,
	// \dur, 1/16,
	// \dur, Pseq([Pbjorklund2(7, 9) * 1/6], inf),

	// \filfreq, Prand((fil ++ fil.reverse).midicps, inf),
	\filfreq, Pseq(((fil ++ fil.reverse) + 0).midicps, inf),
	// \filfreq, Pseq(([fil, fil.reverse].lace(50)).midicps, inf),

	\atk, 1/100,
	\sus, 1/6,
	\v_suss, 1/8,

	\dist, 1.0,
	// \dist, 0.5,
	// \dist, 2,
	// \dist, 10,
	// \dist, 30,
	\f_q, 0.01,

)).play(l);
)

Pdef(\bass).fadeTime = 2;
Pdef(\bass).fadeTime = 5;
Pdef(\bass).fadeTime = 20;

Pdef(\bass).stop;

