s.boot;

(
SynthDef.new(\shaker, {
	arg out=0, attack = 0.1, decay = 0.11, sustain = 0.001, release = 0,
	curve = -1, attackLevel = 0.9, decayLevel = 0.1, sustainLevel = 0;
	var env, sig;

	env = EnvGen.kr(Env.new([0, attackLevel, decayLevel, sustainLevel],
		[attack, decay, sustain], [curve, curve, curve]), doneAction:2);

	sig = WhiteNoise.ar(0.25!2) * env;

	sig = HPF.ar(sig, 2000);


	Out.ar(out, sig);

}).add;
)

x = Synth.new(\shaker);

x.free;


