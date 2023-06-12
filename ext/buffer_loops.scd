(
o = Server.default.options;
o.numInputBusChannels = 16;
o.numOutputBusChannels = 16;
s.reboot;
s.scope;
s.plotTree;
)

(// allocate a Buffer
s = Server.local;
b = Buffer.alloc(s, 48000 * q, 1); // a four second 1 channel Buffer
)

(
SynthDef(\rec, { arg out = 0, bufnum = 0;
    var rec;
    rec = SoundIn.ar(8);
    RecordBuf.ar(rec, bufnum, doneAction: Done.freeSelf, loop: 0);
}).play(s,[\out, 0, \bufnum, b]);
)
Synth(\rec, [\out, 0, \bufnum, b]);

(
Tdef(\req, {
	1.do {
		Synth(\rec, [\out, 0, \bufnum, b]);
		q.wait;
		"recording done".postln;
		Synth(\rec).free;
}
});
)
Tdef(\loop2).play(t);
Tdef(\req).play(t);
b.plot;
PlayBuf.ar(1, b).play;
Amplitude.ar(PlayBuf.ar(1, bufnum, loop:1), 0.0001, 0.01);
(
Ndef(\inCheck, {
	var snd;
	snd = SoundIn.ar(8) * MouseX.kr(0, 1);
})
)
Ndef(\inCheck).play;
Ndef(\inCheck).stop;

