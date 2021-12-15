//Env.new([0.00001, 1, 0.5, 0.5, 0.00001], [3.5, 2, 2.5, 2], [2, -3, 0, -3]).plot;

(SynthDef.new(\pad, {
	arg atk=5, freq1 = 220, freq2 = 90;
	var env, sig, sig2, sig3;
	env = EnvGen.kr(Env.new(
		[0.00001, atk, atk-2, atk-2.5, 0.00000001],
		[3, 1.5, 0.5, 2],
		[0.5, 1.5, 0, -0.5]), doneAction: 2);
	sig = SinOsc.ar(freq1);
	sig2 = FSinOsc.ar(freq2);
	sig3 = Mix.ar([sig, sig2]);
	Out.ar(0, sig3 * env);
	Out.ar(1, sig3 * env);
}
).add;)

a = Synth.new(\pad);
