(
SynthDef(\guitar, {
	arg out = 0, amp = 0.2, sus = 1.3, verbsus = 7.0, freq = 300;
	var snd, env;

	env = Env.perc(0.01, sus, 1, -5.0).ar(0);
	env = Env([1, 0], [verbsus * 2]).kr(2);

	snd = [FM7.arAlgo(1, [
        // freq, phase, amp
        [LFNoise1.kr(0.5) * freq.range(300, 310), 0, 1],
        [LFNoise1.kr(0.5) * freq.exprange(3, 310), 0, 1],
        [LFNoise1.kr(0.5) * freq.exprange(3, 100), 0, 1],
        [LFNoise1.kr(0.5) * freq.exprange(3, 100), 0, 1],
        [LFNoise1.kr(0.5) * freq.exprange(3, 100), 0, 1],
        [LFNoise1.kr(0.5) * freq.exprange(3, 100), 0, 1]
	], MouseX.kr(0, 2, 0, 0.1)), FM7.arAlgo(0, [
        // freq, phase, amp
        [LFNoise1.kr(0.5) * freq.range(300, 310), 0, 1],
        [LFNoise1.kr(0.5) * freq.exprange(3, 310), 0, 1],
        [LFNoise1.kr(0.5) * freq.exprange(3, 100), 0, 1],
        [LFNoise1.kr(0.5) * freq.exprange(3, 100), 0, 1],
        [LFNoise1.kr(0.5) * freq.exprange(3, 100), 0, 1],
        [LFNoise1.kr(0.5) * freq.exprange(3, 100), 0, 1],
	], MouseX.kr(0, 4, 0, 0.1))];

	snd = Pluck.ar(snd);

	snd = WaveLoss.ar(snd, MouseX.kr(0, 20.0, 0, 0.20), 20, 2);

	snd = snd * env;

	snd = GVerb.ar(snd, 300, verbsus, 0.7, 0.0, 4, 1.0, 0.3, 1.0);

	snd = Splay.ar(snd);

	Out.ar(out, snd * amp);
}).add();
)

(
Pdef(\uhh, Pbind(
	\instrument, \guitar,
/*	\freq, p({ inf.do{
		arg i = 0;
		var new_freq, freq = 30.midicps, steps = 12;

		new_freq = freq * (2 ** (i % steps / steps));
		("i: " ++ (i % steps)).postln;
		("freq: " ++ new_freq).postln;
		new_freq.yield;
	}}),*/
	\freq, Pseq([30, 32, 33, 37, 35, 42, 18] + 0 - 0 , inf),
	\dur, 1/2,
	\sus, 1/4,
	\verbsus, 5,
)).play;
)

-12 <= i <= 12;
i <= -12 --> i++;
i >= 12 --> i--;

Pdef(\uhh).stop;


(
{
	var freq = 300;
	FM7.arAlgo(2, [[freq, 0, 1], [freq * 1.4, pi/3, 0.4], [freq * 2, 0, 0.7], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]], 0.6)
}.play;
)