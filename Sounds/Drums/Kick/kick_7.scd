6s.boot;

s.meter;
s.freqscope;

~kick = Buffer.read(s, "C:/Users/Nick/Desktop/Fax/Kompjuterski zvuk i muzika/Project/Code/Kicks/kick_sample_2.wav");

(
SynthDef.new(\kick, {
	arg attack=0.01, decay=0.2, release=0.6, c1=1, c2=(-1), amplitude=0.2, buffer=~kick, out=0;
	var signal, envelope, freqSweep;
	envelope = Env([0,1,0], [attack, decay, release], [c1,c2]).kr(2);

	signal = PlayBuf.ar(2, buffer) * 0.6;
	freqSweep = Env([300,70,10],[0.01,1.5],[1, (-6)]).ar;

	signal = signal * freqSweep * 2;
	signal = BRF.ar(signal, 500, 0.4, 1, 0.4);
	signal = BRF.ar(signal, 700, 0.7, 1, 0.8);
	signal = BRF.ar(signal, 700, 0.8, 1, 0.9);
	signal = BRF.ar(signal, 1000, 0.3, 1, 0.2);
	signal = BRF.ar(signal, 1300, 0.3, 1, 0.2);
	signal = BRF.ar(signal, 1500, 0.4, 1, 0.6);
	signal = BRF.ar(signal, 1800, 0.4, 1, 0.9);
	signal = BRF.ar(signal, 2000, 0.3, 1, 0.4);
	signal = BRF.ar(signal, 2500, 0.3, 1, 0.6);
	signal = BRF.ar(signal, 3000, 0.1, 1, 0.7);
	signal = BRF.ar(signal, 3000, 0.1, 1, 0.8);
	signal = BRF.ar(signal, 3500, 0.1, 1, 0.6);
	signal = BRF.ar(signal, 4500, 0.4, 1, 0.5);
	signal = BRF.ar(signal, 5000, 0.5, 1, 0.6);
	signal = BRF.ar(signal, 6000, 0.4, 1, 0.5);
	signal = LPF.ar(signal, 10500, 1, 1);
	signal = HPF.ar(signal, 80, 1, 1);

	signal = signal * envelope;
	signal = Compander.ar(signal, 0, 0.7, 1, 1, 0.1);
	Out.ar(out, signal * amplitude);
}).add;
)

x = Synth.new(\kick);