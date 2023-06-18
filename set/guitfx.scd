(
SynthDef(\fx, {
	arg out = 8, amp = 0.000, v_suss = 4;
	var snd, env, mod, vib, del_mod;

	mod = LFTri.kr(1/6, 3).range(25.midicps, (25 + 12).midicps);
	// mod = LFTri.kr(1/6, 3).range(200, 800);
	// mod = LFTri.kr(1/4, 3).range(400, 1000);
	vib = SinOsc.ar(1/6).linlin(-1.0, 1.0, 0.9, 1.1);
	del_mod = SinOsc.ar(0.2);

	// Guitar Signal
	snd = SoundIn.ar(8);

	snd = CrossoverDistortion.ar(snd, 2, 0.1, 4);

	// snd = snd * SinOsc.ar(mod.range(1000, 800));

	snd = BLowPass4.ar(snd, mod * vib, 0.01);

	snd = (BLowPass4.ar(snd, mod * vib, 0.01) * 0.1) + (snd * 0.6);

	// ballert zu sehr
	// snd = Ringz.ar(snd, mod, 0.2, 0.1);

	// snd = BLowPass.ar(snd, 3500, 0.8);

	snd = (GVerb.ar(snd, 10, v_suss, 0.2, 0.2, 30, 1.0) * 0.3) + (snd * 0.5);

	snd = [DelayC.ar(snd, 0.04, mod.range(0.04, 0.01)), DelayC.ar(snd, 0.02, mod.range(0.01, 0.02))];

	snd = snd.clip2();

	Out.ar(out, snd * amp);
}).add;


Pdef(\guitfx, Pmono(
	\fx,
	\amp, 0.0,
	// \amp, 0.01,
	// \amp, 0.03,
	// \amp, 0.04,
	// \amp, 0.08,

	\dur, 1/32,
	\v_suss, 5,

	\out, 8,
)).play(l);
)

Pdef(\guitfx).fadeTime = 5;
Pdef(\guitfx).fadeTime = 20;

Pdef(\guitfx).stop;
