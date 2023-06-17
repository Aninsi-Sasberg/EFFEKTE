p = ProxySpace.push(s.boot);

s.plotTree;
s.meter;
s.scope;

(
SynthDef(\keys, {
	arg freq = 440, trigger;
	var snd, env;

	env = Env.perc(0.01, 0.50, 1.0, -15.0).ar(2);

	snd = Saw.ar(freq) * env;

	snd = Splay.ar(snd);

	Out.ar(\out.ir(0), snd * \amp.ir(0.3));

}).add;
)

(
Pdef(\ks, Pbind(
	\instrument, \keys,
	\freq, Prand([200, 201, 204, 203, 210, 199, 208] * 0.25, inf),
	\dur, 0.125,

)).play;
)
