(
SynthDef (\plotSaw, {
	arg freq=200, amp=1, pan=0;
	var sig, amp2, temp, sig1, sig2, sig3, env;
	//env = EnvGen.kr(Env.new(
		//[0.00001, 2, 1, 1, 0.00000001],
		//[2, 1, 0.5, 1.5],
		//[0.5, 0.5, 0, -3]), doneAction: 2);
	 env = Env.perc(
		attackTime: 1,
		releaseTime: 2,
		level: amp,
		curve: -1
	).kr(doneAction: 2);
	sig1 = Saw.ar(freq) * env;
	sig2 = Saw.ar(freq+3) * env;
	sig2 = Pan2.ar(sig2*amp, pan);
	sig3 = Saw.ar(freq -3) * env;
	amp2 = amp-1;
	sig3 = Pan2.ar(sig3*amp2, pan);
	sig = Mix([sig1, sig2, sig3]);
	sig = Pan2.ar(sig * amp, pan);
	sig = RLPF.ar(sig, 600, 1);
	sig = RHPF.ar(sig, 800, 1);
	sig = FreeVerb.ar(sig, 0.3, 0.3);
	Out.ar(0, sig)
}).add;
)

a = Synth(\plotSaw, [\freq, 200, \amp,2, \pan, 0.5]);
t = TempoClock(93/60);

//Env.new([0.00001, 2, 1, 1, 0.00001], [3, 1.5, 1, 2.5], [0.5, 1.5, 0, -3]).plot;
(
Pbindef(\try,
	\instrument, \plotSaw,
	\dur, Pseq([1.5, 1, 1], inf),
	\freq, Pseq([440, 261, 330], inf),
	\amp, 1,
	\out, 0
).play
)
