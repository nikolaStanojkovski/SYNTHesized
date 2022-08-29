s.boot;

(
SynthDef.new(\shaker, {
	arg out=0, attack = 0.09, decay = 0.10, release = 0.001,
	curve = -1, attackLevel = 0.9, decayLevel = 0.3, releaseLevel = 0,
	aRand, dRand, rRand, filtLow;
	
	var env, sig, filtHigh;
	
	attack = attack + aRand;
	decay = decay + dRand;
	release = release + rRand;
	filtHigh = filtLow + 100;

	env = EnvGen.kr(Env.new([0, attackLevel, decayLevel, releaseLevel],
		[attack, decay, release], [curve, curve, curve]), doneAction:2);

	sig = WhiteNoise.ar(0.25!2) * env;

	sig = HPF.ar(sig, filtLow);
	sig = LPF.ar(sig, filtHigh); 

	Out.ar(out, sig);

}).add;
)


x = Synth.new(\shaker, [\filtLow,rrand(2000, 2500), \arand, 0.001.rand,
	\dRand, 0.1.rand, \rRand, 0.11.rand]);

x.free;

s.makeWindow;

