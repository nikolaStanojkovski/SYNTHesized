s.boot;

(
SynthDef.new(\cowbell, {
	arg out=0, attack = 0.0005, decay = 0.07, sustain = 0.01, release = 0.01,
	curve = -1, attackLevel = 0.8, decayLevel = 0.2, sustainLevel = 0.1, releaseLevel = 0;
	var env, sig, noise;

	env = EnvGen.kr(Env.new([0, attackLevel, decayLevel, sustainLevel, releaseLevel],
		[attack, decay, sustain, release], [curve, curve, curve, curve]), doneAction:2);

	sig = Saw.ar([440, 865]) * env;


	noise = PinkNoise.ar(0.25) * 0.2;


	noise = HPF.ar(noise, 420);

	noise = LPF.ar(noise, 900);


	sig = Mix.new([sig, noise])!2;
	
	sig = FreeVerb.ar(sig, mix: 0.4, room:0.4, mul:0.8);

	Out.ar(out, sig);

}).add;
)

x = Synth.new(\cowbell);

x.free;

s.makeWindow;
