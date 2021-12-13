s.boot;

s.meter;

Env([0, 1, 0], [1, 1], [1, -1]).plot;

(
SynthDef.new(\kick, {
	arg freqFirst=300,freqSecond=30,freqThird=0,freqDur1=0.05,freqDur2=5,freqC1=1,freqC2=(-10),atack=0.01,decay=0.05,sustain=0.03,release=1.5,c1=1,c2=(-20),amplitude=0.35,pan=0,out=0;
	var signal,envelope,freqSweep,mixA,mixB,mixC,mixD,mixE;
	freqSweep = Env([freqFirst,freqSecond,freqThird],[freqDur1,freqDur2],[freqC1, freqC2]).ar;
	envelope = Env([0,1,0],[atack, decay, sustain, release],[c1, c2]).kr(2);
	mixA = [SinOsc.ar(freqSweep, pi), PMOsc.ar(freqSweep, pi/2)];
	mixB = [Osc.ar(freqSweep, pi/2), FSinOsc.ar(freqSweep, pi*3)];
	mixC = SinOsc.ar(Env([250, 80, 70, 0], [0.01, freqDur2], [freqC1, freqC2]).ar, pi/2);
	mixD = LFTri.ar(Env([200, 80, 70, 0], [0.01, freqDur2], [freqC1, freqC2]).ar, pi/2);
	mixE = LFNoise2.ar(5000, 0.2, 0.1);
	signal = Mix([mixA, mixB, mixC * 0.8, mixD, mixE]);
	signal = signal*envelope;
	signal = Pan2.ar(signal, pan, amplitude);
	Out.ar(out, signal);
}).add;
)

x = Synth.new(\kick);