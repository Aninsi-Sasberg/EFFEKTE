(//init+Metronom. nur einmal ausführen
~postinfo = { t.beats.postln; 1;};
t = TempoClock.new(60/60).permanent_(true);
t.sched(0, {~postinfo.()});
q = 7; // z/q Takt d.h. 4/4
z = 7;
Tdef.defaultQuant = q;
)

t.tempo = (60/60);



(
~channel = 5;
~channelVolume = 14;
MIDIClient.init;
m = MIDIOut.new(1);
//n = MIDIIn.newByName("Launch Control XL", "Launch Control XL");
//m = MIDIOut.newByName("MidiGateway", "MidiGateway");
//~midiIn = MIDIIn.new(1);
(
CmdPeriod.add({
	"MIDI Note-Off".postln;
	fork {
		128.do {|n|
			m.noteOff(~channel, n, 0);
			0.001.wait;
		};
		5.do {|n|
			m.noteOff(~channel, 96 + n, 64);
			0.001.wait;
		};
		~moveHip.value(0);
		~bodyPressure.value(70);
		~bodyForward.value(64);
		~bodySide.value(64);
		~bodyTurn.value(64);
		~bodyFullTurn.value(64);
	}
});
);
)



(
(
~midiValHand1 = [
	[24, 25, 26, 27, 28],
	[29, 30, 31, 32, 33],
	[34, 35, 36, 37, 38],
	[39, 40, 41, 42, 43],
	[44, 45, 46, 47, 48],
	[49, 50, 51, 52, 53]
];
~midiValHand2 = [
	[54, 55, 56, 57, 58, 59, 60],
	[60, 62, 63, 64, 65, 66, 67],
	[68, 69, 70, 71, 72, 73, 74],
	[75, 76, 77, 78, 79, 80, 81],
	[82, 83, 84, 85, 86, 87, 88],
	[89, 90, 91, 92, 93, 94, 95]
];);

(
~setVol = { arg vol;
	m.control(~channelVolume, ctlNum: 7, val:vol);
});
//~setVol.value(3);

(
~midiAt = { arg hand, string, fret;
	if(hand == 0,
		{~midiValHand1[string][fret]},
		{~midiValHand2[string][fret]}
	)
});
//~midiAt.value(2, 1, 1);

(
~play = { arg hand, string, fret, len, vel, note;
	fork{
		note = ~midiAt.value(hand, string, fret);
		vel = 120;
		m.noteOn(~channel, note, 1);
		0.01.wait;
		m.noteOff(~channel, 6 + string, 0);
		0.02.wait;
		m.noteOn(~channel, string , vel);
		len.wait;
		m.noteOn(~channel, 6 + string, 1);
		m.noteOff(~channel, note, 0);
		m.noteOff(~channel, string, 0);
	}
});
//~play.(1, 2, 4, 2);

(
~grip = { arg hand, string, fret;
	var midiNote, amountFrets;
	if (hand % 2 == 0, {amountFrets=5},{amountFrets=7});
	fork{
		midiNote = ~midiAt.value(hand % 2, string % 6, fret % amountFrets);
		m.noteOn(~channel, midiNote, 1);
		0.01.wait;
		// turned of dampening for improved tapping
		//m.noteOff(~channel, 6 + (string % 6), 0);
	}
});
//~grip.(0, 0, 0);

(
~release = { arg hand, string, fret;
	var midiNote, amountFrets;
	if (hand % 2 == 0, {amountFrets=5},{amountFrets=7});
	fork{
		midiNote = ~midiAt.value(hand % 2, string % 6, fret % amountFrets);
		//m.noteOn(~channel, 6 + (string % 6), 1);
		0.03.wait;
		m.noteOff(~channel, midiNote, 0);
	}
});
//~release.(0,0,0);

(
~releaseAll = { arg hand, speed = 2;
	var amountFrets, offset = 24;
	if ( hand % 3 == 0, //Release All Notes on first Hand
		{amountFrets = 30}
	);
	if ( hand % 3 == 1, //Release All Notes on second Hand
		{amountFrets = 42; offset = 54;}
	);
	if ( hand % 3 == 2, //Release All Notes on both hands
		{amountFrets = 72}
	);
	fork {
		amountFrets.do {|n|
			m.noteOff(~channel, offset + n, 0);
			(1/speed).wait;
		}
	};
});
//~releaseAll.(0,100);

(
~gripAll = { arg hand, speed = 2;
	var amountFrets, offset = 24;
	if ( hand % 3 == 0, //Grip All Notes on first Hand
		{amountFrets = 30}
	);
	if ( hand % 3 == 1, //Grip All Notes on second Hand
		{amountFrets = 42; offset = 54;}
	);
	if ( hand % 3 == 2, //Grip All Notes on both hands
		{amountFrets = 72}
	);
	fork {
		amountFrets.do {|n|
			m.noteOn(~channel, offset + n, 127);
			(1/speed).wait;
		}
	};
});
//~gripAll.(1, 10);

(
~pluck = { arg string, vel = 120;
	fork{
		m.noteOn(~channel, string % 6, vel % 128);
		0.01.wait;
		m.noteOff(~channel, string % 6, 0);
	}
});
//~pluck.value(1);

(
~pluckAll = {arg speed;
	fork{
		6.do {|n|
			m.noteOn(~channel, n, 100);
			(speed/1).wait;
		};
	}
});
//~pluckAll.();

(
~moveHand = { arg hand, position;
	~setFingers.(hand % 2, 0);
	if(hand % 2 == 0, {
		if ( position % 3 == 0, //Handposition 1, Bund 2 bis 6
			{m.noteOn(~channel, 14, 1)}
		);
		if ( position % 3 == 1, //Handposition 2, Bund 4 bis 8
			{m.noteOn(~channel, 14, 63)}
		);
		if ( position % 3 == 2, // Handposition 3, Bund 5 bis 9
			{m.noteOn(~channel, 14, 127)}
		);
	});

	if(hand % 2 == 1, {
		if ( position % 2 == 1, //Handposition 2, Bund 16 bis 22
			{m.noteOn(~channel, 15, 1)}
		);
		if ( position % 2 == 0, // Handposition 1, Bund 10 bis 16   ACHTUNG! Finger 5 und 6 beide in Fret 14.
			{m.noteOn(~channel, 15, 127)}
		);
	});
});
//~moveHand1.(1);

(
~damp = { arg hand, onOff;
	if ( onOff % 2 == 1,
		{m.noteOn(~channel, 12 + (hand % 2), 127)},
		{m.noteOff(~channel, 12 + (hand % 2), 0)}
	);
});
//~damp.value(1, 1);

//finger in der nähe der Saite
(
~setFingers = { arg hand, onOff;
	if(hand % 2 == 0, {
		if ( onOff % 2 == 1,{
			m.noteOn(~channel, 16, 127);
			m.noteOn(~channel, 17, 127);
			m.noteOn(~channel, 18, 127);
			m.noteOn(~channel, 19, 127);
			m.noteOn(~channel, 20, 127);
		});
		if ( onOff % 2 == 0,{
			m.noteOff(~channel, 16, 0);
			m.noteOff(~channel, 17, 0);
			m.noteOff(~channel, 18, 0);
			m.noteOff(~channel, 19, 0);
			m.noteOff(~channel, 20, 0);
		});
	});

	if(hand % 2 == 1, {
		if ( onOff % 2 == 1,{
			m.noteOn(~channel, 21, 127);
		});
		if ( onOff % 2 == 0,{
			m.noteOff(~channel, 21, 0);
		});
	});
});
//~setFingers.(0, 1);

(
~moveFinger = { arg finger, position;
	~midiWerte = [96, 97, 98, 99, 100];
	if ( position % 3== 0, //Finger lifted
		{m.noteOn(~channel, ~midiWerte[finger % 6], 0)}
	);
	if ( position % 3== 1, //Halfgrip
		{m.noteOn(~channel, ~midiWerte[finger % 6], 1)}
	);
	if ( position % 3== 2, //Fullgrip
		{m.noteOn(~channel, ~midiWerte[finger % 6], 64)}
	);
});
//~grip.value(5, 1);

(
~gitRock = {arg onOff;
	var vel;
	if ( onOff % 2 == 1, {vel=127},{vel=0});
	m.noteOn(~channel, 101, vel);
});
//~gitRock.value();

(
~gitTilt = {arg onOff;
	var vel;
	if ( onOff % 2 == 1, {vel=127},{vel=0});
	m.noteOn(~channel, 102, vel);
});
//~gitTilt.value();

(
~gitShake = {arg direction;
	var midiNote;
	if(direction == 0, {
		midiNote = 101;
		m.noteOn(~channel, midiNote, 0);
		m.noteOn(~channel, midiNote + 1, 0);
	});
	if(direction == 1, {midiNote = 101; m.noteOn(~channel, midiNote, 1);});
	if(direction == 2, {midiNote = 102; m.noteOn(~channel, midiNote, 1);});
});

(
~legShort = { arg onOff;
	m.noteOn(~channel, 104, onOff % 2);
	m.noteOn(~channel, 106, onOff % 2);
});
//~legShort.value(0);

(
~legLong = { arg onOff;
	m.noteOn(~channel, 103, onOff % 2);
	m.noteOn(~channel, 105, onOff % 2);
});
//~legLong.value(5);

(
~moveHip = {arg direction;
	if ( direction % 3 == 1, //turn right
		{m.noteOn(~channel, 107, 127)}
	);
	if ( direction % 3 == 2, //turn right
		{m.noteOn(~channel, 108, 127)}
	);
	if ( direction % 3 == 0, //Return to center and lock
		{m.noteOn(~channel, 108, 0)}
	);
});
//~moveHip.value("c");
//m.noteOn(~channel, 107, 127)

(
~hipLock = { arg onOff;
	var vel;
	if (onOff == 1, {vel = 0},{vel = 127});
	m.noteOn(~channel, 109, vel);
});
//~hipLock.();

(
~headDown = { arg onOff;
	var vel;
	if (onOff == 1, {vel = 127},{vel = 0});
	m.noteOn(~channel, 112, vel);
});
//~headDown.();

(
~headUp = { arg onOff;
	var vel;
	if (onOff == 1, {vel = 127},{vel = 0});
	m.noteOn(~channel, 113, vel);
});
//~headUp.value();


(
~headLeft = { arg onOff;
	var vel;
	if (onOff == 1, {vel = 127},{vel = 0});
	m.noteOn(~channel, 114, vel);
});
//~headLeft.value(0);

(
~headRight = { arg onOff;
	var vel;
	if ( onOff == 1, {vel = 127},{vel = 0});
	m.noteOn(~channel, 115, vel);
});
//~headRight.value(0);


(
~bodyPressure = { arg val;
	m.control(~channel, ctlNum: 31, val:val);
});
//~bodyPressure.value(64)

(
~bodyForward = { arg val;
	m.control(~channel, ctlNum: 33, val:val);
});
//~bodyForward.value(64)

(
~bodySide = { arg val;
	m.control(~channel, ctlNum: 34, val:val);
});
//~bodySide.value(64)

(
~bodyTurn = { arg val;
	m.control(~channel, ctlNum: 35, val:val);
});
//~bodyTurn.value(64)

(
~bodyFullTurn = { arg val;
	m.control(~channel, ctlNum: 40, val:val);
});
//~bodyFullTurn.value(64)

(
~leanDown = {
	~bodyPressure.(30);
	~bodyForward.value(10);
	~gitRock.(0);
	~gitTilt.(0);
	~headUp.(1);
	~legShort.(0);
	~legLong.(1);
});

(
~upright = {
	~bodyPressure.(20);
	~bodyForward.value(70);
	~bodySide.value(70);
	~headDown.(1);
	~legShort.(1);
	~gitRock.(1);
});

(
~startingPosition = {
	~bodyPressure.(70);
	~bodyForward.(70);
	~bodySide.(64);
	~bodyTurn.(64);
	~bodyFullTurn.(64);
	~gitRock.(0);
	~gitTilt.(0);
	~headUp.(0);
	~headDown.(0);
	~legLong.(0);
	~legShort.(0);
});

(
~leanRight = {
	~bodyPressure.(30);
	~bodyForward.(10);
	~bodySide.(70);
	~headDown.(1);
	~headUp.(1);
	~legShort.(1);
	~moveHip.(3);
});

(
~leanLeft = {
	~bodyPressure.(30);
	~bodyForward.(10);
	~bodySide.(70);
	~headDown.(1);
	~headUp.(1);
	~legShort.(1);
	~moveHip.(2);
});
)

(
// Panic Button, Sendet Note-Off Nachrichten an alle Noten
p = Routine {
	128.do {|n|
		m.noteOff(~channel, n, 64);
		0.001.wait;
	};
}.play;
)
