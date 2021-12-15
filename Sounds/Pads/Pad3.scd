(
SynthDef (\pad3, {|freq, amp, dur|
	var sig, sig1, sig2, sig3, env, filterEnv, filterLFO;
	env = Env([0, 1.5, 1, 1, 0], [0.6, 0.5, dur, 4], \sin).kr(doneAction: 2);
	filterEnv = Env([0, 1.5, 1, 0.1], [1, dur, 4], \sin).kr(doneAction: 2);
	filterLFO = SinOsc.ar(0.25, 0, 100);
	sig1 = Pan2.ar(SinOsc.ar((freq - 2) + SinOsc.kr(5, mul: 3), 0.4), -1) * env;
	sig2 = Pan2.ar(SinOsc.ar((freq + 2) + SinOsc.kr(5, mul: 3), 0.4), 1) * env;
	sig3 = SinOsc.ar((freq * 1.2) + SinOsc.kr(5, mul: 3), 0.4) * env;
	sig = Mix([sig1, sig2, sig3]);
	sig = RLPF.ar(sig, (700 + filterLFO) * filterEnv, 0.4, 0.1);
	sig = FreeVerb.ar(sig, 0.7, 0.7);
	Out.ar(0, sig * amp);
}).add;
)

a = Synth.new(\pad3, [\freq, 120, \amp, 3, \dur, 1]);
