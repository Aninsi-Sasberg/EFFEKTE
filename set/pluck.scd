// Pluck

(
SynthDef(\rifau, {
	arg out = 0, amp = 0.5, freq = 440, sus = 0.5, fac = 1, dist = 0.2, wv_ls = 10, atk = 0.01;
	var snd, env;

	env = Env.perc(atk, sus, 1, -5.0).ar(2);

	snd = SinOsc.ar(freq);

	snd = BHiPass4.ar(snd, freq * fac * env.linlin(0.0, 1.0, 0.5, 1.5), 0.1);

	snd = WaveLoss.ar(snd, wv_ls, 100, 1);

	snd = CrossoverDistortion.ar(snd, dist, 0.2) + snd;

	snd = snd * Saw.ar(freq * 8) * Pulse.ar(freq * 4);

	snd = Splay.ar(snd) * env;

	snd = snd.clip2();

	Out.ar(out, snd * amp);
}).add;
)

(
Pdef(\rifa, Pbind(
	\instrument, \rifau,

	\midinote, Prout({ loop{
		var freqs, tonl;

		// freqs = Array.interpolation(5, 25.rrand(42.0), 45.0.rrand(82.0));
		// freqs = Array.linrand(3, 30, 82);
		tonl = [0, 2, 3, 5, 7, 8, 10];
		freqs = [tonl.choose + 25 + [-12, 0].choose, tonl.choose + 25, tonl.choose + 25, tonl.choose + 25 + [12, 0].choose] + 12;
		// freqs.postln;
		freqs.yield;
	}}),

	\amp, 0.0,
	// \amp, 1.0,

	// \dur, 1/5,
	\dur, Pseq([Pbjorklund2(3, 7)] * 1/6, inf),
	\atk, 1/20,
	\sus, 1/2,

	\amp, 1/24,
	\fac, Prand([1.0, 2.0, 0.5, 0.25, 4, 2.5, 0.1, 3.0], inf),
	\dist, 5,
	\wv_ls, 50,
)).play(l);
)

Pdef(\rifa).fadeTime = 5;
Pdef(\rifa).fadeTime = 10;

Pdef(\rifa).stop;