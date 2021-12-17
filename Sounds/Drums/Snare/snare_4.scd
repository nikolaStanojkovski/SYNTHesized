s.boot;

s.meter;
s.freqscope;

(
SynthDef.new(\snare, {
	arg out = 0, amplitude = 0.3, pan = 0, attack = 0.05, decay = 0.03, release = 0.1, curve = -6, preAmplitude = 1.2, harmonic = 1.2, oscsHarmonic = 1.6, blend = 0.333, oscsAmplitude = 1, noiseRatio = 0.4, noiseBottom = 200, noisePeak = 5300, rq = 0.7, noiseamplitude = 1;

	var envOscs, envSweep, envNoise, oscs, noise, signal;

	envOscs = Env.new(
		            levels: [0.5, 1, 0.5, 0] * oscsAmplitude,
		            times: [(attack * 0.1), decay, release],
		            curve: [1, 0.5, 1] * curve).kr;
	envSweep = Env.new(
		            levels: [33.81, 1.88, 1] * 140,
		            times: [(attack * 0.1), release],
		            curve: [1, 1.25] * curve).kr;
	envNoise = Env.new(
		            levels: [1, noiseRatio, 0] * noiseamplitude,
		            times: [attack, (decay + release)],
		            curve: [0.5, 0.5] * curve).kr(doneAction: 2);

	oscs = LFPulse.ar(freq: [envSweep, envSweep * oscsHarmonic], width: [0.5, 0.5], mul: [1 - blend, blend], add: [-0.5, -0.25]);
	oscs = LPF.ar(in: oscs, freq: envSweep * harmonic, mul: envOscs * 1.5);
	oscs = oscs + SinOsc.ar(freq: envSweep, phase: pi/4, mul: envOscs);

	noise = WhiteNoise.ar(1, 0.7);
	noise = HPF.ar(in: noise, freq: noiseBottom);
	noise = noise + BPF.ar(in: noise, freq: noisePeak, rq: rq, mul: 4);
	noise = noise * envNoise;

	signal = Mix.ar(oscs + noise) * preAmplitude;
	signal = signal.clip2(1) * amplitude;
	signal = FreeVerb.ar(Limiter.ar(signal), 0.3, 0.6, 0.5);

	Out.ar(out, Pan2.ar(signal, pan));
}).add;
)

x = Synth.new(\snare);