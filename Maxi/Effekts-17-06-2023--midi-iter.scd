(
Tdef(\iter, inf.do {
	arg i;

	var waitT = 0.1;
	var noteT = 0.05;

	~moveHand.(1,0);
	~moveHand.(0,2);
	~setFingers.(0,1);
	~setFingers.(1,1);

	// Grip
	// String 0
	~grip.(0, 0, i);
	// String 1
	~grip.(0, 1, i * 2);
	// String 2
	~grip.(0, 2, i * 3);
	// String 3
	~grip.(0, 3, i * 4);
	// String 4
	~grip.(0, 4, i * 5);
	// String 5
	~grip.(0, 5, i * 6);

	waitT.wait;

	// Release
	// String 0
	~release.(0, 0, i);
	// String 1
	~release.(0, 1, i * 2);
	// String 2
	~release.(0, 2, i * 3);
	// String 3
	~release.(0, 3, i * 4);
	// String 4
	~release.(0, 4, i * 5);
	// String 5
	~release.(0, 5, i * 6);

	waitT.wait;
}).play;
)