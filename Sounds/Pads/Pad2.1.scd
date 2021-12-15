//Env.new([0.00001, 1, 0.5, 0.5, 0.00001], [3.5, 2, 2.5, 2], [2, -3, 0, -3]).plot;

(SynthDef.new(\pad, {
	arg atk=5, freq1 = 150, freq2 = 120;
	var env, envNoise, sig, sig2, sig3, noise;
	env = EnvGen.kr(Env.new(
		[0.00001, atk, atk-2, atk-2.5, 0.00000001],
		[3, 1.5, 0.5, 2],
		[0.5, 1.5, 0, -0.5]), doneAction: 2);
	envNoise = EnvGen.kr(Env.new(
		[0.00001, atk-1, atk-3, atk-3, 0.00000001],
		[3, 1.5, 0.5, 2],
		[0.5, 1.5, 0, -0.5]), doneAction: 2);
	sig = SinOsc.ar(freq1);
	sig2 = FSinOsc.ar(freq2, 0, 0.02, 0);
	sig3 = Mix.ar([sig, sig2]);
	sig3 = RLPF.ar(sig3, 4000, 1);
	sig3 = RHPF.ar(sig3, 250, 1);
	noise = PinkNoise.ar(0.01, 2) * envNoise;
	noise = RLPF.ar(noise, 4000, 1);
	noise = RHPF.ar(noise, 250, 1);
	//sig3 = Mix.ar([sig3, noise]);
	sig3 = FreeVerb.ar(sig3, 0.3, 0.5, 0.7);
	Out.ar(0, sig3 * env);
	Out.ar(1, sig3 * env);
}
).add;)

a = Synth.new(\pad);


