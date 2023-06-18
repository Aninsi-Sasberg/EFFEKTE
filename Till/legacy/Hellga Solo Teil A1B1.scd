(
Tdef(\x,{
	var waitT = 0.1;
	var noteT = 0.05;
	~moveHand.(1,0);
	~moveHand.(0,2);
	~setFingers.(0,1);
	~setFingers.(1,1);
	loop({
		//A2
		//a)-----------------------------
		~gripdampalloffbut.(3);
		4.do{
			~grip.(1, 3, 3);
			waitT.wait;
			~release.(1, 3, 3);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
		};

		//========================

		4.do{
			~grip.(1, 3, 5);
			waitT.wait;
			~release.(1, 3, 5);
			~grip.(1, 3, 1);
			waitT.wait;
			~release.(1, 3, 1);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);
			~grip.(1, 3, 1);
			waitT.wait;
			~release.(1, 3, 1);
		};

		//=========================

		2.do{
			~grip.(1, 3, 5);
			waitT.wait;
			~release.(1, 3, 5);
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
			~grip.(1, 3, 5);
			waitT.wait;
			~release.(1, 3, 5);
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(0, 3, 0);
			~grip.(0, 3, 0);
			waitT.wait;
			~release.(1, 3, 1);
		};

		//=========================

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
			~grip.(0, 3, 3);
			waitT.wait;
			~release.(0, 3, 3);
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

		//b)-----------------------

		4.do{
			~grip.(1, 3, 3);
			waitT.wait;
			~release.(1, 3, 3);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
			~grip.(0, 3, 1);
			waitT.wait;
			~release.(0, 3, 1);
			~grip.(0, 3, 4);
			waitT.wait;
			~release.(0, 3, 4);
		};

		//=========================

		~gripdampalloffbut.(4);

		4.do{
			~grip.(1, 4, 5);
			waitT.wait;
			~release.(1, 4, 5);
			~grip.(1, 4, 0);
			waitT.wait;
			~release.(1, 4, 0);
			~grip.(0, 4, 2);
			waitT.wait;
			~release.(0, 4, 2);
			~grip.(1, 4, 0);
			waitT.wait;
			~release.(1, 4, 0);
		};

		//=========================

		4.do{
			~grip.(1, 4, 6);
			waitT.wait;
			~release.(1, 4, 6);
			~grip.(1, 4, 2);
			waitT.wait;
			~release.(1, 4, 2);
			~grip.(0, 4, 2);
			waitT.wait;
			~release.(0, 4, 2);
			~grip.(1, 4, 2);
			waitT.wait;
			~release.(1, 4, 2);
		};

		//=========================

		4.do{
			~grip.(1, 4, 5);
			waitT.wait;
			~release.(1, 4, 5);
			~grip.(0, 4, 4);
			waitT.wait;
			~release.(0, 4, 4);
			~grip.(0, 4, 1);
			waitT.wait;
			~release.(0, 4, 1);
			~grip.(0, 4, 4);
			waitT.wait;
			~release.(0, 4, 4);
		};

		//B2--------------------------------

		//a)--------------------------------

		4.do{
			~grip.(1, 4, 5);
			waitT.wait;
			~release.(1, 4, 5);
			~grip.(1, 4, 0);
			waitT.wait;
			~release.(1, 4, 0);
			~grip.(0, 4, 2);
			waitT.wait;
			~release.(0, 4, 2);
			~grip.(1, 4, 0);
			waitT.wait;
			~release.(1, 4, 0);
		};

		//=========================

		4.do{
			~grip.(1, 4, 6);
			waitT.wait;
			~release.(1, 4, 6);
			~grip.(1, 4, 0);
			waitT.wait;
			~release.(1, 4, 0);
			~grip.(0, 4, 2);
			waitT.wait;
			~release.(0, 4, 2);
			~grip.(1, 4, 0);
			waitT.wait;
			~release.(1, 4, 0);
		};

		//=========================

		4.do{
			~grip.(1, 4, 6);
			waitT.wait;
			~release.(1, 4, 6);
			~grip.(1, 4, 2);
			waitT.wait;
			~release.(1, 4, 2);
			~grip.(0, 4, 4);
			waitT.wait;
			~release.(0, 4, 4);
			~grip.(1, 4, 2);
			waitT.wait;
			~release.(1, 4, 2);
		};

		//=========================

		3.do{
			~grip.(1, 4, 3);
			waitT.wait;
			~release.(1, 4, 3);
			~grip.(0, 4, 3);
			waitT.wait;
			~release.(0, 4, 3);
			~grip.(0, 4, 0);
			waitT.wait;
			~release.(0, 4, 0);
			~grip.(0, 4, 3);
			waitT.wait;
			~release.(0, 4, 3);
		};

		1.do{
			~grip.(1, 4, 1);
			waitT.wait;
			~release.(1, 4, 1);
			~grip.(0, 4, 3);
			waitT.wait;
			~release.(0, 4, 3);
			~grip.(0, 4, 0);
			waitT.wait;
			~release.(0, 4, 0);
			~grip.(0, 4, 3);
			waitT.wait;
			~release.(0, 4, 3);
		};

		//b)--------------------------------

		4.do{
			~grip.(1, 4, 6);
			waitT.wait;
			~release.(1, 4, 6);
			~grip.(0, 4, 4);
			waitT.wait;
			~release.(0, 4, 4);
			~grip.(0, 4, 1);
			waitT.wait;
			~release.(0, 4, 1);
			~grip.(0, 4, 4);
			waitT.wait;
			~release.(0, 4, 4);
		};

		//=========================

		4.do{
			~grip.(1, 4, 5);
			waitT.wait;
			~release.(1, 4, 5);
			~grip.(1, 4, 3);
			waitT.wait;
			~release.(1, 4, 3);
			~grip.(0, 4, 3);
			waitT.wait;
			~release.(0, 4, 3);
			~grip.(1, 4, 3);
			waitT.wait;
			~release.(1, 4, 3);
		};

		//=========================

		4.do{
			~grip.(1, 4, 5);
			waitT.wait;
			~release.(1, 4, 5);
			~grip.(0, 4, 4);
			waitT.wait;
			~release.(0, 4, 4);
			~grip.(0, 4, 1);
			waitT.wait;
			~release.(0, 4, 1);
			~grip.(0, 4, 4);
			waitT.wait;
			~release.(0, 4, 4);
		};

		//=========================

		2.do{
			~grip.(1, 4, 5);
			waitT.wait;
			~release.(1, 4, 5);
			~grip.(0, 4, 3);
			waitT.wait;
			~release.(0, 4, 3);
			~grip.(0, 4, 0);
			waitT.wait;
			~release.(0, 4, 0);
			~grip.(0, 4, 3);
			waitT.wait;
			~release.(0, 4, 3);
		};

		1.do{
			~grip.(1, 4, 3);
			waitT.wait;
			~release.(1, 4, 3);
			~grip.(0, 4, 3);
			waitT.wait;
			~release.(0, 4, 3);
			~grip.(0, 4, 0);
			waitT.wait;
			~release.(0, 4, 0);
			~grip.(0, 4, 3);
			waitT.wait;
			~release.(0, 4, 3);
		};

		1.do{
			~grip.(1, 4, 2);
			waitT.wait;
			~release.(1, 4, 2);
			~grip.(0, 4, 3);
			waitT.wait;
			~release.(0, 4, 3);
			~grip.(0, 4, 0);
			waitT.wait;
			~release.(0, 4, 0);
			~grip.(0, 4, 3);
			waitT.wait;
			~release.(0, 4, 3);
		};

		//=========================

	};
	)

}).play
)
























