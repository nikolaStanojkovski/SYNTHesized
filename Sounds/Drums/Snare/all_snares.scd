s.boot;


///////////////////////
/////// Snares ////////
///////////////////////

(
var snare_6_buffer, snare_7_buffer;

SynthDef.new(\snare_1, {
	arg amplitude = 1.4, rq = 3, attack = 0.01, release = 0.3, curve = -7, pan = 0, out = 0;

	var signal, envelope;

	envelope = Env.perc(attackTime: attack, releaseTime: release, curve: curve).ar;

	signal = HPF.ar(PinkNoise.ar(amplitude), 500, 0.3, 0.4);

	signal = BPF.ar(signal, 2500, rq, envelope * rq * 3);

	signal = FreeVerb.ar(Limiter.ar(signal), 0.4, 0.3);
	signal = signal.softclip * amplitude;

	Out.ar(out, Pan2.ar(signal, pan));
}).add;

SynthDef.new(\snare_2, {
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

SynthDef.new(\snare_3, {
	arg out = 0, amplitude = 0.3, pan = 0, attack = 0.05, decay = 0.03, release = 0.1, curve = -6, preAmplitude = 1.2, harmonic = 1.2, oscsHarmonic = 1.6, blend = 0.333, oscsAmplitude = 1, noiseRatio = 0.4, noiseBottom = 200, noisePeak = 6900, rq = 0.6, noiseamplitude = 1;

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

	noise = WhiteNoise.ar(1/3);
	noise = HPF.ar(in: noise, freq: noiseBottom);
	noise = noise + BPF.ar(in: noise, freq: noisePeak, rq: rq, mul: 3);
	noise = noise * envNoise;

	signal = Mix.ar(oscs + noise) * preAmplitude;
	signal = signal.clip2(1) * amplitude;

	Out.ar(out, Pan2.ar(signal, pan));
}).add;

SynthDef.new(\snare_4, {
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

SynthDef.new(\snare_5, {
	arg out = 0, amplitude = 0.4, pan = 0, attack = 0.01, decay = 0.01, release = 0.35, curve = -6, preAmplitude = 1.2, harmonic = 1.6, oscsHarmonic = 2.5, blend = 0.333, oscsAmplitude = 1, noiseRatio = 0.4, noiseBottom = 200, noisePeak = 5300, rq = 0.8, noiseamplitude = 1;

	var envOscs, envSweep, envNoise, oscs, noise, signal;

	envOscs = Env.new(
		            levels: [0.2, 1, 0.2, 0] * oscsAmplitude,
		            times: [(attack * 0.1), decay, 0.3],
		            curve: [1, 0.5, 1] * curve).kr;
	envSweep = Env.new(
		            levels: [33.81, 1.88, 1] * 140,
		            times: [(attack * 0.1), release],
		            curve: [1, 1.25] * curve).kr;
	envNoise = Env.new(
		            levels: [1, noiseRatio, 0] * noiseamplitude,
		            times: [attack, (decay + release)],
		            curve: [0.75, 0.75] * curve).kr(doneAction: 2);

	oscs = LFPulse.ar(freq: [envSweep, envSweep * oscsHarmonic], width: [0.8, 0.8], mul: [1 - blend, blend], add: [-0.5, -0.25]);
	oscs = LPF.ar(in: oscs, freq: envSweep * harmonic, mul: envOscs * 1.5);
	oscs = oscs + SinOsc.ar(freq: envSweep, phase: pi/4, mul: envOscs);

	noise = WhiteNoise.ar(1, 0.3);
	noise = HPF.ar(in: noise, freq: noiseBottom);
	noise = noise + BPF.ar(in: noise, freq: noisePeak, rq: rq, mul: 5);
	noise = noise * envNoise;

	signal = Mix.ar(oscs + noise) * preAmplitude;
	signal = signal.clip2(1) * amplitude;
	signal = FreeVerb.ar(Limiter.ar(signal), 0.2, 0.6, 0.5);

	Out.ar(out, Pan2.ar(signal, pan));
}).add;

snare_6_buffer = Buffer.read(s, "C:/Users/Nick/Desktop/Fax/Kompjuterski zvuk i muzika/Project/Code/Snares/snare_sample_1.wav");
SynthDef.new(\snare_6, {
	arg attack=0.01, release=2, c1=1, c2=(-1), amplitude=1, buffer=snare_6_buffer, out=0;
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

snare_7_buffer = Buffer.read(s, "C:/Users/Nick/Desktop/Fax/Kompjuterski zvuk i muzika/Project/Code/Snares/snare_sample_2.wav");
SynthDef.new(\snare_7, {
	arg attack=0.01, release=2, c1=1, c2=(-1), amplitude=0.5, buffer=snare_7_buffer, out=0;
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
