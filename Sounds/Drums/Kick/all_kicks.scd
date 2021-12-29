s.boot;


///////////////////////
/////// Kicks /////////
///////////////////////

(
var kick_6_buffer, kick_7_buffer, kick_8_buffer;

SynthDef.new(\kick_1, {
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

SynthDef.new(\kick_2, {
	arg freqFirst=300,freqSecond=70,freqThird=10,freqDur1=0.05,freqDur2=5,freqC1=1,freqC2=(-10),atack=0.02,release=1,c1=1,c2=(-20),amplitude=0.6,pan=0,out=0;
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

SynthDef.new(\kick_3, {
	arg freqFirst=300,freqSecond=70,freqThird=10,freqDur1=0.05,freqDur2=5,freqC1=1,freqC2=(-10),atack=0.02,release=1,c1=1,c2=(-20),amplitude=0.3,pan=0,out=0;
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

SynthDef.new(\kick_4, {
	arg freqFirst=300,freqSecond=70,freqThird=10,freqDur1=0.05,freqDur2=5,freqC1=1,freqC2=(-10),atack=0.01,decay=0.05,sustain=0.03,release=1.5,c1=1,c2=(-20),amplitude=0.35,pan=0,out=0;
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

SynthDef.new(\kick_5, {
	arg freqFirst=300,freqSecond=70,freqThird=10,freqDur1=0.05,freqDur2=5,freqC1=1,freqC2=(-10),atack=0.01,decay=0.05,sustain=0.03,release=1.5,c1=1,c2=(-20),amplitude=0.35,pan=0,out=0;
	var signal,envelope,freqSweep,mixA,mixB,mixC,mixD,mixE, noise;

	freqSweep = Env([freqFirst,freqSecond,freqThird],[freqDur1,freqDur2],[freqC1, freqC2]).ar;
	envelope = Env([0,1,0],[atack, decay, sustain, release],[c1, c2]).kr(2);

	mixA = [SinOsc.ar(freqSweep, pi), PMOsc.ar(freqSweep, pi/2)];
	mixB = [Osc.ar(freqSweep, pi/2), FSinOsc.ar(freqSweep, pi*3)];
	mixC = SinOsc.ar(Env([250, 80, 70, 0], [0.01, freqDur2], [freqC1, freqC2]).ar, pi/2);
	mixD = LFTri.ar(Env([200, 80, 70, 0], [0.01, freqDur2], [freqC1, freqC2]).ar, pi/2);
	mixE = LFNoise2.ar(5000, 0.2, 0.1);

	noise = WhiteNoise.ar(envelope);
	noise = HPF.ar(noise, 2000);
	noise = BPF.ar(noise, 900, 3);

	signal = Mix([mixA, mixB, mixC * 0.8, mixD, mixE]) + (noise * 0.1);
	signal = signal*envelope;

	signal = Pan2.ar(signal, pan, amplitude);
	Out.ar(out, signal);
}).add;

kick_6_buffer = Buffer.read(s, "C:/Users/Nick/Desktop/Fax/Kompjuterski zvuk i muzika/Project/Code/Kicks/kick_sample_1.wav");
SynthDef.new(\kick_6, {
	arg attack=0.01, decay=0.2, release=0.6, c1=1, c2=(-1), amplitude=0.2, buffer=kick_6_buffer, out=0;
	var signal, envelope, freqSweep;
	envelope = Env([0,1,0], [attack, decay, release], [c1,c2]).kr(2);

	signal = PlayBuf.ar(2, buffer) * 0.6;
	freqSweep = Env([300,70,10],[0.01,1.5],[1, (-10)]).ar;

	signal = signal * freqSweep * 2;
	signal = BRF.ar(signal, 500, 0.4, 1, 0.4);
	signal = BRF.ar(signal, 700, 0.4, 1, 0.6);
	signal = BRF.ar(signal, 1000, 0.3, 1, 0.2);
	signal = BRF.ar(signal, 1500, 0.4, 1, 0.6);
	signal = BRF.ar(signal, 2000, 0.4, 1, 0.4);
	signal = BRF.ar(signal, 2500, 0.7, 1, 0.6);
	signal = BRF.ar(signal, 3000, 0.8, 1, 0.7);
	signal = BRF.ar(signal, 3000, 0.8, 1, 0.8);
	signal = BRF.ar(signal, 3500, 0.8, 1, 0.6);
	signal = BRF.ar(signal, 4500, 0.5, 1, 0.5);
	signal = BRF.ar(signal, 5000, 0.5, 1, 0.6);
	signal = BRF.ar(signal, 6000, 0.4, 1, 0.5);
	signal = LPF.ar(signal, 10500, 1, 1);
	signal = HPF.ar(signal, 80, 1, 1);

	signal = signal * envelope;
	signal = Compander.ar(signal, 0, 0.7, 1, 1, 0.02);
	Out.ar(out, signal * amplitude);
}).add;

kick_7_buffer = Buffer.read(s, "C:/Users/Nick/Desktop/Fax/Kompjuterski zvuk i muzika/Project/Code/Kicks/kick_sample_2.wav");
SynthDef.new(\kick_7, {
	arg attack=0.01, decay=0.2, release=0.6, c1=1, c2=(-1), amplitude=0.2, buffer=kick_7_buffer, out=0;
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

kick_8_buffer = Buffer.read(s, "C:/Users/Nick/Desktop/Fax/Kompjuterski zvuk i muzika/Project/Code/Kicks/kick_sample_3.wav");
SynthDef.new(\kick_8, {
	arg attack=0.01, release=0.6, c1=1, c2=(-1), amplitude=0.2, buffer=kick_8_buffer, out=0;
	var signal, envelope, freqSweep;
	envelope = Env([0,1,0], [attack, release], [c1,c2]).kr(2);

	signal = PlayBuf.ar(2, buffer) * 0.6;
	freqSweep = Env([300,70,10],[0.01,1.5],[1, (-6)]).ar;

	signal = signal * freqSweep * 2;
	signal = BRF.ar(signal, 500, 0.4, 1, 0.4);
	signal = BRF.ar(signal, 700, 0.7, 1, 0.8);
	signal = BRF.ar(signal, 900, 0.8, 1, 0.9);
	signal = BRF.ar(signal, 1000, 0.3, 1, 0.2);
	signal = BRF.ar(signal, 1300, 0.3, 1, 0.2);
	signal = BRF.ar(signal, 1500, 0.4, 1, 0.6);
	signal = BRF.ar(signal, 1800, 0.4, 1, 0.9);
	signal = BRF.ar(signal, 2000, 0.3, 1, 0.4);
	signal = BRF.ar(signal, 2500, 0.3, 1, 0.6);
	signal = BRF.ar(signal, 3000, 0.6, 1, 0.7);
	signal = BRF.ar(signal, 3000, 0.5, 1, 0.8);
	signal = BRF.ar(signal, 3500, 0.7, 1, 0.6);
	signal = BRF.ar(signal, 4500, 0.3, 1, 0.5);
	signal = BRF.ar(signal, 5000, 0.5, 1, 0.6);
	signal = BRF.ar(signal, 5500, 0.8, 1, 1);
	signal = BRF.ar(signal, 6000, 0.4, 1, 0.5);
	signal = BRF.ar(signal, 6000, 0.7, 1, 0.7);
	signal = BRF.ar(signal, 8000, 0.3, 1, 0.4);
	signal = BRF.ar(signal, 10000, 0.1, 1, 0.4);
	signal = LPF.ar(signal, 10500, 1, 1);
	signal = HPF.ar(signal, 80, 1, 1);

	signal = signal * envelope;
	signal = Compander.ar(signal, 0, 0.7, 1, 1, 0.1);
	Out.ar(out, signal * amplitude);
}).add;

SynthDef.new(\kick_808, {
	arg out = 0, freq1 = 300, freq2 = 10, amplitude = 1, attack = 0.001, decay = 10, release = 1, distortion = 0.5, pan = 0;
	var signal, envelope;
	signal = Ringz.ar(
		in: Impulse.ar(0), // single impulse
		freq: XLine.ar(freq1, freq2, 0.1),
		decaytime: decay);
	envelope = Env.perc(attack, release, amplitude).kr(doneAction: 2);
	signal = distortion * signal + (distortion * (signal.distort));
	signal = signal * envelope;
	Out.ar(0, Pan2.ar(signal, pan));
}).add;
)