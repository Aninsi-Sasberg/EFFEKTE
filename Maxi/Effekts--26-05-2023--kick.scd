s.reboot;
s.scope;
s.plotTree;

// Pulse

(
Ndef(\kick, {
	arg amp = 0.5, atk = 0.01, dec = 0.1, rel = 0.7, freq = 40.0;
	var sin, pul, snd, envatk, envpit, envdec;

	envatk = Env([0, 1, 0], [atk, dec], -4.0).ar();
	// envpit = Env().ar();
	envdec = Env([0, 1, 0.2, 0.0], [atk, dec, rel], -4.0).ar();

	pul = LFPulse.ar(freq) * envatk;
	pul = pul.lag(0.2);
	// pul = MoogFF.ar(pul, freq * 1, 3.5);

	sin = SinOsc.ar(freq) * envdec;
	// sin = 0;

	snd = (sin * 1) + (pul * 4);

	// snd = Lag.ar(snd, [0.001, 0.1]);

	Splay.ar(snd * amp);
}).play
)

Ndef(\kick).fadeTime = 0;
Ndef(\kick).mold(2);

Ndef(\kick).play;
Ndef(\kick).free;


// eigenes

(
Ndef(\kick2, {
	arg amp = 0.5, atk = 0.005, dec = 0.02, rel = 0.4, freq = 30.0;
	var cli, sin, pul, snd, envatt, envatk, envpit, envdec;

	envatt = Env([0, 1.0, 0], [atk, dec], -4.0).ar();
	envatk = Env([0, 1, 0], [atk, dec], -4.0).ar();
	// envpit = Env().ar();
	envdec = Env([0, 1, 0.2, 0.0], [atk, dec, rel], -4.0).ar();

	cli = SinOscFB.ar(40, 30 * pi / 360).lag(0.001);

	pul = WhiteNoise.ar(1);
	pul = MoogFF.ar(pul, freq * 1, 3.8);
	pul = pul.lag(0.01);

	sin = SinOsc.ar(freq);
	// sin = 0;

	snd = (cli * envatt)/* + (sin * 1 * envdec)*/ + (pul * 4 * envdec);

	// snd = Lag.ar(snd, [0.001, 0.1]);

	Splay.ar(snd * amp);
}).play
)

{Env.perc().ar()}.plot(2);
{Env([0, 1, 0], [0.01, 1.0], -4.0).ar()}.plot(2);


// https://www.soundonsound.com/techniques/practical-bass-drum-synthesis

(
SynthDef(\kick3, {
	arg amp = 1, atkpit = 0.005, decpit = 0.4, atkcli = 0.01, deccli = 0.07, freq = 30.0;
	var cli, sin, pul, snd, envcli, envpit;

	envcli = Env([0, 1.0, 0], [atkcli, deccli], -4.0).ar();
	envpit = Env([0, 1.0, 0], [atkpit, decpit], -1.0).ar(2);


	cli = SinOscFB.ar(40, 30 * pi / 360).lag(0.001);
	cli = MoogFF.ar(cli, freq * envcli.linlin(0, 1, 1.0, 2));

	pul = Saw.ar();
	pul = MoogFF.ar(pul, freq * 2 * envpit.linlin(0, 1, 1.0, 2), 4.0);
	// pul = pul.lag(0.01);

	snd = (cli * envcli) + (pul * envcli);

	// snd = Lag.ar(snd, [0.001, 0.1]);

	snd = Splay.ar(snd).cubed();
	snd = Normalizer.ar(snd, amp, 0.05).tanh();

	Out.ar(\out.ir(0), snd);
}).add;
)

Ndef(\kick3).play;

(
fork{
	inf.do{
		Ndef(\kick3).play;
		2/3.wait;
		Ndef(\kick3).free;
	}
}
)

p  = ProxySpace().push;

~kick.play;
~place.play;
~kick.free;
~place.free;
(
~kick = Pbind(
	\instrument, \kick3,
	\dur, 0.5,
	\freq, 30,
	\amp, 0.7,
);

~place = Pbind(
	\instrument, \ding,
	\dur, 2/3,
	\degree, Plazy({
		var rnd = rrand(0, 12), maj = rrand(0, 1);
		switch(maj, 0, Pseq([rnd, rnd + 3, rnd + 7], inf), 1, Pseq([rnd, rnd + 4, rnd + 7], inf));
	}),
	\amp, 0.1,
)
)
