~bodyPressure.(0);
~midiAt.value(2, 1, 1);
~playNote.(2, 1, 1, 2);

~grip.value(1, 2, 1);
~release.(1,2,1);
~pluck.value(1);
~pluckAll.value();
~moveHand1.value(1);
~moveHand2.value(2);
~damp.value(1, 2);
~setFingers2.value();
~setFingers1.value();
~liftFingers1.value();
~liftFingers2.value();
~grip.value(2, 1);
~gitRock.value();
~gitTilt.value();
~legShort.value(1);
~legLong.value();
~moveHip.value("c");
~hipLock.value();
~hipRelease.value();
~headDown.value();
~headUp.value();
~headLeft.value();
~headRight.value();
~releaseAllNotes.value(1);
~gripAllNotes.value(1);
~bodyForward.value(40);
~bodySide.value(90);
~bodyTurn.value(30);
~bodyFullTurn.value(64);


~setVol.value(1);



(//init+Metronom. nur einmal ausführen
~postinfo = { t.beats.postln; 1;};
t = TempoClock.new(160/60).permanent_(true);
t.sched(0, {~postinfo.()});
q = 4; // z/q Takt d.h. 4/4
z = 4;
Tdef.defaultQuant = q;
)

(
~pluckAllTest = Routine {
	10.do {
		~pluckAll.();
		0.1.wait;
	}
}.play;
)

t.tempo = (180/60);

s.plotTree;

~setFingers1.();
~setFingers2.();
~liftFingers1.();
~liftFingers2.();
(//dangerous
p = Routine {
	var wait = 0.1;
	~damp.value(1, 2);
	inf.do {
		~gripAllNotes.value(3, wait);
		(wait/3).wait;
		~releaseAllNotes.value(3);
		(wait/4).wait;
	};
}.play(t, quant: 1);
)

(
p = Routine {
	loop {
		~damp.value(1, 1);
		inf.do { |n|
			n = (n % 6 + 1);
			("n: " ++ n).postln;
			~grip.(1, rrand(1, n.asInteger), rrand(1, n.asInteger));
			0.1.wait;
			~pluck.(n);
			0.2.wait;
	}};
}.play(t, quant: 1);
)
(Tdef(\sting, {10.do{~pluckAll.();0.3.wait}}));
Tdef(\sting).play(t);
(
~damp.value(0, 0);
~damp.value(1, 0);
~setFingers.(0, 1);
~setFingers.(1, 1);
)

p=Routine {1000.do { |n| t.tempo = (100 + (200*n/1000)) / 60; 0.08.wait;}}.play;
t.tempo = 180/60;
(t.tempo=t.tempo+(10/60);
t.tempo;)
(
//t.tempo = t.tempo + (15/60);
Tdef(\loop2, {
	inf.do { |n, h|
		var hand = 1, s = 0;
		~grip.(hand, s,2);
		(z / 16).wait;
		~release.(hand, s, 2);
		(z / 32).wait;
		~grip.(hand, s, 3);
		(z / 16).wait;
		~release.(hand, s, 3);
		(z / 32).wait;
		~grip.(hand, 4, 0);
		(z / 16).wait;
		~release.(hand, 4, 0);
		(z / 32).wait;
		~grip.(hand, s + h, 5);
		(z / 16).wait;
		~release.(hand, s + h, 5);
		(z / 32).wait;
		~grip.(hand+1, s, 1+n);
		(z / 16).wait;
		~release.(hand+1, s, 1+n);
		(z / 32).wait;
		~grip.(hand+1, s, n);
		(z / 16).wait;
		~release.(hand+1, s, n);
		(z / 32).wait;
		~grip.(hand, 1, 2-n);
		(z / 16).wait;
		~release.(hand, 1, 2-n);
		(z / 32).wait;
		~grip.(hand+1, 2, 5);
		(z / 16).wait;
		~release.(hand+1, 2, 5);
		(z / 32).wait;
	}
});
)

(
Tdef(\loop1, {
	inf.do {
		~pluck.(5);
		(z * 0.75).wait;
	 }
})
)
Tdef(\loop1).play(t);
Tdef(\loop2).play(t);
Tdef(\loop1).stop;
Tdef(\loop2).stop;
(
Tdef(\move, {
	inf.do {
	~headDown.(1);
	1.wait;
	~headUp.(1);
	1.wait;
	~headDown.(0);
	2.wait;
	~headUp.(0);
	2.wait;
	}})
)
Tdef(\move).play(t);
Tdef(\move).stop;


Tdef(\loop3).play;
Tdef(\loop3).stop;
(
Tdef(\loop3, {
	inf.do { |n, r|
		~grip.(1, 4, n);
		0.2.wait;
		~pluck.(4);
		~release.(1, 4, n);
		0.2.wait;
	}
});
)

3.0 % 5;
(
Tdef(\loop, {
	var x;
	x = Plazy({ Prand(Array.series(6, 1, 1)) }).loop.asStream;
	inf.do { |n, r|
		n = x.next;
		n.postln;
		1.wait;
	}
});
)
Tdef(\loop).play(t);
8.rand;
Tdef(\loop).clear;
Tdef(\loop).stop;

(
Tdef(\x, {
    var x;
    x = Plazy({ Pxrand(Pseries(300 + 300.rand, 10 + 30.rand, 10 + 30.rand), 1) }).loop.asStream;
    loop({
        s.sendMsg("/s_new", "pdef_grainlet", -1,0,0, \freq, x.next);
        0.05.wait;
    })
})
)
(
a = Plazy({
    var x, y;
    x = Array.series(rrand(2, 4), [1, 100].choose, 1);
    Pshuf(x,1);
});
x = Pn(a, inf).asStream;
30.do({ x.next.postln });
)

(
p = Routine {
	~damp.value(1, 1);
	inf.do { |n|
		n = n % 5;
		~grip.(1, 2, n + 1);
		0.1.wait;
		~pluck.(2);
		(2/4).wait;
		~release.(1, 2, n + 1);
		0.3.wait;
	};
}.play(t, quant: 1);
)

(
p = Routine {
	~damp.value(1, 1);
	inf.do { |n|
		n = n % 5;
		~grip.(1, 2, n + 1);
		0.1.wait;
		~pluck.( 2);
		(2/4).wait;
		~release.(1, 2, n + 1);
		0.3.wait;
	};
}.play(t, quant: 1);
)



(
~setFingers2.();
p = Routine {
	~damp.value(1, 1);
	inf.do { |n, m|
		n = n % 7;
		m = m % 6;
		~grip.(2, m + 1, n + 1);
		0.05.wait;
		~pluck.(m+1);
		0.05.wait;
		~release.(2, m + 1, n + 1);
		0.15.wait;
	};
}.play(t, quant: 1);
)
(
~setFingers2.();
p = Routine { loop {
	~damp.value(1, 2);
	[1, 2, 3, 4, 5, 6].do { |n|
		[1, 2, 3, 4, 5, 6, 7].do { |m|
			~grip.(2, n, m);
			0.5.wait;
		};
	};
	[1, 2, 3, 4, 5, 6].do { |n|
		[1, 2, 3, 4, 5, 6, 7].do { |m|
			~release.(2, n, m);
			0.01.wait;
		};
	};
};
}.play(t, quant: 1);
)
t.sched(5, {t.tempo = 100/60});

(//nur einmal ausführen
~postinfo = { t.beats.postln; 1;};
t = TempoClock.new(100/60).permanent_(true);
t.sched(0, {~postinfo.()});
q = 5;
z = 4;
)


TempoClock.default.tempo = 1;
t = TempoClock.new(84/60, 4).permanent_(true);
(
Tdef (\seq1, {
	loop{
		9.postln;
		1.wait;
		5.postln;
		1.wait;
 }
}).play(quant:2)
)



z = TempoClock.default;
z.permanent_(true);
z.tempo = 120/60;
z.beats = 4;

(
SynthDef(\help_sinegrain,
    { arg out=0, freq=440, sustain=0.05;
        var env;
        env = EnvGen.kr(Env.perc(0.01, sustain, 0.2), doneAction: Done.freeSelf);
        Out.ar(out, SinOsc.ar(freq, 0, env))
    }).add;
)

(
a = Pseq(#[60, 61, 63, 65, 72], inf).asStream;
Routine({
    loop({
        Pdef(\help_sinegrain, [\freq, a.next.midicps]);
        0.2.wait;
    })
}).play;
)





(
SynthDef(\cfstring1, { arg i_out, freq = 360, gate = 1, pan, amp=0.1;
    var out, eg, fc, osc, a, b, w;
    fc = LinExp.kr(LFNoise1.kr(Rand(0.25, 0.4)), -1, 1, 500, 2000);
    osc = Mix.fill(8, {LFSaw.ar(freq * [Rand(0.99, 1.01), Rand(0.99, 1.01)], 0, amp) }).distort * 0.2;
    eg = EnvGen.kr(Env.asr(1, 1, 1), gate, doneAction: Done.freeSelf);
    out = eg * RLPF.ar(osc, fc, 0.1);
    #a, b = out;
    Out.ar(i_out, Mix.ar(PanAz.ar(4, [a, b], [pan, pan+0.3])));
}).add;

SynthDef("sinegrain2",
    { arg out=0, freq=440, sustain=0.05, pan;
        var env;
        env = EnvGen.kr(Env.perc(0.01, sustain, 0.3), doneAction: Done.freeSelf);
        Out.ar(out, Pan2.ar(SinOsc.ar(freq, 0, env), pan))
    }).add;

p = Pbind(
    [\degree, \dur], Pseq([[0, 0.1], [2, 0.1], [3, 0.1], [4, 0.1], [5, 0.8]], 1),
    \amp, 0.05, \octave, 6, \instrument, \cfstring1, \mtranspose, 0);

q = Pbindf(p, \instrument, \default );

r = Pset(\freq, Pseq([500, 600, 700], 2), q);

)







.coin
.choose
.yield

Pdef(\x, Pbind(\note, Pbrown(0, 6, 0.1, inf)));
Pdef(\x).quant = 0; // no waiting.
Pbindf(Pdef(\x), \dur, 0.03).play;
Pbindf(Pdef(\x), \dur, 0.1, \ctranspose, 15).play;
Pbindf(Pdef(\x), \dur, 0.3, \ctranspose, 2).play;
// now change the definition
Pdef(\x, Pbind(\note, Pseq([0, 3, 5, 7, 9, 11], inf)));
Pdef(\x, Pbind(\freq, Pseq([1000, 1923, 245.2, 1718] / 1.2 + 0.1, inf)));

2.midiratio;
t.beats;


t = TempoClock.new(84/60, 4).permanent_(true);
t.tempo;
t.beatDur;

f = 1/t.Dur;
n = Ndef(\bla, {SinOsc.ar(440)});
n.clock = t;
n.clock_(t);
n.quant=4;
n.clock;
Pbind(
	pairs:

)
Pdef(\x, p);

5.rand
SynthDef

Pbind


(
t = TempoClock.new;

t.sched(3, {
    t.beats = 100;
    t.beats.postln; // still 3
    nil
});
)
EnvFollow
EnvDetect



(
SynthDef("help-EnvDetect",{Out.ar(0,Pan2.ar(
LFSaw.ar(EnvDetect.ar(LFNoise1.ar(11,100,200), MouseX.kr(2,0.0001,'exponential'), MouseY.kr(2,0.0001,'exponential')),
		0,
		0.3*EnvDetect.ar(LFSaw.ar(7), MouseX.kr(0.001,1,'exponential'), MouseY.kr(0.001,1,'exponential'))
	), 0.0))
}).play
)





(
c = TempoClock.new;
fork {
    loop {
        c.beats.postln; // updates, because ".wait" calls the thread
        1.wait;
    }
};
)

t = TempoClock.new;

t.beatsPerBar = 3;  // error! wrong thread

t.schedAbs(t.nextBar, { t.beatsPerBar_(3) });  // OK

t.beatsPerBar;  // will be reflected after the barline

t.schedAbs(t.nextBar, { thisThread.clock.beatsPerBar_(4) });  // OK

(
r = Routine {
    // by addressing "this" clock,
    // we are always changing meter in the right place
    var clock = thisThread.clock;

    clock.beats.debug("start time");
    clock.timeToNextBeat(-1).wait;
    clock.beats.debug("barline");

    // no need to 'sched'
    // because the Routine is already on this clock
    // flip 3/4 -> 4/4 or 4/4 -> 3/4
    clock.beatsPerBar = 7 - clock.beatsPerBar;
    clock.beatsPerBar.debug("set meter to");

    0.01.wait;  // must be after barline for 'timeToNextBeat'
    clock.timeToNextBeat(-1).wait;
    clock.beats.debug("next barline");
}.play;
)

