// Router/Switch brauchen wir

Platform.userExtensionDir

// Server Guide
// Local vs. Remote Servers, Multi-client Configurations

// on machine running the server

(
s.options.protocol = \tcp; // set to use tcp
s.options.bindAddress = "0.0.0.0"; // allow connections from any address
s.options.maxLogins = 3; // set to correct number of clients
p = ProxySpace.push(s.boot());
)

// send vs. add
// first try add, if it doesn't work then use send(server)
// if send doesn't work try with:

SynthDescLib.global.addServer(server);

// t = TempoClock ->


p.reshaping = \elastic;

// pads über proxys z.B. ~pad = {//pad shit};

// Pbinds unter Proxys abspeichern

// gucken ob timing stimmt, wenn nicht auf Anselm zurück kommen

// über patterns an MIDI-outs schicken

// (
// var arri = Array.interpolation(10, 120, 150);
//
// Pbind(\dur, Pfunc({}));
// )

// ohne Pbind Pattern laufen lassen z.B. um TempoClock zu setzen

Tdef() // für t = TempoClock

// git aufsetzen!!

(
SynthDef(\hola, {
	var snd, env;

	env = Env([0, 1, 0], [0.01, 2]).ar(2);

	snd = Saw.ar() * env;

	Out.ar(0, snd * 0.3);
}).add;
)

Synth(\hola);

Synth(\x);
Synth(\y);
Synth(\z);

~ui = {SinOsc.ar() ! 2};
~ui.play;

~sin.free;

~snd.play;
~snd.free;