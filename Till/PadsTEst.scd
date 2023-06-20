(
SynthDef(\stolenPad,{
	arg freq, amp = 1, out = 0;
	var snd;
	snd = Saw.ar(freq * (LFNoise2.kr(3 ! 8) * 0.1).midiratio * [1, 0.5, 2, 0.5, 0.5, 2, 0.5, 1]);
	snd = RLPF.ar(snd, LFNoise2.kr(Rand(1,3) ! 8).linexp(-1, 1, 100, 8000), 0.1);
	snd = (snd * 1.3).tanh;
	snd = RLPF.ar(snd, LFNoise2.kr(Rand(1,3) ! 8).linexp(-1, 1, 100, 8000), 0.1);
	snd = Splay.ar(snd);
	//snd = snd * Env.asr(1, 2, 2).ar(Done.freeSelf);
	// snd = snd * -20.dbamp;
	Out.ar(out, snd * amp);
}).add;
)

(
Pdef(\wupb,
	Pmono(
		\stolenPad,
		\dur, 2,
		\freq, 60.midicps,
		\amp, 1)
).play.fadeTime = 0;
)

s.scope;
