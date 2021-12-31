s.boot;

(
SynthDef.new(\hiHat, {
	arg out=0, attack = 0.0001, decay = 0.035, sustain = 0.01, release = 0.01,
	curve = -1, attackLevel = 0.9, decayLevel = 0.2, sustainLevel = 0.1, releaseLevel = 0.0;
	var env, sig;

	env = EnvGen.kr(Env.new([0, attackLevel, decayLevel, sustainLevel, releaseLevel],
		[attack, decay, sustain, release], [curve, curve, curve, curve]), doneAction:2);

	sig = WhiteNoise.ar(0.25!2) * env;

	sig = HPF.ar(sig, 4000);

	sig = LPF.ar(sig, 4300);

	sig = FreeVerb.ar(sig, mix: 0.2, room:0.3);


	Out.ar(out, sig);

}).add;
)

x = Synth.new(\hiHat);

s.makeWindow;

x.free;
