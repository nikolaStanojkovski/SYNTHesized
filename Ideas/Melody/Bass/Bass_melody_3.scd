(
SynthDef(\syn, {
	arg out = 0, freq_1 = 43.6535, release1 = 0.5, release2 = 0;
	var signal_0 = SinOsc.ar(freq_1, 0.8, 0.3);
	var signal_1 = Pulse.ar(freq_1, 0.6, 0.8);
	var signal_1_LPF = RLPF.ar(signal_1, XLine.kr(5000, 300, 3), 0.8);
	// var signal_2 = Saw.ar(freq_2, 0.2);
	// var signal_3 = Saw.ar(freq_2 * 1.005, 0.2);
	// var hpf_0 = HPF.ar(signal_2, XLine.kr(5000, 20, 1), 0.9);
	// var hpf_1 = RLPF.ar(signal_2, XLine.kr(5000, 1220, 2), 0.5, 0.5);
	var final = signal_0 + signal_1_LPF;
	var env = EnvGen.ar(Env.new([1,0.5,0], [release1, release2], 'lin'));
	final = RLPF.ar(final, XLine.kr(10000, 600, 2.5), 0.2);
	final = FreeVerb.ar(final, 0.33, 0.5, 0.5);
	final = final * env;
	Out.ar(out, final!2);
}).add;
)

~synth1 = Synth.new(\syn, [\out, 0]);

TempoClock.default.tempo = 186/60;
(
Pbindef(\test,
	\instrument, \syn,
	\dur, Pseq([1.5,2,2,1,0.5,1], inf),
	\freq_1, Pseq([174.614, 261.62, 233.08, 207.65, 195.998, 155.564], inf),
	// \freq_2, Pseq([523.26, 392.00, 784.00, 311.13, 622.26, 466.16], inf),
	\release2, Pseq([0.6, 0.8, 0.7, 0.4, 0.4, 0.4], inf),
	\out, 0
).play
)
