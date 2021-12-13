s.boot;

s.meter;

Env([0, 1, 0], [1, 1], [1, -1]).plot;

(
SynthDef.new(\kick, {
	arg freqFirst=350,freqSecond=30,freqThird=0,freqDur1=0.05,freqDur2=5,freqC1=1,freqC2=(-10),atack=0.02,release=1,c1=1,c2=(-20),amplitude=0.3,pan=0,out=0;
	var signal,envelope,freqSweep,mixA,mixB,mixC,mixD;
	freqSweep = Env([freqFirst,freqSecond,freqThird],[freqDur1,freqDur2],[freqC1, freqC2]).ar;
	envelope = Env([0,1,0],[atack, release],[c1, c2]).kr(2);
	mixA = [SinOsc.ar(freqSweep, pi), PMOsc.ar(freqSweep, pi/2)];
	mixB = SinOsc.ar(freqSweep, pi/2);
	mixC = SinOsc.ar(Env([400, 80, 70, 0], [0.01, freqDur2], [freqC1, freqC2]).ar, pi/2);
	mixD = SinOsc.ar(Env([100, 30, 60, 0], [0.01, freqDur2], [freqC1, freqC2]).ar, pi/2);
	signal = Mix([mixA, mixB, mixC * 0.8, mixD * 0.9]);
	signal = signal*envelope;
	signal = Pan2.ar(signal, pan, amplitude);
	Out.ar(out, signal);
}).add;
)

x = Synth.new(\kick);