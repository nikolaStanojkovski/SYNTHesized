s.boot;

s.meter;
s.freqscope;

~snare = Buffer.read(s, "C:/Users/Nick/Desktop/Fax/Kompjuterski zvuk i muzika/Project/Code/Snares/snare_sample_1.wav");

(
SynthDef.new(\snare, {
	arg attack=0.01, release=2, c1=1, c2=(-1), amplitude=1, buffer=~snare, out=0;
	var signal, envelope, mix, mixAdd;
	envelope = Env([0,1,0], [attack, release], [c1,c2]).kr;
	signal = PlayBuf.ar(2, buffer);

	mix = Mix.ar([LPF.ar(Saw.ar(6200, 0.2, 0.4), 9000, 1, 1) * LFTri.ar(8000, 0.2, 0.3, 0.3) * HPF.ar(LFNoise2.ar(7500, 1, 0.1), 8500, 1, 1)]);
	mixAdd = HPF.ar(LPF.ar(SinOsc.ar(600, 0.5, 1, 0.4), 600, 1, 0.5), 80, 1, 1);
	mix = mix * mixAdd;
	mix = mix + (LFTri.ar(3500, 0.1, 0.2, 0.2) * 0.3);
	signal = signal * HPF.ar(mix * 1.5, 12000, 1, 1);

	signal = signal * envelope * 1.5;
	signal = Compander.ar(FreeVerb.ar(signal, 0.3, 0.5, 0.7, 1, 0.3), 0.7, 0.4);
	Out.ar(out, signal);
}).add;
)

x = Synth.new(\snare);