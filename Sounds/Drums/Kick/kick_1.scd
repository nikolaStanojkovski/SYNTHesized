s.boot;

s.meter;

Env([0, 1, 0], [1, 1], [1, -1]).plot;

(
SynthDef.new(\kick, {
	arg freqFirst=700,freqSecond=70,freqThird=10,freqDur1=0.03,freqDur2=1,freqC1=1,freqC2=(-1),atack=0.01,release=2,c1=1,c2=(-12),amplitude=0.8,pan=0,out=0;
	var signal,envelope,freqSweep;
	freqSweep = Env([freqFirst,freqSecond,freqThird],[freqDur1,freqDur2],[freqC1, freqC2]).ar;
	envelope = Env([0,1,0],[atack, release],[c1, c2]).kr(2);
	signal = SinOsc.ar(freqSweep, pi/2);
	signal = signal*envelope;
	signal = Pan2.ar(signal, pan, amplitude);
	Out.ar(out, signal);
}).add;
)

x = Synth.new(\kick);