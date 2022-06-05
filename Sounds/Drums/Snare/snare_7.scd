s.boot;

s.meter;
s.freqscope;

~snare = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Sounds/Drums/Snare/snare_sample_2.wav");

(
SynthDef.new(\snare, {
	arg attack=0.01, release=2, c1=1, c2=(-1), amplitude=0.5, buffer=~snare, out=0;
	var signal, envelope, mix;
	envelope = Env([0,1,0], [attack, release], [c1,c2]).kr;
	signal = PlayBuf.ar(2, buffer);

	mix = LPF.ar(LFNoise2.ar(300, 1, 1), 1100, 1, 0.5) * LPF.ar(LFNoise1.ar(7500, 1, 0.3), 12000, 1, 1) * LPF.ar(LFNoise1.ar(3000, 1, 0.4), 7000, 1, 1);
	signal = signal * mix;

	signal = signal * envelope;
	signal = Compander.ar(FreeVerb.ar(signal, 0.3, 0.2, 0.7, 1, 0.3), 0.4);
	Out.ar(out, signal * amplitude);
}).add;
)

x = Synth.new(\snare);