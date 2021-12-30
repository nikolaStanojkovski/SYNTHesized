(
SynthDef(\syn, {
	arg out = 0;
	var signal_1 = Pulse.ar(43, 0.2, 0.6)!2;
	var signal_2 = Saw.ar(130, 0.3);
	var final = signal_1 + signal_2;
	var env = EnvGen.ar(Env.new([1,0.5,0], [1.5, 2], 'lin'));
	final = RLPF.ar(final, XLine.kr(10000, 1220, 2), 0.25);
	final = FreeVerb.ar(final, 0.3, 0.7, 0.9);
	final = final * env;
	Out.ar(out, final);
}).add;
)

~synth1 = Synth.new(\syn, [\out, 0]);