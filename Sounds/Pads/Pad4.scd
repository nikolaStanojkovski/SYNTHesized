(
SynthDef (\plotNew, {
	arg freq=200, amp=1, pan=0;
	var sig, temp, sig1, sig2, sig3, sig4, env;
	env = EnvGen.kr(Env.new(
		[0.00001, 3, 1, 1, 0.00000001],
		[3, 1.5, 0.5, 2.5],
		[0.5, 0.5, 0, -3]), doneAction: 2);
	sig1 = SinOsc.ar(freq) * env;
	sig2 = SinOsc.ar(freq * 2) * env;
	sig3 = SinOsc.ar(freq * 0.5) * env;
	sig4 = SinOsc.ar(freq * 3) * env * 0.3;
	sig = Mix([sig1, sig2, sig3, sig4]);
	sig = Pan2.ar(sig * amp, pan);
	sig = RLPF.ar(sig, 600, 1);
	sig = RHPF.ar(sig, 700, 1);
	sig = FreeVerb.ar(sig, 0.25, 0.7);
	Out.ar(0, sig)
}).add;
)

a = Synth(\plotNew, [\freq, 100, \amp, 6, \pan, 0.5]);

//Env.new([0.00001, 2, 1, 1, 0.00001], [3, 1.5, 1, 2.5], [0.5, 1.5, 0, -3]).plot;