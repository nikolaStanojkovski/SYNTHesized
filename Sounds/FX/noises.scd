s.boot;

s.meter;

(
SynthDef(\noise_1, {
	arg out = 0, freq_1 = 349.23, freq_2 = 698.46, amplitude = 0.3, pan = 0, attack = 2.5, release = 2.5;
	var signal, envelope;
	envelope = Env.perc(attack, release).ar;
	signal = Mix(Saw.ar(freq_1, amplitude), SinOsc.ar(freq_2, amplitude));
	signal = BRF.ar(signal, 500, 0.3, 1, 0.4);
	signal = signal * envelope;
	Out.ar(out, Pan2.ar(signal, pan));
}).add;

SynthDef(\noise_2, {
	arg out = 0, freq = 698.46, amplitude = 0.5, pan = 0, attack = 2.5, release = 2.5;
	var signal, envelope;
	envelope = Env.perc(attack, release).ar;
	signal = Mix(Saw.ar(freq, amplitude));
	signal = BRF.ar(signal, 1000, 0.3, 1, 0.4);
	signal = LPF.ar(signal, 10000, 0.3, 1, 0.4);
	signal = signal * envelope;
	Out.ar(out, Pan2.ar(signal, pan));
}).add;

SynthDef(\noise_3, {
	arg out = 0, freq = 349.23, amplitude = 0.5, pan = 0, attack = 2.5, release = 2.5;
	var signal, envelope;
	envelope = Env.perc(attack, release).ar;
	signal = Mix(LFTri.ar(freq, amplitude));
	signal = BRF.ar(signal, 2000, 0.3, 1, 0.4);
	signal = LPF.ar(signal, 15000, 0.3, 1, 0.7);
	signal = signal * envelope;
	Out.ar(out, Pan2.ar(signal, pan));
}).add;

SynthDef(\noise_4, {
	arg out = 0, freq = 1396.92, amplitude = 0.4, pan = 0, attack = 2.5, release = 2.5;
	var signal, envelope;
	envelope = Env.perc(attack, release).ar;
	signal = Mix(LFTri.ar(freq, amplitude));
	signal = BRF.ar(signal, 2000, 0.3, 1, 0.4);
	signal = LPF.ar(signal, 12000, 0.3, 1, 0.7);
	signal = signal * envelope;
	Out.ar(out, Pan2.ar(signal, pan));
}).add;

SynthDef(\noise_5, {
	arg out = 0, freq_1 = 698.46, freq_2 = 1396.92, freq_3 = 349.23, amplitude = 0.3, pan = 0, attack = 2.5, release = 2.5;
	var signal, envelope;
	envelope = Env.perc(attack, release).ar;
	signal = Mix([Saw.ar(freq_1, amplitude), Saw.ar(freq_3, amplitude), LFTri.ar(freq_2, amplitude)]);
	signal = BRF.ar(signal, 1000, 0.3, 1, 0.4);
	signal = LPF.ar(signal, 15000, 0.3, 1, 0.7);
	signal = signal * envelope;
	Out.ar(out, Pan2.ar(signal, pan));
}).add;

SynthDef(\noise_6, {
	arg freqFirst=20,freqSecond=349.23,freqThird=698.46,freqFourth=349.23,freqFifth=20,freqDur1=1,freqDur2=3,freqC1=4,freqC2=(-3),atack=4,release=4,c1=1,c2=(-5),amplitude=0.3,pan=0,out=0;
	var signal,envelope,freqSweep,mixA,mixB;

	freqSweep = Env([freqFirst,freqSecond,freqThird,freqFourth,freqFifth],[freqDur1,freqDur2],[freqC1, freqC2]).ar;
	envelope = Env([0,1,0],[atack, release],[c1, c2]).kr(10);

	mixA = [SinOsc.ar(freqSweep, pi/2), PMOsc.ar(freqSweep, pi*2)];
	mixB = [LFTri.ar(freqSweep, pi/2), FSinOsc.ar(freqSweep, pi/2)];

	signal = Mix([mixA, mixB*0.2]);
	signal = signal*envelope;
	signal = Pan2.ar(signal, pan, amplitude);

	Out.ar(out, signal);
}).add;

SynthDef(\noise_7, {
	arg freqFirst=20,freqSecond=698.46,freqThird=1396.92,freqTop=5587.68,freqFourth=349.23,freqFifth=20,freqDur1=1,freqDur2=3,freqC1=4,freqC2=(-3),atack=5,release=5,sustain=4, c1=1,c2=(-5),amplitude=0.3,pan=0,out=0;
	var signal,envelope,freqSweep,mixA,mixB,mixC;

	freqSweep = Env([freqFirst,freqSecond,freqThird,freqTop,freqFourth,freqFifth],[freqDur1,freqDur2],[freqC1, freqC2]).ar;
	envelope = Env([0,1,0],[atack, release, sustain: sustain],[c1, c2]).kr(10);

	mixA = [LFNoise2.ar(freqSweep, pi/2)];
	mixB = [LFNoise2.ar(freqSweep, pi/2)];
	mixB = LPF.ar(mixB, 13000, 0.7);
	mixB = HPF.ar(mixB, 2000, 0.7);
	mixC = LFNoise2.ar(freqSweep, 0.5);

	signal = Mix([mixA, mixB, mixC]);
	signal = signal*envelope;
	signal = Pan2.ar(signal, pan, amplitude);

	Out.ar(out, signal);
}).add;

SynthDef(\noise_8, {
	arg out = 0, amp = 1, dur = 6;
	var snd = WhiteNoise.ar();
	var line = XLine.kr(200, 15000, dur);
	var ampenv = Env.new([0, 2, 5, 2, 0], [0, dur+0.05, 3, 4], curve:['lin', 'lin', 'exp', 'lin']);
	ampenv = EnvGen.kr(ampenv, doneAction:2);
	snd = RLPF.ar(snd, line, 0.4);
	snd = HPF.ar(snd, 400);
	Out.ar(out, amp * ampenv * Pan2.ar(snd, 0, 0.1));
}).add;

SynthDef(\noise_8_reverse, {
	arg out = 0, amp = 1, dur = 6;
	var snd = WhiteNoise.ar();
	var line = XLine.kr(15000, 200, dur);
	var ampenv = Env.new([0, 2, 5, 2, 0], [0, dur+0.05, 3, 4], curve:['lin', 'lin', 'exp', 'lin']);
	ampenv = EnvGen.kr(ampenv, doneAction:2);
	snd = RLPF.ar(snd, line, 0.4);
	snd = HPF.ar(snd, 400);
	Out.ar(out, amp * ampenv * Pan2.ar(snd, 0, 0.1));
}).add;
)

x = Synth.new(\noise_1);
y = Synth.new(\noise_2);
z = Synth.new(\noise_3);
c = Synth.new(\noise_4);
k = Synth.new(\noise_5);
h = Synth.new(\noise_6);
l = Synth.new(\noise_7);
n = Synth.new(\noise_8);
r = Synth.new(\noise_8_reverse);