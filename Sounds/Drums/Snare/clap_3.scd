s.boot;

s.meter;
s.freqscope;

(
SynthDef.new(\clap, {
	arg out = 0, amplitude = 0.4, pan = 0;
	var envelope1, envelope2, signal, noise1, noise2;

	envelope1 = Env.new(
		levels: [0, 1, 0, 1, 0, 1, 0, 1, 0],
		times: [0.001, 0.013, 0, 0.01, 0, 0.01, 0, 0.03],
		curve: [0, -3, 0, -3, 0, -3, 0, -4]
	).ar;
	envelope2 = Env.new(
		levels: [0, 1, 0],
		times: [0.02, 0.3],
		curve: [0, -4]
	).ar(doneAction: 2);

	noise1 = WhiteNoise.ar(envelope1);
	noise1 = HPF.ar(noise1, 600);
	noise1 = BPF.ar(noise1, 2000, 2.5);

	noise2 = WhiteNoise.ar(envelope2);
	noise2 = HPF.ar(noise2, 1000);
	noise2 = BPF.ar(noise2, 1200, 0.7, 0.7);

	signal = noise1 + noise2;
	signal = signal * 1.5;
	signal = signal.softclip * amplitude;

	Out.ar(out, Pan2.ar(signal, pan));
}
).add;
)

x = Synth.new(\clap);