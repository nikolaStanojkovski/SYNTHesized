s.boot;

///////////////////////
/////// Claps /////////
///////////////////////

(
SynthDef.new(\clap_1, {
	var oscilator, envelope, noise, signal;

	noise = BPF.ar(LPF.ar(GrayNoise.ar(1),7500),1500, 0.4);
	envelope = Line.ar(1, 0, 0.9, doneAction: 2);

	signal = {Mix.arFill(7,
		{arg i;
			EnvGen.ar(
				Env.new(
					[0,0,1,0],
					[0.01 * i,0,0.04]
				)
			) * noise * 0.5;
		}
	)};
	signal = (signal * envelope);
	signal = signal = FreeVerb.ar(signal, 0.1, 0.1, 0.5);
	signal = Pan2.ar(signal, 0, 1);

	Out.ar(0, signal);
}).add;

SynthDef(\clap_2, {
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

SynthDef.new(\clap_3, {
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
}).add;
)