
(
Tdef(\x,{
	var waitT = 0.1;
	var noteT = 0.05;
	~setFingers.(0,1);
	~setFingers.(1,1);
	~moveHand.(1,0);
	~moveHand.(0,2);
	loop({
		~leanLeft.();
		//~gitTilt.(1);
		~gripdampalloffbut.(2);
		4.do{
		~grip.(1,2,3);
		waitT.wait;
		~release.(1,2,3);
		~grip.(0,2,0);
		waitT.wait;
		~grip.(1,2,0);
		~release.(0,2,0);
		waitT.wait;
		~release.(1,2,0);
		~grip.(0,2,0);
		waitT.wait;
		~release.(0,2,0);

	};

		~leanRight.();
		~gripdampalloffbut.(2);
		4.do{
		~grip.(1,2,3);
		waitT.wait;
		~release.(1,2,3);
		~grip.(0,2,2);
		waitT.wait;
		~grip.(1,2,0);
		~release.(0,2,2);
		waitT.wait;
		~release.(1,2,0);
		~grip.(0,2,2);
		waitT.wait;
		~release.(0,2,2);

	};

		~leanDown.();
		//~gitTilt.(0);
		~gripdampalloffbut.(3);
		4.do{

		~grip.(1,3,3);
		waitT.wait;
		~release.(1,3,3);
		~grip.(0,3,0);
		waitT.wait;
		~grip.(1,3,0);
		~release.(0,3,0);
		waitT.wait;
		~release.(1,3,0);
		~grip.(0,3,0);
		waitT.wait;
		~release.(0,3,0);
	};

	})
}).play
)


~leanLeft.()
~leanRight.()

~headUp.value(0)

~gripdampalloffbut.(0);


~gitRock.(1)

~damp.()

~startingPosition.()

~gitTilt.(0)

~moveHand.(1,0);
~release.(0, 0, 4);
~play.(0,0,4,20);













