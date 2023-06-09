p = ProxySpace.push(s.boot);

s.plotTree;
s.meter;
s.scope;

(
SynthDef(\keys, {
	arg freq = 440, trigger;
	var snd, sin, saw, fm, env1, env2, lfo1;

	env1 = Env([0, 1, 0.3, 0], [0.65, 1.4, 2.3], -4.0).ar(2, trigger);
	env2 = Env([0.0, 1.0, 0.0], [0.01, 5], -2).ar();

	sin = SinOsc.ar(freq);
	saw = Saw.ar(freq);
	saw = MoogFF.ar(saw, freq * env1.range(1, \freqFact.ir(3.4)), 3.5);

	fm = SinOsc.ar(sin.range(0, 1000) * env1.range(0.0, 1.0));

	snd = [fm + sin + saw] / 3 * env2;

	snd = Splay.ar(snd);

	Out.ar(\out.ir(0), snd * \amp.ir(0.3));

}).add;
)

