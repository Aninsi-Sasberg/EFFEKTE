// Guitar Solo and Background Loop for Hellga

(
Tdef(\hellgaSolo,{

	var waitT = 1/16;
	var noteT = 0.05;

	~moveHand.(1,0);
	~moveHand.(0,2);
	~setFingers.(0,1);
	~setFingers.(1,1);

	//Solo

	//A-------------------------------------------

	//a)----------------------------------

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

	//========================= 2
	4.do{
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

	//========================= 3
	4.do{
		~grip.(1, 3, 5);
		waitT.wait;
		~release.(1, 3, 5);
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

	//========================= 4
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

	//b)----------------------------------

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

	//========================= 6
	4.do{
		~grip.(1, 3, 5);
		waitT.wait;
		~release.(1, 3, 5);
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

	//========================= 7
	~gripdampalloffbut.(4);
	4.do{
		~grip.(1, 4, 5);
		waitT.wait;
		~release.(1, 4, 5);
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

	//========================= 8
	2.do{
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

	1.do{
		~grip.(1, 4, 0);
		waitT.wait;
		~release.(1, 4, 0);
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

	1.do{
		~grip.(1, 4, 0);
		waitT.wait;
		~release.(1, 4, 0);
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

	//B1-------------------------------------------

	//a)----------------------------------

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
	//========================= 10
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

	//========================= 11
	~gripdampalloffbut.(2);
	4.do{
		~grip.(1, 2, 5);
		waitT.wait;
		~release.(1, 2, 5);
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

	//========================= 12
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

	//b)----------------------------------

	~gripdampalloffbut.(3);
	1.do{
		~grip.(1, 3, 3);
		waitT.wait;
		~release.(1, 3, 3);
		~grip.(0, 3, 1);
		waitT.wait;
		~release.(0, 3, 1);
		~grip.(0, 3, 4);
		~moveHand.(1, 1);
		waitT.wait;
		~release.(0, 3, 4);
		~grip.(0, 3, 1);
		waitT.wait;
		~release.(0, 3, 1);
		~setFingers.(1, 1);

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
		waitT.wait;
		~release.(0, 3, 1);
		~grip.(0, 3, 4);
		waitT.wait;
		~release.(0, 3, 4);
		~grip.(0, 3, 1);
		~moveHand.(1, 0);
		waitT.wait;
		~release.(0, 3, 1);
		~setFingers.(1, 1);

	};

	//========================= 14
	1.do{
		~grip.(1, 3, 1);
		waitT.wait;
		~release.(1, 3, 1);
		~grip.(0, 3, 0);
		waitT.wait;
		~release.(0, 3, 0);
		~grip.(0, 3, 3);
		~moveHand.(1, 1);
		waitT.wait;
		~release.(0, 3, 3);
		~grip.(0, 3, 0);
		waitT.wait;
		~release.(0, 3, 0);
		~setFingers.(1, 1);

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
		~moveHand.(1, 0);
		~grip.(0, 3, 0);
		waitT.wait;
		~release.(0, 3, 0);
		~setFingers.(1, 1);

	};

	1.do{
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
		/*~moveHand.(1, 0);*/
		waitT.wait;
		~release.(0, 3, 0);
		/*~setFingers.(1, 1);*/

	};

	//======================== 15
	~gripdampalloffbut.(2);
	2.do{
		~grip.(1, 2, 5);
		waitT.wait;
		~release.(1, 2, 5);
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
		~grip.(1, 2, 5);
		waitT.wait;
		~release.(1, 2, 5);
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

	//========================= 16
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

	1.do{
		~grip.(1, 2, 5);
		waitT.wait;
		~release.(1, 2, 5);
		~grip.(0, 2, 1);
		waitT.wait;
		~release.(0, 2, 1);
		~grip.(1, 2, 5);
		waitT.wait;
		~release.(1, 2, 5);
		~grip.(0, 2, 1);
		waitT.wait;
		~release.(0, 2, 1);

	};

	1.do{
		~grip.(1, 2, 5);
		waitT.wait;
		~release.(1, 2, 5);
		~grip.(0, 2, 1);
		waitT.wait;
		~release.(0, 2, 1);
		~grip.(1, 2, 5);
		waitT.wait;
		~release.(1, 2, 5);
		~grip.(0, 2, 1);
		waitT.wait;
		~release.(0, 2, 1);

	};

	//A2-------------------------------------------

	//a)----------------------------------

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

	//========================= 18
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

	//========================= 19
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
		~grip.(0, 3, 3);
		waitT.wait;
		~release.(0, 3, 3);
	};

	//========================= 20
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

	//b)----------------------------------

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

	//========================= 22
	4.do{
		~grip.(1, 3, 5);
		waitT.wait;
		~release.(1, 3, 5);
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

	//========================= 23
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

	//========================= 24
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

	//B2-------------------------------------------

	//a)----------------------------------

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

	//========================= 26
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

	//========================= 27
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

	//========================= 28
	3.do{
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

	1.do{
		~grip.(1, 4, 2);
		waitT.wait;
		~release.(1, 4, 2);
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

	//b)----------------------------------

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

	//========================= 30
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

	//========================= 31
	1.do{
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

	3.do{
		~grip.(1, 4, 2);
		waitT.wait;
		~release.(1, 4, 2);
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

	//========================= 32
	2.do{
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

	2.do{
		~grip.(1, 4, 5);
		waitT.wait;
		~release.(1, 4, 5);
		~grip.(0, 4, 4);
		waitT.wait;
		~release.(0, 4, 4);
		~grip.(1, 4, 5);
		waitT.wait;
		~release.(1, 4, 5);
		~grip.(0, 4, 4);
		waitT.wait;
		~release.(0, 4, 4);
	};

	// Loop

	loop({

		//A-------------------------------------------

		//a)----------------------------------

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

		//========================= 2
		4.do{
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

		//========================= 3
		4.do{
			~grip.(1, 3, 5);
			waitT.wait;
			~release.(1, 3, 5);
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

		//========================= 4
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

		//b)----------------------------------

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

		//========================= 6
		4.do{
			~grip.(1, 3, 5);
			waitT.wait;
			~release.(1, 3, 5);
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

		//========================= 7
		~gripdampalloffbut.(4);
		4.do{
			~grip.(1, 4, 5);
			waitT.wait;
			~release.(1, 4, 5);
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

		//========================= 8
		2.do{
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

		1.do{
			~grip.(1, 4, 0);
			waitT.wait;
			~release.(1, 4, 0);
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

		1.do{
			~grip.(1, 4, 0);
			waitT.wait;
			~release.(1, 4, 0);
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

		// End Loop
	})

});
)