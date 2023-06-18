(
SynthDef(\bass, {
	arg out = 0, amp = 0.3, freq = 55, filfreq = 220, sus = 1/2, v_suss = 5.0;
	var snd, env, v_env, mod;

	env = Env.perc(0.01, sus, 1, -8.0).ar(0);
	v_env = Env([1, 0], [v_suss]).ar(2);

	mod = (LFSaw.kr(0.01).range(freq / 4, freq * 8) * LFNoise2.kr(0.4).range(0.5, 1.5) * env.range(0.5, 1.5));

	snd = Saw.ar(freq);

	snd = BLowPass4.ar(snd, filfreq  * 1, 0.01) * env;

	// snd = CrossoverDistortion.ar(snd, 0.5, 0.2) + snd;

	snd = Splay.ar(snd) * env;

	// snd = GVerb.ar(snd, 30, v_suss, 0.2, 0.2, 30, 0.250);

	snd = snd.clip(-1.0, 1.0);

	Out.ar(out, snd * amp);
}).add;
)

(
var fil = Array.interpolation(100, 25.0, 25 + (12 * 4));

Pdef(\bass, Pbind(
	\instrument, \bass,
	// \midinote, Pseq([30, 32, 33, 37, 35, 42, 18] + 1 - 0 , inf),
	// \midinote, Pseq([0, 2, 3, 5, 7, 8] + 25 + 0, inf),
	\midinote, 25,
	\dur, 1/4,
	// \filfreq, Prand((fil ++ fil.reverse).midicps, inf),
	\filfreq, Pseq((fil ++ fil.reverse).midicps, inf),
	// \filfreq, Pseq(([fil, fil.reverse].lace(50)).midicps, inf),
	\sus, 0.75,
	\v_suss, 0.25,

)).play(l);
)

Pdef(\bass).stop;

(
SynthDef(\rifau, {
	arg out = 0, amp = 0.5, freq = 440, sus = 0.5, fac = 1;
	var snd, env;

	env = Env.perc(0.01, sus, 1, -5.0).ar(2);

	snd = SinOsc.ar(freq);

	snd = BHiPass4.ar(snd, freq * fac * env.linlin(0.0, 1.0, 0.5, 1.5), 0.1);

	snd = WaveLoss.ar(snd, MouseX.kr(0, 20), 20, 1);

	snd = CrossoverDistortion.ar(snd, MouseY.kr(0.0, 5.0), 0.2) + snd;

	snd = snd * Saw.ar(freq * 8) * Pulse.ar(freq * 4);

	snd = Splay.ar(snd) * env;

	Out.ar(out, snd * amp);
}).add;
)

(

Pdef(\rifa, Pbind(
	\instrument, \rifau,
	\midinote, Prout({ loop{
		var freqs;

		freqs = Array.interpolation(7, 40.0.rrand(42.0), 45.0.rrand(82.0));
		// freqs = Array.linrand(7, 30, 82);
		// freqs.postln;
		freqs.yield;
	}}),
	\dur, 1/2,
	\sus, 1/4,
	\amp, 1/24,
	\fac, Prand([1.0, 2.0, 0.5, 0.25, 4, 2.5], inf),
)).play(l);
)

Pdef(\rifa).stop;
Tdef(\freqs).stop;
