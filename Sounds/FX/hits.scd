(
SynthDef(\hit_1, {
	arg amp = 1.5, freq = 2000, rq = 3, att = 0.01, dec = 2, curve = -6, pan = 0, out = 0;

	var signal, envelope;

	envelope = Env.perc(attackTime: att, releaseTime: dec, curve: curve).kr(doneAction: 2);

	signal = PinkNoise.ar(amp);
	signal = BPF.ar(signal, freq, rq, envelope * rq.reciprocal * 2);
	signal = Limiter.ar(signal);
	signal = FreeVerb.ar(signal, 0.6, 0.4);

	Out.ar(out, Pan2.ar(signal, pan));
}).add;

SynthDef(\hit_2, {
	arg amp = 1.5, freq = 500, rq = 3, att = 0.01, dec = 2.5, curve = -6, pan = 0, out = 0;

	var signal, envelope;

	envelope = Env.perc(attackTime: att, releaseTime: dec, curve: curve).kr(doneAction: 2);

	signal = PinkNoise.ar(amp);
	signal = BPF.ar(signal, freq, rq, envelope * rq.reciprocal * 2);
	signal = Limiter.ar(signal);
	signal = FreeVerb.ar(signal, 0.4, 0.6);

	Out.ar(out, Pan2.ar(signal, pan));
}).add;

SynthDef(\hit_3, {
	arg amp = 0.2, freq = 4000, rq = 3, att = 0.01, dec = 3, curve = -6, pan = 0, out = 0;

	var signal, envelope;

	envelope = Env.perc(attackTime: att, releaseTime: dec, curve: curve).kr(doneAction: 2);

	signal = WhiteNoise.ar(amp);
	signal = BPF.ar(signal, freq, rq, envelope * rq.reciprocal * 2);
	signal = LPF.ar(signal, 12000);
	signal = Limiter.ar(signal);
	signal = FreeVerb.ar(signal, 0.3, 0.4);

	Out.ar(out, Pan2.ar(signal, pan));
}).add;

SynthDef(\hit_4, {
	arg amp = 0.2, freq = 2000, rq = 3, att = 0.01, dec = 3, curve = -6, pan = 0, out = 0;

	var signal, envelope;

	envelope = Env.perc(attackTime: att, releaseTime: dec, curve: curve).kr(doneAction: 2);

	signal = WhiteNoise.ar(amp);
	signal = BPF.ar(signal, freq, rq, envelope * rq.reciprocal * 2);
	signal = HPF.ar(signal, 500);
	signal = LPF.ar(signal, 7000);
	signal = Limiter.ar(signal);
	signal = FreeVerb.ar(signal, 0.3, 0.4);

	Out.ar(out, Pan2.ar(signal, pan));
}).add;

SynthDef(\hit_5, {
	arg amp = 0.2, freq = 2500, rq = 3, att = 0.01, dec = 3, curve = -6, pan = 0, out = 0;

	var signal, envelope;

	envelope = Env.perc(attackTime: att, releaseTime: dec, curve: curve).kr(doneAction: 2);

	signal = WhiteNoise.ar(amp) + PinkNoise.ar(amp);
	signal = BPF.ar(signal, freq, rq, envelope * rq.reciprocal * 2);
	signal = HPF.ar(signal, 1000);
	signal = LPF.ar(signal, 15000);
	signal = Limiter.ar(signal);
	signal = FreeVerb.ar(signal, 0.5, 0.7);

	Out.ar(out, Pan2.ar(signal, pan));
}).add;
)

x = Synth.new(\hit_1);
y = Synth.new(\hit_2);
z = Synth.new(\hit_3);
t = Synth.new(\hit_4);
h = Synth.new(\hit_5);