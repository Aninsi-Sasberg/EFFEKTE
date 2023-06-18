~startingPosition.();
//linke hand = bis 9 fret
//rechte hand = ab 9 bis 13 - von 13 bis 20
//5/6 fret bei doppelbelegung bei rechter hand = 0

(
Tdef(\x,{
	var waitT = 0.1;
	var noteT = 0.05;
	~setFingers.(0,1);
	~setFingers.(1,1);
	~moveHand.(1,0);
	~moveHand.(0,2);
	loop({
		//~leanLeft.();
		//~gitTilt.(1);
		//--- A0 ---
		//a)
		~gripdampalloffbut.(3);
		4.do{
			~grip.(1, 3, 3);
			waitT.wait;
			~release.(1, 3, 3);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);

		};

		4.do{
			~grip.(1, 3, 4);
			waitT.wait;
			~release.(1, 3, 4);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);

		};

		4.do{
			~grip.(1, 3, 4);
			waitT.wait;
			~release.(1, 3, 4);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);
			~grip.(1, 3, 1);
			waitT.wait;
			~release.(1, 3, 1);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);

		};

		3.do{
			~grip.(1, 3, 3);
			waitT.wait;
			~release.(1, 3, 3);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);

		};

		1.do{
			~grip.(1, 3, 1);
			waitT.wait;
			~release.(1, 3, 1);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);

		};

		//b)
		4.do{
			~grip.(1, 3, 3);
			waitT.wait;
			~release.(1, 3, 3);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);

		};

		4.do{
			~grip.(1, 3, 4);
			waitT.wait;
			~release.(1, 3, 4);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);
			~grip.(1, 3, 1);
			waitT.wait;
			~release.(1, 3, 1);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);

		};

		~gripdampalloffbut.(4);
		4.do{
			~grip.(1, 4, 4);
			waitT.wait;
			~release.(1, 4, 4);
			~grip.(0, 4, 2);
			waitT.wait;
			~release.(0, 4, 2);
			~grip.(1, 4, 0);
			waitT.wait;
			~release.(1, 4, 0);
			~grip.(0, 4, 2);
			waitT.wait;
			~release.(0, 4, 2);

		};

		4.do{
			~grip.(1, 4, 3);
			waitT.wait;
			~release.(1, 4, 3);
			~grip.(0, 4, 2);
			waitT.wait;
			~release.(0, 4, 2);
			~grip.(1, 4, 0);
			waitT.wait;
			~release.(1, 4, 0);
			~grip.(0, 4, 2);
			waitT.wait;
			~release.(0, 4, 2);

		};

		~gripdampalloffbut.(3);
		// --- B0 ---
		//a)
		4.do{
			~grip.(1, 3, 3);
			waitT.wait;
			~release.(1, 3, 3);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);

		};

		4.do{
			~grip.(1, 3, 1);
			waitT.wait;
			~release.(1, 3, 1);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);

		};

		~gripdampalloffbut.(2);
		4.do{
			~grip.(1, 2, 4);
			waitT.wait;
			~release.(1, 2, 4);
			~grip.(0, 2, 2);
			waitT.wait;
			~release.(0, 2, 2);
			~grip.(1, 2, 1);
			waitT.wait;
			~release.(1, 2, 1);
			~grip.(0, 2, 2);
			waitT.wait;
			~release.(0, 2, 2);

		};

		4.do{
			~grip.(1, 2, 3);
			waitT.wait;
			~release.(1, 2, 3);
			~grip.(0, 2, 1);
			waitT.wait;
			~release.(0, 2, 1);
			~grip.(1, 2, 0);
			waitT.wait;
			~release.(1, 2, 0);
			~grip.(0, 2, 1);
			waitT.wait;
			~release.(0, 2, 1);

		};

		//b)
		~gripdampalloffbut.(3);

		1.do{
			~grip.(1, 3, 3);
			waitT.wait;
			~release.(1, 3, 3);
			~grip.(0, 3, 1);
			~moveHand.(1, 1);
			waitT.wait;
			~release.(0, 3, 1);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);

		};

		1.do{
			~grip.(1, 3, 5);
			waitT.wait;
			~release.(1, 3, 5);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);

		};

		1.do{
			~grip.(1, 3, 4);
			waitT.wait;
			~release.(1, 3, 4);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);

		};

		1.do{
			~grip.(1, 3, 2);
			waitT.wait;
			~release.(1, 3, 2);
			~grip.(0, 3, 1);
			~moveHand.(1, 0);
			waitT.wait;
			~release.(0, 3, 1);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);

		};

		//------------------
		1.do{
			~grip.(1, 3, 1);
			waitT.wait;
			~release.(1, 3, 1);
			~grip.(0, 3, 0);
			~moveHand.(1, 1);
			waitT.wait;
			~release.(0, 3, 0);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);

		};

		1.do{
			~grip.(1, 3, 4);
			waitT.wait;
			~release.(1, 3, 4);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);

		};

		1.do{
			~grip.(1, 3, 2);
			waitT.wait;
			~release.(1, 3, 2);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);

		};

		1.do{
			~grip.(1, 3, 0);
			waitT.wait;
			~release.(1, 3, 0);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);

		};


		~gripdampalloffbut.(2);
		2.do{
			~grip.(1, 2, 4);
			waitT.wait;
			~release.(1, 2, 4);
			~grip.(0, 2, 2);
			waitT.wait;
			~release.(0, 2, 2);
			~grip.(1, 2, 1);
			waitT.wait;
			~release.(1, 2, 1);
			~grip.(0, 2, 2);
			waitT.wait;
			~release.(0, 2, 2);

		};

		2.do{
			~grip.(1, 2, 3);
			waitT.wait;
			~release.(1, 2, 3);
			~grip.(0, 2, 2);
			waitT.wait;
			~release.(0, 2, 2);
			~grip.(1, 2, 1);
			waitT.wait;
			~release.(1, 2, 1);
			~grip.(0, 2, 2);
			waitT.wait;
			~release.(0, 2, 2);

		};


		//--------
		1.do{
			~grip.(1, 2, 3);
			waitT.wait;
			~release.(1, 2, 3);
			~grip.(0, 2, 1);
			waitT.wait;
			~release.(0, 2, 1);
			~grip.(1, 2, 0);
			waitT.wait;
			~release.(1, 2, 0);
			~grip.(0, 2, 1);
			~moveHand.(1, 1);
			waitT.wait;
			~release.(0, 2, 1);

		};

		1.do{
			~grip.(1, 2, 3);
			waitT.wait;
			~release.(1, 2, 3);
			~grip.(0, 2, 1);
			waitT.wait;
			~release.(0, 2, 1);
			~grip.(1, 2, 0);
			waitT.wait;
			~release.(1, 2, 0);
			~grip.(0, 2, 1);
			waitT.wait;
			~release.(0, 2, 1);

		};










	})
}).play;
)





(
Tdef(\x,{
	var waitT = 0.1;
	var noteT = 0.05;
	~setFingers.(0,1);
	~setFingers.(1,1);
	~moveHand.(1,0);
	~moveHand.(0,2);
	loop({
		//~leanLeft.();
		//~gitTilt.(1);
		//--- A1 ---
		//a)
		~gripdampalloffbut.(3);
		4.do{
			~grip.(1, 3, 3);
			waitT.wait;
			~release.(1, 3, 3);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);

		};

		//~gripdampalloffbut.(3);
		4.do{
			~grip.(1, 3, 4);
			waitT.wait;
			~release.(1, 3, 4);
			~grip.(1, 3, 3);
			waitT.wait;
			~release.(1, 3, 3);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);
			~grip.(1, 3, 1);
			waitT.wait;
			~release.(1, 3, 1);

		};
		//~gripdampalloffbut.(3);
		2.do{
			~grip.(1, 3, 4);
			waitT.wait;
			~release.(1, 3, 4);
			~grip.(1, 3, 1);
			waitT.wait;
			~release.(1, 3, 1);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);
			~grip.(1, 3, 1);
			waitT.wait;
			~release.(1, 3, 1);

		};

		2.do{
			~grip.(1, 3, 4);
			waitT.wait;
			~release.(1, 3, 4);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);

		};

		1.do{
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);
			~grip.(1, 3, 1);
			waitT.wait;
			~release.(1, 3, 1);

		};

		1.do{
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
			~grip.(1, 3, 3);
			waitT.wait;
			~release.(1, 3, 3);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);

		};

		1.do{
			~grip.(1, 3, 1);
			waitT.wait;
			~release.(1, 3, 1);
			~grip.(1, 3, 3);
			waitT.wait;
			~release.(1, 3, 3);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
			~grip.(1, 3, 3);
			waitT.wait;
			~release.(1, 3, 3);

		};

		1.do{
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);
			~grip.(1, 3, 1);
			waitT.wait;
			~release.(1, 3, 1);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);

		};




	};

	)
}).play
)























