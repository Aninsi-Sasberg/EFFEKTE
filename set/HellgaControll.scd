// panic control
~startingPosition.();
~bodyPressure.(70);

// startup
v = s.volume;
Tdef.defaultQuant = 4;
~startingPosition.();

// start
~speak.();
~startingPosition.();
Tdef(\hellgaBreathing).play(argClock: l, quant: 1);

// solo
(
v.mute;
~startingPosition.();
Tdef(\hellgaBreathing).stop;
~look.(1);
Tdef(\hellgaSolo).play(argClock: l, quant: 1);
Tdef(\hellgaSoloMovement).play(argClock: l, quant: 1);
)

// end
(
Tdef(\hellgaHipHopCircle).stop;
Tdef(\hellgaSolo).stop;
v.mute;
~bodyTurn.(64);
~bodyPressure.(70);
~look.(0);
~speak.();
)

~startingPosition.()






//------------------
//------------------
//------------------

// solo emergency stop
(
Tdef(\hellgaSolo).stop;
Tdef(\hellgaSoloMovement).stop;
~releaseAll.(3,2);
~dampAllPermanent.();
~startingPosition.();
)








