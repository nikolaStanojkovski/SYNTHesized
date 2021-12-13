s.boot;

s.meter;

Env([0, 1, 0], [1, 1], [1, -1]).plot;

(
SynthDef.new(\kick, {
	arg freqFirst=300,freqSecond=70,freqThird=10,freqDur1=0.05,freqDur2=3,freqC1=3,freqC2=(-3),atack=0.01,release=1,c1=1,c2=(-20),amplitude=1.3,pan=0,out=0;
	var signal,envelope,freqSweep,mixA,mixB,mixC,mixD,mixE,mixJ;
	freqSweep = Env([freqFirst,freqSecond,freqThird],[freqDur1,freqDur2],[freqC1, freqC2]).ar;
	envelope = Env([0,1,0],[atack, release],[c1, c2]).kr(10);
	mixA = [SinOsc.ar(freqSweep, pi/2), PMOsc.ar(freqSweep, pi*2)];
	mixB = [Osc.ar(freqSweep, pi/2), FSinOsc.ar(freqSweep, pi/2)];
	mixC = [LFNoise2.ar(1000, 0.1, 0.1)];
	mixD = [LFDNoise3.ar(3000, 0.1, 0.2)];
	mixE = [LFDNoise3.ar(10000, 0.1, 0.3)];
	signal = Mix([mixA, mixB, mixD, mixE]);
	signal = signal*envelope;
	signal = signal*mixC*0.9;
	signal = Pan2.ar(signal, pan, amplitude);
	Out.ar(out, signal);
}).add;
)

x = Synth.new(\kick);