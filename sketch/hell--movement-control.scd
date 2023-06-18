// === Hellga Moves === \\


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

~startingPosition.();

(
~headDown.(0);
~leanDown.(1);
~gitTilt.(1);
)

(
~headDown.(1);
~gitTilt.(0);
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

~leanDownTilt.();





