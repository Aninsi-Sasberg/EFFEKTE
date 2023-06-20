(
SynthDef(\guitfx, {
	arg out = 0, amp = 0.02;
	var snd, env, mod, vib;

	mod = LFTri.kr(1/6, 3).range(400, 1700);
	vib = SinOsc.ar(1/6).linlin(-1.0, 1.0, 0.9, 1.1);

	// Guitar Signal
	snd = SoundIn.ar(8);

	snd = CrossoverDistortion.ar(snd, 0.75, 0.1, 4);

	// snd = snd * SinOsc.ar(mod.range(1000, 800));

	snd = BLowPass4.ar(snd, mod * vib, 0.1);

	// ballert zu sehr
	// snd = Ringz.ar(snd, mod, 0.2, 0.1);

	snd = snd.clip2();

	Out.ar(out, snd * amp);
}).add;
)

Synth(\guitfx).stop;
Synth(\guitfx);

(
SynthDef(\pling, {
	arg out = 0, freq = 300, amp = 0.8, v_sus;
	var snd, env, v_env;

	env = Env.perc(1/32, l.tempo * 1/32, 1, -10.0).ar(0);
	v_env = Env([1, 0], [v_sus]).ar(2);

	snd = Saw.ar(freq);

	snd = snd * env;

	snd = GVerb.ar(snd, 300, v_env * 1.5, 0.7, 0.2, 30, 0.3);

	snd = Splay.ar(snd);

	Out.ar(out, snd * amp);
}).add;
)

(
Pdef(\plung, Pbind(
	\instrument, \pling,
	\dur, Pseq([1/2, 2/6, 1/16], inf),
	\midifreq, 120,
)).play(l);
)

Pdef(\plung).stop;

(
SynthDef(\noize, {
	arg out = 0, freq = 300, amp = 0.8, v_sus;
	var snd, env, v_env;

	env = Env.perc(1/2, l.tempo * 1/16, 1, -15.0).ar(0);
	v_env = Env([1, 0], [v_sus]).ar(2);

	snd = WhiteNoise.ar();

	snd = snd * env;

	snd = BLowPass4.ar(snd, MouseX.kr(30.0, 2000.0), 0.01);

	snd = CrossoverDistortion.ar(snd, 0.6, 0.2) + snd;

	// snd = GVerb.ar(snd, 300, v_env * 1.5, 0.7, 0.2, 30, 0.3);

	snd = Splay.ar(snd);

	Out.ar(out, snd * amp);
}).add;
)

(
Pdef(\nois, Pbind(
	\instrument, \noize,
	\dur, 1/2,
	\midifreq, 120,
)).play(l);
)

Pdef(\nois).stop;

l.tempo = 120 / 60;