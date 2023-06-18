// === Hellga Movement Functions === \\

(
Tdef(\hellgaHeadBang, {
	// ~headDown.(0);
	loop({
		~headDown.(1);
	    (2/8).wait;
	    ~headDown.(0);
		(2/8).wait;
	})
}).play(t, quant: 4);
)

(
~leanDownTilt = {
	~bodyPressure.(30);
	~bodyForward.value(10);
	~gitRock.(0);
	~gitTilt.(1);
	~headUp.(0);
	~legShort.(0);
	~legLong.(1);
});
//~leanDownTilt.()