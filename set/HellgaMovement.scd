// === Hellga Movement Functions === \\

(
(
Tdef(\hellgaHeadBang, {
	loop({
		~headDown.(1);
		(4/4).wait;
	    ~headDown.(0);
		(4/4).wait;
	});
});
);

(
Tdef(\hellgaHeadKnod, {
	loop({
		~look.(1);
	    (1/8).wait;
		~look.(3);
		(1/8).wait;
	});
});
);

(Tdef(\hellgaBreathing, {
	var choice;
	var waitT = 0.5;
	~bodyPressure.(45);
	loop({
		choice = [1,2,3].wchoose([0.6,0.2,0.2]);
		if(choice == 1,{
			~bodyTurn.(20);
			waitT.wait;
			~bodyTurn.(64);
			waitT.wait;
		});
		if(choice == 2,{
			~bodyForward.(20);
			waitT.wait;
			~bodyForward.(64);
			waitT.wait;
		});
		if(choice == 3,{
			~bodySide.(20);
			waitT.wait;
			~bodySide.(64);
			waitT.wait;
		});
	});
});
);

(
Tdef(\hellgaSoloMovement, {
	fork{
		3.wait;
		~look.(0);
		1.wait;
		~bodyTurn.(0);
		1.wait;
		~bodyTurn.(64);
		1.wait;
		~leanLeft.();
		1.wait;
		~upright.();
		~look.(1);
		2.wait;
		~look.(3);
		~leanRight.();
		~moveHip.(2);
		~gitRock.(0);
		1.wait;
		~gitRock.(0);
		1.wait;
		~moveHip.(0);
		~hipLock.(0);
		2.wait.(0);
		~bodyPressure.(64);
		~speak.();
		1.wait;
		~bodyTurn.(0);
		1.wait;
		~bodyTurn.(64);
		1.wait;
		~bodySide.(0);
		~hipLock.(1);
		~moveHip.(1);
		1.wait;
		~moveHip.(0);
		~hipLock.(0);
		~bodySide.(64);
		1.wait;
		~look.(3);
		1.wait;
		~gitTilt.(1);
		1.wait;
		~look.(0);
		~gitTilt.(0);
		1.wait;
		~bodyTurn.(0);
		1.wait;
		~bodyTurn.(64);
		0.5.wait;
		~bodyTurn.(0);
		0.5.wait;
		~bodyTurn.(64);
		0.5.wait;
		~bodyForward.(0);
		0.5.wait;
		~bodyForward.(64);
		1.wait;
		~hipLock.(1);
		~moveHip.(2);
		~bodyForward.(0);
		1.wait;
		~bodyForward.(64);
		1.wait;
		~bodyTurn.(0);
		~moveHip.(0);
		~hipLock.(0);
		2.wait;
		~look.(1);
		1.wait;
		~bodyTurn.(64);
		~startingPosition.();
		3.wait;
		2.do{
			~bodyForward.(0);
			0.5.wait;
			~bodyForward.(64);
			0.5.wait;
		};
		0.5.wait;
		~look.(1);
		0.5.wait;
		8.do{
			~look.(3);
			0.25.wait;
			~look.(1);
			0.25.wait;
		};
		8.do{
			~gitTilt.(1);
			~look.(3);
			0.25.wait;
			~gitTilt.(0);
			~look.(1);
			0.25.wait;
		};
		~speak.();
		2.wait;
		~bodyTurn.(0);
		1.wait;
		~look.(1);
		~bodyPressure.(64);
		Tdef(\hellgaHipHopCircle).play(argClock: l, quant: 1);
	}
});
);

(
~hipHopCHelper = {
		Tdef(\hellgaHipHopCircle).play(argClock: l, quant: 1);
});

(
Tdef(\hellgaHipHopCircle,{
	var waitT = 0.5;
	loop({
		~look.(0);
		waitT.wait;
		~look.(1);
		waitT.wait;
		~look.(2);
		waitT.wait;
		~look.(3);
		waitT.wait;
	});
});
);

(
(
~look = {
	arg pos;
	fork{
		~headUp.(0);
		~headDown.(0);
		0.02.wait;
		if(pos ==  1, {
			~headDown.(1);
		});
		if(pos ==  2, {
			~headDown.(1);
			~headUp.(1);
		});
		if(pos ==  3, {
			~headDown.(0);
			~headUp.(1);
		});
	}
});

(
~speak = {
	~bodyPressure.(30);
	~bodyForward.value(10);
	~gitRock.(0);
	~headUp.(0);
	~look.(0);
	~gitTilt.(0);
	~legShort.(0);
	~legLong.(1);
});

(
~leanDownTilt = {
	~bodyPressure.(30);
	~bodyForward.value(10);
	~gitRock.(0);
	~look.(3);
	~gitTilt.(1);
	~legShort.(0);
	~legLong.(1);
});
);
)







//--------------------
//--------------------
//--------------------

// old

(
~lookUp = {
	~headUp.(0);
	~headDown.(1);
});

(
~lookStraight ={
	~headUp.(0);
	~headDown.(0);
});

(
~lookDown = {
	~heaDown.(0);
	~headUp.(1);
});

(
~lookForward = {
	~headDown.(1);
	~headUp.(1);
});

(
~leanDownTilt = {
	~bodyPressure.(30);
	~bodyForward.value(10);
	~gitRock.(0);
	~headUp.(1);
	~gitTilt.(1);
	~legShort.(0);
	~legLong.(1);
});

(
~speak = {
	~bodyPressure.(30);
	~bodyForward.value(10);
	~gitRock.(0);
	~headUp.(0);
	~headDown.(0);
	~gitTilt.(0);
	~legShort.(0);
	~legLong.(1);
});

//~leanDownTilt.()