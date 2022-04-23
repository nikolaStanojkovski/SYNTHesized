(
SynthDef(\syn, {
	arg out = 0, freq_1 = 65.4064, release1 = 0.2, release2 = 0;
	var signal_0 = SinOsc.ar(freq_1, 0.9, 0.9);
	var signal_2 = Saw.ar(freq_1, 0.3);
	var signal_2_LPF = RLPF.ar(signal_2, XLine.kr(5000, 300, 3), 0.3);
	var signal_3 = Saw.ar(freq_1, 0.1);
	var hpf_0 = HPF.ar(signal_2, XLine.kr(3000, 20, 0.3), 0.9);
	var lpf_1 = RLPF.ar(signal_2, XLine.kr(5000, 1220, 2), 0.5, 0.5);
	var final = signal_0 + signal_2_LPF + hpf_0 + lpf_1 + signal_3;
	var env = EnvGen.ar(Env.new([1,0.0,0.0], [0.6, 0.1], 'lin'));
	final = RLPF.ar(final, XLine.kr(10000, 300, 0.5), 0.4, 0.6);
	final = FreeVerb.ar(final, 0.23, 0.5, 0.5);
	final = final * env;
	Out.ar(out, final!2);
}).add;
)

~synth1 = Synth(\syn, [\out, 0]);

// melody 1
TempoClock.default.tempo = 93/60;
(
Pbindef(\test,
	\instrument, \syn,
	\dur, Pseq([1/2], inf),
	\freq_1, Pseq([69.30, 69.30, 69.30, 69.30, 69.30, 69.30, 69.30, 69.30, 69.30, 69.30, 77.78, 77.78, 77.78, 77.78, 77.78, 77.78, 87.31, 87.31, 87.31, 87.31, 87.31, 87.31, 87.31, 87.31, 77.78, 77.78, 77.78, 77.78, 77.78, 77.78, 77.78, 77.78], inf),
	\release2, Pseq([0.1], inf),
	\out, 0
).play
)

// melody 2
TempoClock.default.tempo = 93/60;
(
Pbindef(\test,
	\instrument, \syn,
	\dur, Pseq([1/2], inf),
	\freq_1, Pseq([34.65, 34.65, 34.65, 34.65, 34.65, 34.65, 34.65, 34.65, 34.65, 34.65, 38.89, 38.89, 38.89, 38.89, 38.89, 38.89, 43.65, 43.65, 43.65, 43.65, 43.65, 43.65, 43.65, 43.65, 38.89, 38.89, 38.89, 38.89, 38.89, 38.89, 38.89, 38.89], inf),
	\release2, Pseq([0.1], inf),
	\out, 0
).play
)