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
)

x = Synth.new(\noise_1);
y = Synth.new(\noise_2);
z = Synth.new(\noise_3);
c = Synth.new(\noise_4);
k = Synth.new(\noise_5);