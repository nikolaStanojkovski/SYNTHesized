s.boot;

s.meter;
s.freqscope;

(
SynthDef.new(\snare, {
	arg amplitude = 1.4, rq = 3, attack = 0.01, release = 0.3, curve = -7, pan = 0, out = 0;

	var signal, envelope;

	envelope = Env.perc(attackTime: attack, releaseTime: release, curve: curve).ar;

	signal = HPF.ar(PinkNoise.ar(amplitude), 500, 0.3, 0.4);

	signal = BPF.ar(signal, 2500, rq, envelope * rq * 3);

	signal = FreeVerb.ar(Limiter.ar(signal), 0.4, 0.3);
	signal = signal.softclip * amplitude;

	Out.ar(out, Pan2.ar(signal, pan));
}).add;
)

x = Synth.new(\snare);
