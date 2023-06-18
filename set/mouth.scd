(
~pb_out = 3;
~pb_amp = 2;
~pb_rate = 1/5;
~pb_dur = 2;

~b_hi = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/hi.wav");
~b_i_want_to_live = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/i_want_to_live.wav");
~b_i_am_hellga = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/i_am_hellga.wav");
~b_harder_better_faster_stronger = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/harder_better_faster_stronger.wav");
~b_stress = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/stress.wav");
~b_blink_brueder = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/blink_brueder.wav");
~b_nice = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/nice.wav");
~b_daft_punks_disbanding_gives_me_money = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/daft_punks_disbanding_gives_me_money.wav");
~b_hello = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/hello.wav");
~b_yeah = Buffer.read(s, "/Users/aninsi/Desktop/PROGRAMMING/AA--Github/EFFEKTE/Maxi/tts/yeah.wav");

SynthDef(\s_hi, {
	var snd;

	snd = PlayBuf.ar(1, ~b_hi, ~pb_rate, doneAction: 2);

	Out.ar(~pb_out, snd * ~pb_amp)
}).add;

SynthDef(\s_i_want_to_live, {
	var snd;

	snd = PlayBuf.ar(1, ~b_i_want_to_live, ~pb_rate, doneAction: 2);

	Out.ar(~pb_out, snd * ~pb_amp)
}).add;

SynthDef(\s_i_am_hellga, {
	var snd;

	snd = PlayBuf.ar(1, ~b_i_am_hellga, ~pb_rate, doneAction: 2);

	Out.ar(~pb_out, snd * ~pb_amp)
}).add;

SynthDef(\s_harder_better_faster_stronger, {
	var snd;

	snd = PlayBuf.ar(1, ~b_harder_better_faster_stronger, ~pb_rate, doneAction: 2);

	Out.ar(~pb_out, snd * ~pb_amp)
}).add;

SynthDef(\s_stress, {
	var snd;

	snd = PlayBuf.ar(1, ~b_stress, ~pb_rate, doneAction: 2);

	Out.ar(~pb_out, snd * ~pb_amp)
}).add;

SynthDef(\s_blink_brueder, {
	var snd;

	snd = PlayBuf.ar(1, ~b_blink_brueder, ~pb_rate, doneAction: 2);

	Out.ar(~pb_out, snd * ~pb_amp)
}).add;

SynthDef(\s_nice, {
	var snd;

	snd = PlayBuf.ar(1, ~b_nice, ~pb_rate, doneAction: 2);

	Out.ar(~pb_out, snd * ~pb_amp)
}).add;

SynthDef(\s_daft_punks_disbanding_gives_me_money, {
	var snd;

	snd = PlayBuf.ar(1, ~b_daft_punks_disbanding_gives_me_money, ~pb_rate, doneAction: 2);

	Out.ar(~pb_out, snd * ~pb_amp)
}).add;

SynthDef(\s_hello, {
	var snd;

	snd = PlayBuf.ar(1, ~b_hello, ~pb_rate, doneAction: 2);

	Out.ar(~pb_out, snd * ~pb_amp)
}).add;

SynthDef(\s_yeah, {
	var snd;

	snd = PlayBuf.ar(1, ~b_yeah, ~pb_rate, doneAction: 2);

	Out.ar(~pb_out, snd * ~pb_amp)
}).add;

)



//hi.wav
(
Pdef(\p_hi, Pbind(
	\instrument, \s_hi,
	\dur, ~pb_dur,
)).play;
)

Pdef(\p_hi).stop;


//i_want_to_live.wav
(
Pdef(\p_i_want_to_live, Pbind(
	\instrument, \s_i_want_to_live,
	\dur, ~pb_dur,
)).play;
)

Pdef(\p_i_want_to_live).stop;


//i_am_hellga.wav
(
Pdef(\p_i_am_hellga, Pbind(
	\instrument, \s_i_am_hellga,
	\dur, ~pb_dur,
)).play;
)

Pdef(\p_i_am_hellga).stop;


//harder_better_faster_stronger.wav
(
Pdef(\p_harder_better_faster_stronger, Pbind(
	\instrument, \s_harder_better_faster_stronger,
	\dur, ~pb_dur,
)).play;
)

Pdef(\p_harder_better_faster_stronger).stop;


//stress.wav
(
Pdef(\p_stress, Pbind(
	\instrument, \s_stress,
	\dur, ~pb_dur,
	\dur, Pseq([Rest(1), 1], inf),
)).play;
)

Pdef(\p_stress).stop;


//blink_brueder.wav
(
Pdef(\p_blink_brueder, Pbind(
	\instrument, \s_blink_brueder,
	\dur, ~pb_dur,
)).play;
)

Pdef(\p_blink_brueder).stop;


//nice.wav
(
Pdef(\p_nice, Pbind(
	\instrument, \s_nice,
	\dur, ~pb_dur,
)).play;
)

Pdef(\p_nice).stop;


//daft_punks_disbanding_gives_me_money.wav
(
Pdef(\p_daft_punks_disbanding_gives_me_money, Pbind(
	\instrument, \s_daft_punks_disbanding_gives_me_money,
	\dur, ~pb_dur,
)).play;
)

Pdef(\p_daft_punks_disbanding_gives_me_money).stop;


//hello.wav
(
Pdef(\p_hello, Pbind(
	\instrument, \s_hello,
	\dur, ~pb_dur,
)).play;
)

Pdef(\p_hello).stop;


//yeah.wav
(
Pdef(\p_yeah, Pbind(
	\instrument, \s_yeah,
	\dur, ~pb_dur,
)).play;
)

Pdef(\p_yeah).stop;


