(
s.options.protocol = \tcp; // set to use tcp
s.options.bindAddress = "0.0.0.0"; // allow connections from any address
s.options.maxLogins = 3; // set to correct number of clients



o = Server.default.options;
o.numInputBusChannels = 64;
o.numOutputBusChannels = 64;

s.boot();

// p = ProxySpace.push(s.boot());
)

(
// Link Clock noch in CMDPeriod packen?
l = LinkClock.new.latency_(Server.default.latency);
)