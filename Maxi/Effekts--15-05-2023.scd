s.meter;

(
SynthDef(\bass, {
	var snd;

	snd = Saw.ar(\freq.ir(100));
	snd = Pan2.ar(snd, \pos.ir(0.0), \amp.ir(0.3));

	Out.ar(\out.ir(0), snd);
}).add;
)

(
Pdef(\bass,
	Pmono(\bass,
		\degree, -10,
	)
).play;
)