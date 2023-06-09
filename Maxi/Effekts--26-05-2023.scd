s.reboot;
s.plotTree;
s.scope;

(
Ndef(\schleife, {
	arg phase = 0;
	var snd;

	snd = SinOsc.ar(45.0, phase);

}).play;
)
Ndef(\schleife).fadeTime = 2;


Ndef(\schleife).play;
Ndef(\schleife).free;
Ndef(\schleife).stop;


Ndef(\schleife).xset(\phase, Ndef(\schleife));
Ndef(\schleife).xset(\phase, 0);
