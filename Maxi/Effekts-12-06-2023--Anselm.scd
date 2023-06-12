// Gruppen

// Man kann bei Proxies dann nur über die NodeID zugreifen da Variablennamen immer Language bound sind

// Server Latency über Sample Differenz ausgleichen falls es nicht mit Link Clock klappt

(
Pdef(\test,
Pbind(
	\instrument, \default,
	\dur, 0.5,
	\group, 210,
	\out, 220,
));
)

Pdef(\test).play;

// überlegen ob wir Groups benutzen wollen

// ChatMessages über RemoteID

// anstatt TDef für Hellgå einfach Pfunc