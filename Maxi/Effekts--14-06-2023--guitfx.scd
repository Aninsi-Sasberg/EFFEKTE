{ SoundIn.ar(8) * [LFTri.ar(0.5).range(0.0, 1.0), LFTri.ar(0.5, 1).range(0.0, 1.0)] }.play;

{ WhiteNoise.ar() * 0.2 }.play;

SoundIn.ar(8)

{ WaveLoss.ar(SoundIn.ar(8), 1, 2, 1) * 2 }.play;

{ InsideOut.ar(SoundIn.ar(8), 2) * 0.25 }.play;

{ Compander.ar(InsideOut.ar(SoundIn.ar(8), 2), 0.0, 0.75, 0.2, 2, 0.001) * 0.25 }.play;

(
SynthDef(\fx, {

	var snd;

	snd = SoundIn.ar(8);

	// snd = InsideOut.ar(snd);
	snd = CrossoverDistortion.ar(snd, 0.75, 0.1, 4);
	// snd = InsideOut.ar(snd);

	// snd = Compander.ar(snd, 0.0, 0.75, 0.2, 1, 0.001);

	// snd = BLowPass4.ar(snd, LFTri.ar(1/32, 3).range(30, 200), 0.1);
	snd = BLowPass4.ar(snd, LFTri.ar(1/32, 3).range(400, 2000), 0.1);
	// snd = BMoog.ar(snd, LFTri.ar(1/16).range(330, 4000), 0.9, 3.0, 5);

	snd = [GVerb.ar(snd, 300, 12, 0.6), GVerb.ar(snd, 300, 12, 0.6)];

	snd = snd.clip(-1.0, 1.0);
	// snd = snd.tanh;

	Out.ar(0, snd * 0.2);

}).play;
)

// am Anfang eher tief Filtern

// Erst ohne Filter
// dann vor Drop/Einsetzn der anderen Elemente Highpass der immer höher geht
// über Durchrführung dann Lowpass Sweep

{ MoogFF.ar(InsideOut.ar(SoundIn.ar(8), 2), SinOsc.ar(100).range(1000.0, 4000.0), 2) * 0.25 }.play;