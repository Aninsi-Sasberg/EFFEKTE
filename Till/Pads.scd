(
SynthDef(\pad, {
    |amp = 0.1, gate = 1, midinote|
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

(
SynthDef(\sinFeedbackPad, {
	arg amp = 3, out = 0, baseFreq;
	var snd, mod, reverb, dist;
	snd = SinOscFB.ar(baseFreq, LFNoise1.kr(0.4));
	mod = Resonz.ar(snd,  [baseFreq * 2, baseFreq * 4, 40.midicps, baseFreq * 5]);
	dist= CrossoverDistortion.ar(mod, LFNoise1.kr(20), 0.5);
	reverb = GVerb.ar(dist, 8);
	Out.ar(out, Splay.ar(reverb * amp));
}).add;
)

(
SynthDef(\chordyPad, {
	arg amp = 0.05, out = 0, chordFreq;
	var osc, mod, reverb, dist;
	osc = Splay.ar(LFSaw.ar(chordFreq, 0.3));
	mod = MoogLadder.ar(osc, LFNoise1.kr(1, mul:100, add:800), SinOsc.kr(1, mul:0.5, add:1 ), 50);
	dist= CrossoverDistortion.ar(mod, LFNoise1.kr(0.1), 0.5);
	reverb = JPverb.ar(dist);
	Out.ar(out, reverb * amp);
}).add;
)

(
SynthDef(\padBad, {
	arg amp = 10, out = 0, freq;
	var osc, flt;
	osc = LFSaw.ar(freq);
	flt = Greyhole.ar(RLPF.ar(osc, SinOsc.kr(1, 0, 1240, 40)));
	Out.ar(out, Splay.ar(flt));
}).add;
)

(
SynthDef(\pulse, {
	arg amp = 10, out = 0, freq;
	var osc, flt, dist;
	osc = LFPulse.ar(freq);
	dist= CrossoverDistortion.ar(osc, 0.1, 0.2);
	flt = Greyhole.ar(RLPF.ar(dist, MouseX(20,1200), 0.5));
	Out.ar(out, Splay.ar(flt));
}).add;
)



(
Pdef(\wupb,
	Pmono(\sinFeedbackPad, \dur, 2, \baseFreq, [[25.midicps, 28.midicps, 37.midicps, 40.midicps]])
).play(l);
)

(
Pdef(\chord,
	Pmono(\chordyPad, \dur, 2, \chordFreq, [[37.midicps, 49.midicps, 52.midicps, 56.midicps]])
).stop(l);
)

(
Pdef(\padBad,
	Pmono(\padBad, \dur, 1, \freq, [[61.midicps]])
).stop(l);
)

(
Pdef(\pulse,
	Pmono(\pulse, \dur, 1, \freq, 37.midicps)
).stop(l);
)





l.tempo


Pdef(\chord).fadeTime = 5;

s.options.memSize_(65536 * 4);

Pdef(\wupb).fadeTime = 20;

Pdef(\padBad).fadeTime = 1;

 