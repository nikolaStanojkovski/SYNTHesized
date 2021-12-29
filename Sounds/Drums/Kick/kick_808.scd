s.boot;

s.meter;

Env([0, 1, 0], [1, 1], [1, -1]).plot;

(
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

x = Synth.new(\kick_808);