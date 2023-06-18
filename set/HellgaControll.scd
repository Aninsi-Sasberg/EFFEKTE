// panic control

~startingPosition.();
~bodyPressure.(0);


// hellga solo control

Tdef.defaultQuant = 4;

// solo start
Tdef(\hellgaSolo).play(argClock: l, quant: 1);

// solo stop
(
Tdef(\hellgaSolo).stop;
~releaseAll.(3,1);
)


// movement control

~startingPosition.();

(
~headDown.(0);
~leanDown.(1);
~gitTilt.(1);
)

(
~headDown.(1);
~gitTilt.(0);
)

~leanDownTilt.();


//test Click

(
Tdef(\hellgaSolo).play(argClock: l, quant: 1);
(
Pdef(\pattern,
	Pbind(
		\instrument, \imp,
		\dur, 1/4,
		\amp, 1,
	)
).play(argClock: l);
)

(
SynthDef(\imp, {
	|out = 0, amp = 0.9|
	var snd, env;

	env = Env.perc(0.001, 0.1).ar(2, gate: Impulse.ar(1));
	snd = SinOsc.ar(2000) * env;
	Out.ar(out, snd * amp);
}).add;
)
)






