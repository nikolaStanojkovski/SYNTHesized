s.boot;

s.meter;

Env([0, 1, 0], [1, 1], [1, -1]).plot;

(
SynthDef.new(\kick, {
	arg freqFirst=230,freqSecond=70,freqThird=10,freqDur1=0.05,freqDur2=5,freqC1=1,freqC2=(-10),atack=0.02,release=1,c1=1,c2=(-20),amplitude=0.6,pan=0,out=0;
	var signal,envelope,freqSweep,mixA,mixB,mixC,mixD,mixE;
	freqSweep = Env([freqFirst,freqSecond,freqThird],[freqDur1,freqDur2],[freqC1, freqC2]).ar;
	envelope = Env([0,1,0],[atack, release],[c1, c2]).kr(2);
	mixA = [SinOsc.ar(freqSweep, pi), PMOsc.ar(freqSweep, pi/2)];
	mixB = [Osc.ar(freqSweep, pi/2), FSinOsc.ar(freqSweep, pi*3)];
	mixC = [LFNoise2.ar(400, 0.1, 0.4)];
	mixD = [LFDNoise0.ar(9000, 0.1, 0.1)];
	mixE = [SinOsc.ar(freqSweep, pi*3)];
	signal = Mix([mixA, mixB, mixC, mixD, mixE]);
	signal = signal*envelope;
	signal = signal*mixC*0.7;
	signal = Pan2.ar(signal, pan, amplitude);
	Out.ar(out, signal);
}).add;
)

x = Synth.new(\kick);