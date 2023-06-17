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
	\dur, 1/2,
	\filfreq, Prand((fil ++ fil.reverse).midicps, inf),
	\sus, 1/3,

)).play;
)

Pdef(\bass).stop;

(
SynthDef(\rifa, {
	arg out = 0, amp = 0.3, freq = 440, sus = 0.5, gate = 0.0;
	var snd, env;

	env = Env.perc(0.01, sus, 1, -8.0).ar(2, gate);

	snd = SinOsc.ar(freq);

	snd = WaveLoss.ar(snd, 20, 30, 2);

	snd = Splay.ar(snd) * env;

	Out.ar(out, snd * amp);
}).add;
)

(
var freqs = Array.interpolation(12, 54, 82);

Pdef(\rifa, Pbind(
	\instrument, \rifa,
	\midinote, Prand(freqs, inf),
	\gate, Prand([0, 1], inf),
	\dur, 1/7,
	\sus, 1/2,

)).play;
)

Pdef(\rifa).stop;
