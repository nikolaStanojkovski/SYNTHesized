s.boot;

s.meter;
s.freqscope;

(
SynthDef(\clap, {
	arg out = 0, amplitude = 0.6, pan = 0, attack = 0.005, release = 0.5, curve = -4, spreadRate = 75, minDelay = 0.025, maxDelay = 0.05, decay = 0.25, rq = 0.4, blend = 0.7, reverb = 0.1, size = 0.2, damp = 1;

	var envelope1, envelope2, signal, noise1, noise2, spread;

	spread = LFNoise1.kr(spreadRate).range(minDelay, maxDelay);

	envelope1 = Env.perc(attackTime: attack / 10, releaseTime: release / 8, curve: [0, curve]).kr;
	envelope1 = CombC.ar(in: envelope1, maxdelaytime: maxDelay, delaytime: spread, decaytime: decay);

	noise1 = GrayNoise.ar(envelope1);
	noise1 = RHPF.ar(in: noise1, freq: 1000, rq: rq);
	noise1 = BPF.ar(in: noise1, freq: 2500, rq: 3);

	envelope2 = Env.perc(attackTime: attack, releaseTime: release, curve: [0, curve]).kr;

	noise2 = GrayNoise.ar(envelope2);
	noise2 = RHPF.ar(in: noise2, freq: 1000, rq: rq);
	noise2 = BPF.ar(in: noise2, freq: 1600, rq: 0.9);

	signal = Mix.ar((blend * noise1) + ((1 - blend) * noise2));
	signal = (signal * 2).softclip;
	signal = FreeVerb.ar(in: signal, mix: reverb, room: size, damp: damp, mul: amplitude);

	DetectSilence.ar(in: signal, doneAction: 2);

	Out.ar(out, Pan2.ar(signal, pan));
}).add;
)

x = Synth.new(\clap);