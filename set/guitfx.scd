// DON'T
(
SynthDef(\fx, {
	arg out = 2, amp = 0, v_suss = 4;
	var snd, env, mod, vib, del_mod;

	mod = LFTri.kr(1/6, 3).range((25 - 12).midicps, (25 + 12).midicps);
	// mod = LFTri.kr(1/6, 3).range(200, 800);
	// mod = LFTri.kr(1/6, 3).range(400, 1000);
	vib = SinOsc.ar(1/6).linlin(-1.0, 1.0, 0.9, 1.1);
	del_mod = SinOsc.ar(0.2);

	// Guitar Signal
	snd = SoundIn.ar(0);

	snd = CrossoverDistortion.ar(snd, 2, 0.1, 4);

	snd = BLowPass4.ar(snd, mod * vib, 0.01) * 0.5;

	// snd = BLowPass4.ar(snd, mod * vib, 0.01) * 1/8 + snd;

	snd = (GVerb.ar(snd, 10, v_suss, 0.2, 0.2, 30, 1.0) * 0.13) + (snd * 0.5);

	snd = [DelayC.ar(snd, 0.04, mod.range(0.04, 0.01)), DelayC.ar(snd, 0.02, mod.range(0.01, 0.02))];

	snd = snd.clip2(0.2) * 0.1;

	// snd = SinOsc.ar(440, 0.0, 0.2);
	// snd = WhiteNoise.ar(0.5);

	Out.ar(out, snd * amp);
}).add;


Pdef(\guitfx, Pmono(
	\fx,
	// \amp, 1.3,
	\amp, 1.0,
	// \amp, 0.5,
	// \amp, 0.2,
	\amp, 0.0,

	\dur, 1/32,
	\v_suss, 5,

	\out, 2,
)).play(l);
)

Pdef(\guitfx).fadeTime = 0.125;
Pdef(\guitfx).fadeTime = 0.25;
Pdef(\guitfx).fadeTime = 0.5;
Pdef(\guitfx).fadeTime = 1;
Pdef(\guitfx).fadeTime = 10;
Pdef(\guitfx).fadeTime = 20;
Pdef(\guitfx).fadeTime = 30;

Pdef(\guitfx).stop;
