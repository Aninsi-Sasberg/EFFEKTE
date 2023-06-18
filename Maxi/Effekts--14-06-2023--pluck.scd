(
SynthDef(\bass, {
	arg out = 0, amp = 0.3, freq = 55, filfreq = 220, sus = 1/2;
	var snd, env, mod;

	env = Env.perc(0.01, sus, 1, -8.0).ar(2);
	mod = (LFSaw.kr(0.01).range(freq / 4, freq * 8) * LFNoise2.kr(0.4).range(0.5, 1.5) * env.range(0.5, 1.5));

	snd = Saw.ar(freq);

	snd = BLowPass4.ar(snd, filfreq, 0.1) * env;

	snd = Splay.ar(snd) * env;

	snd = snd.clip(-1.0, 1.0);

	Out.ar(out, snd * amp);
}).add;
)

(
var fil = Array.interpolation(50, 46, 92);

Pdef(\bass, Pbind(
	\instrument, \bass,
	\midinote, Pseq([30, 32, 33, 37, 35, 42, 18], inf),
	\dur, 1/8,
	\filfreq, Prand((fil ++ fil.reverse).midicps, inf),
	\sus, 1/3,

)).play;
)

Pdef(\bass).stop;

(
SynthDef(\rifau, {
	arg out = 0, amp = 0.5, freq = 440, sus = 0.5, fac = 1;
	var snd, env;

	env = Env.perc(0.01, sus, 1, -5.0).ar(2);

	snd = SinOsc.ar(freq);

	snd = BHiPass4.ar(snd, freq * fac * env.linlin(0.0, 1.0, 0.5, 1.5), 0.1);

	// snd = WaveLoss.ar(snd, 4, 20, 1);

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

		freqs = Array.interpolation(7, 40.rrand(42), 45.rrand(82));
		// freqs = Array.linrand(7, 30, 82);
		// freqs.postln;
		freqs.yield;
	}}),
	\dur, 1/6,
	\sus, 1/4,
	\amp, 1/24,
	\fac, Prand([1.0, 2.0, 0.5, 0.25, 4, 2.5], inf),
)).play;
)

Pdef(\rifa).stop;
Tdef(\freqs).stop;
