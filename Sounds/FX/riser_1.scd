s.boot;

s.meter;

(
SynthDef.new(\riser, {
	arg mainFreq=349.23, attack=3,decay=0.2,sustain=0.5,release=0.5,c1=1,c2=(-1),amplitude=0.6,pan=0,out=0;
	var signal, envelope, a, b, c, d, j, f, e;
	envelope = Env([0,1,0],[attack, decay, sustain, release],[c1, c2]).ar;
	a = [SinOsc.ar(mainFreq, 0.2, 0.2), Saw.ar(662, 0.2)];
	b = [SinOsc.ar(mainFreq+2, 0, 0.2), Saw.ar(660, 0.2)];
	c = [SinOsc.ar(mainFreq+10, 0.4, 0.2), Saw.ar(664, 0.2)];
	d = [SinOsc.ar(mainFreq+16, 0, 0.1), Saw.ar(666, 0.2)];
	j = [SyncSaw.ar(mainFreq+80, 440, 0, 0.2)];
	f = [VarSaw.ar(660, 0.2, 0.7, 0.3, 0.1)];
	e = [SyncSaw.ar(87, 0.1, 0.1, 0.6), VarSaw.ar(174, 0.6, 0.1, 0.2)];
	signal = FreeVerb.ar(Mix([a, b, c, d, j, f, e]), 0.6, 0.4, 0.6);
	signal = envelope * signal;
	signal = Pan2.ar(signal, pan, amplitude);
	Out.ar(out, signal);
}).add;
)

x = Synth.new(\riser);