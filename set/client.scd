// optional remote Server
(
o = ServerOptions.new;
o.protocol_(\tcp);
t = Server.remote(\remote, NetAddr("169.254.124.205", 57110), o); // set to correct address and port
t.addr.connect;
t.startAliveThread( 0 );
t.doWhenBooted({ "remote tcp server started".postln; t.notify; t.initTree });
)


// create a synchronized clock
l = LinkClock(1).latency_(s.latency);
~linkClockGui.();

// command period
(
CmdPeriod.add({
	l = LinkClock(1).latency_(s.latency);
	~linkClockGui.();
});
)


// link clock gui code (link clock hardcoded as l)
(
~linkClockGui = {
	var win = Window("LinkClock", Rect(200, 200, 500, 100)).front,
	peersBox, tempoBox, barsBox, beatsBox,
	font = Font.default.copy.size_(32),
	boldFont = font.boldVariant,
	controller, task;

	win.layout = HLayout(
		StaticText().font_(font).string_("Peers:"),
		peersBox = NumberBox().font_(boldFont).align_(\center).fixedWidth_(80),
		StaticText().font_(font).string_("Tempo:"),
		tempoBox = NumberBox().font_(boldFont).align_(\center).fixedWidth_(120),
		StaticText().font_(font).string_("Now:"),
		barsBox = NumberBox().font_(boldFont).align_(\center).fixedWidth_(80),
		beatsBox = NumberBox().font_(boldFont).align_(\center).fixedWidth_(80)
	);

	[peersBox, barsBox, beatsBox].do { |view| view.enabled_(false) };

	tempoBox.action = { |view| l.tempo = view.value / 60 };
	tempoBox.value = l.tempo * 60;
	peersBox.value = l.numPeers;

	task = Routine {
		var bars, beats;
		loop {
			bars = l.bar;
			beats = l.beatInBar;
			{
				barsBox.value = bars;
				beatsBox.value = beats;
			}.defer(l.latency);
			1.0.wait;
		}
	}.play(l, quant: 1);

	controller = SimpleController(l)
	.put(\tempo, {
		defer { tempoBox.value = l.tempo * 60 }
	})
	.put(\numPeers, {
		defer { peersBox.value = l.numPeers }
	})
	.put(\stop, { defer { win.close } });

	win.onClose = { task.stop; controller.remove };
}
)