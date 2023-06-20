// === Hellga Movement Functions === \\

(
Tdef(\hellgaHeadBang, {
	loop({
		~headDown.(1);
		(4/4).wait;
	    ~headDown.(0);
		(4/4).wait;
	});
});
)

(
Tdef(\hellgaHeadKnod, {

	loop({
		~look.(1);
	    (1/8).wait;
		~look.(3);
		(1/8).wait;
	});
});
)

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
			~gitRock.(1);
			0.125.wait;
			~look.(1);
			~gitRock.(0);
			0.125.wait;
		};
		16.do{
			~look.(3);
			~gitTilt.(1);
			~bodyForward.(0);
			0.125.wait;
			~look.(1);
			~gitTilt.(0);
			0.125.wait;
			~look.(3);
			~gitTilt.(1);
			~bodyForward.(64);
			0.125.wait;
			~look.(1);
			~gitTilt.(0);
			0.125.wait;
		};
		~speak.();
		1.wait;
		~bodyTurn.(0);
		1.wait;
		~look.(1);
		1.wait;
	}
});
)

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

)


//old

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