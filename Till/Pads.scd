(
SynthDef(\sinFeedbackPad, {
	arg amp = 1, out = 0, baseFreq;
	var snd, mod, reverb, dist;
	snd = SinOscFB.ar(baseFreq, LFNoise1.kr(0.4));
	mod = Resonz.ar(snd,  [baseFreq * 2, baseFreq * 4, 40.midicps, baseFreq * 5]);
	dist= CrossoverDistortion.ar(mod, LFNoise1.kr(20), 0.3);
	Out.ar(out, Splay.ar(dist.tanh * amp));
}).add;

(
Pdef(\wupb,
	Pmono(
		\sinFeedbackPad,
		\dur, 1,
		\baseFreq, [[25.midicps, 28.midicps, 37.midicps, 40.midicps]],
		\amp, 1)
).play(l).fadeTime = 0;
//v.unmute;
);
)

s.scope;

(
SynthDef(\chordyPad, {
	arg amp = 0, out = 0, chordFreq;
	var osc, mod, reverb, dist;
	osc = Splay.ar(LFSaw.ar(chordFreq, 0.3));
	mod = MoogLadder.ar(osc, LFNoise1.kr(1, mul:100, add:800), SinOsc.kr(0.7, mul:0.5, add:1 ), 50);
	dist= CrossoverDistortion.ar(mod, LFNoise1.kr(0.3), 0.8);
	reverb = JPverb.ar(dist);
	Out.ar(out, reverb.tanh * amp);
}).add;

(
Pdef(\chord,
	Pmono(\chordyPad,
		\dur, 1,
		\chordFreq, [[37.midicps, 49.midicps, 52.midicps, 56.midicps]],
		\amp, 0.7)
).play.fadeTime = 8;
v.unmute;
);
)

(
SynthDef(\padBad, {
	arg amp = 1, out = 0, freq;
	var osc, flt, mod;
	osc = Pulse.ar(freq);
	flt = MoogFF.ar(osc, SinOsc.kr(LFNoise0.kr(0.42).range(0.001, 2.2)).range(30, 3200));
	mod = Greyhole.ar(flt, 0.2, 0.7, 0.9,0.4,0.6, modDepth:0.7, modFreq: 2 );
	Out.ar(out, Splay.ar(mod * amp).tanh);
}).add;

(
Pdef(\pady,
	Pmono(\padBad,
		\dur, 1,
		\freq, [[61.midicps, 64.midicps, 68.midicps]],
		\amp, 0)
).play.fadeTime = 2;
)
)

(
SynthDef(\pulse, {
	arg amp = 1, out = 0, freq;
	var osc, flt, dist;
	osc = LFPulse.ar(freq);
	dist= CrossoverDistortion.ar(osc, 0.1, 0.2);
	flt = Greyhole.ar(RLPF.ar(dist, MouseX(20,1200), 0.5));
	Out.ar(out, Splay.ar(flt));
}).add;
)

(
Pdef(\pulse,
	Pmono(\pulse, \dur, 1, \freq, 37.midicps)
).play(l);
)

s.options.memSize_(65536 * 12);

(
SynthDef(\pad, {
    |amp = 0.05, gate = 1, midinote|
    var ampEnv, freq, gen, fmod, rqmod, snd;

    ampEnv = EnvGen.ar(envelope: Env.adsr(3, 3, 0.8, 5, 0.5), gate: gate, doneAction: 2) * 3;
    freq = { midinote.midicps * LFNoise2.kr(1,0.01,1) }!12;
    gen = LFSaw.ar(freq: freq, mul: ampEnv);
    fmod = LFCub.kr(1/12, mul: ampEnv).range(1, MouseX.kr(2,16));
    rqmod = LFNoise2.kr(1/8, mul: ampEnv).range(0.1,1.0);
    snd = RLPF.ar(gen, freq * fmod, rqmod, ampEnv);
    Out.ar(0, Splay.ar(snd * ampEnv * amp));
}).add;
)

 