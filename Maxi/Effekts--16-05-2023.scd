s.reboot;

(
SynthDef(\dudummi, {
	var snd, env, lfo1, lfo2;

	env = Env.perc().ar(2);

	snd = SinOsc.ar(Vibrato.kr(\freq.ir(860), \vibrat.ir(6), \vibdep.ir(0.03)));
	snd = snd * env;

	snd = Pan2.ar(snd, \pan.ir(0), \amp.ir(0.3));

	Out.ar(\out.ir(0), snd);
}).add;
)

Synth(\dudummi);

(
var pan = Array.interpolation(20, -1.0, 1.0);

Pdef(\ihatemyself,
	Pbindef(\left,
		\instrument, \dudummi,
		\degree, Pseq([4, 7, 0], inf),
		\pan, Pseq(pan, inf),
	),


	Pbindef(\right,
		\instrument, \dudummi,
		\degree, Pseq([0, 4, 7], inf),
		\pan, Pseq(pan.reverse, inf),
	)
).play;
)


//??? klappt noch nicht ganz
(
var pan = Array.interpolation(20, -1.0, 1.0), ihm1, ihm2;

ihm1 = Pbindef(\ihm1,
	\instrument, \dudummi,
	\degree, Pseq([0, 4, 7], inf),
	\pan, Pseq(pan, inf),
);

ihm2 = Pbindef(\ihm2,
	\instrument, \dudummi,
	\degree, Pseq([0, 4, 7], inf),
	\pan, Pseq(pan.reverse, inf),
);

Ptpar([0.0, ihm1, 2/3, ihm2], inf).play;

Pbindef(\ihm1).fadeTime = 2;
Pbindef(\ihm2).fadeTime = 2;
)