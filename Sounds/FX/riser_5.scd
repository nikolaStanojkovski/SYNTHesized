(
SynthDef(\riser_5, {
	arg out = 0, pan = 0, freq = 698.46, amplitude = 0.4, attack = 2, release = 0.5, gate = 1, vibratoRate = 4, vibratoDepth = 0.015, tremoloRate = 5, tremoloDepth = 0.5, reverbMix = 0.2, roomSize = 1, damp = 0.5;

	var envelope, sound, vibrato, tremolo, mod2, mod3;

	envelope = Env.perc(attack, release).kr(gate: gate);
	vibrato = SinOsc.kr(vibratoRate).range(freq * (1 - vibratoDepth), freq * (1 + vibratoDepth));
	tremolo = LFNoise2.kr(1).range(0.2, 1) * SinOsc.kr(tremoloRate).range((1 - tremoloDepth), 1);

	sound = SinOsc.ar(freq: [freq, vibrato], mul:(envelope * tremolo * amplitude)).distort;
	sound = Mix.ar([sound]);
	sound = FreeVerb.ar(sound, reverbMix, roomSize, damp);

	Out.ar(out, Pan2.ar(sound, pan));
}).add
)

x = Synth.new(\riser_5);