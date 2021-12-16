s.boot;

s.meter;
s.freqscope;

(
SynthDef.new(\snare, {
	arg out = 0, amplitude = 0.3, attack = 0.01, release = 0.25, pan = 0;
	var noise, signal, envelope;

	noise = WhiteNoise.ar(amplitude);
	signal = SinOsc.ar(180,0,amplitude);
	envelope = Env.perc(attack, release).kr;

	signal = HPF.ar(signal, 1800) + noise;
	signal = signal * envelope;
	signal = FreeVerb.ar(signal);

	Out.ar(out, Pan2.ar(signal, pan));
}).add;
)

x = Synth.new(\snare);