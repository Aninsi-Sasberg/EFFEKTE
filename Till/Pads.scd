(
o = ServerOptions.new;
o.protocol_(\tcp);
t = Server.remote(\remote, NetAddr("192.168.0.136", 57110), o); // set to correct address and port
t.addr.connect;
t.startAliveThread( 0 );
t.doWhenBooted({ "remote tcp server started".postln; t.notify; t.initTree });
)

// create a synchronized clock
l = LinkClock(1).latency_(t.latency);

(
var win = Window("LinkClock", Rect(200, 200, 500, 100)).front,
peersBox, tempoBox, barsBox, beatsBox,
font = Font.default.copy.size_(32),
boldFont = font.boldVariant,
controller, task;

win.layout = HLayout(
    StaticText().font_(font).string_("Peers:"),
    peersBox = NumberBox().font_(boldFont).align_(\center).fixedWidth_(80),
    StaticText().font_(font).string_("Tempo:"),
    tempoBox = NumberBox().font_(boldFont).align_(\center).fixedWidth_(120),
    StaticText().font_(font).string_("Now:"),
    barsBox = NumberBox().font_(boldFont).align_(\center).fixedWidth_(80),
    beatsBox = NumberBox().font_(boldFont).align_(\center).fixedWidth_(80)
);

[peersBox, barsBox, beatsBox].do { |view| view.enabled_(false) };

tempoBox.action = { |view| l.tempo = view.value / 60 };
tempoBox.value = l.tempo * 60;
peersBox.value = l.numPeers;

task = Routine {
    var bars, beats;
    loop {
        bars = l.bar;
        beats = l.beatInBar;
        {
            barsBox.value = bars;
            beatsBox.value = beats;
        }.defer(l.latency);
        1.0.wait;
    }
}.play(l, quant: 1);

controller = SimpleController(l)
.put(\tempo, {
    defer { tempoBox.value = l.tempo * 60 }
})
.put(\numPeers, {
    defer { peersBox.value = l.numPeers }
})
.put(\stop, { defer { win.close } });

win.onClose = { task.stop; controller.remove };
)

(
SynthDef(\test,{
	arg out = 0;
	var snd, freq = 500;
	snd = LFSaw.ar(freq);
	Out.ar(out, snd!2);
}).add;
)

(
Pdef(\testt,
	PmonoArtic(\test, \dur, 1, \legato, 1.1)
).play;
)

(
SynthDef(\pad, {
    |amp = 0.5, gate = 1, midinote|
    var ampEnv, freq, gen, fmod, rqmod, snd;

    ampEnv = EnvGen.ar(envelope: Env.adsr(3, 3, 0.8, 5, 0.5), gate: gate, doneAction: 2) * 3;
    freq = { midinote.midicps * LFNoise2.kr(1,0.01,1) }!12;
    gen = LFSaw.ar(freq: freq, mul: ampEnv);
    fmod = LFCub.kr(1/12, mul: ampEnv).range(1, MouseX.kr(2,16));
    rqmod = LFNoise2.kr(1/8, mul: ampEnv).range(0.1,1.0);
    snd = RLPF.ar(gen, freq * fmod, rqmod, ampEnv);
    Out.ar(0, Splay.ar(snd * ampEnv * amp));
}).add;
)

(
Pdef(\wupb,
	Pmono(\pad, \dur, 2, \midinote, 30.midicps, \gate = -1)
).play;
)





