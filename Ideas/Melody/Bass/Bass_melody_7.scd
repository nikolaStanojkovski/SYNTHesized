// DO NOT EXPORT
(
SynthDef(\syn, {
	arg out = 0, freq_1 = 65.4064, release1 = 0.2, release2 = 0;
	var signal_0 = SinOsc.ar(freq_1, 0.9, 0.9);
	var signal_2 = Saw.ar(freq_1, 0.2);
	var signal_2_LPF = RLPF.ar(signal_2, XLine.kr(5000, 300, 3), 0.3);
	var signal_3 = Saw.ar(freq_1, 0.1);
	var hpf_0 = HPF.ar(signal_2, XLine.kr(3000, 20, 0.3), 0.9);
	var lpf_1 = RLPF.ar(signal_2, XLine.kr(5000, 1220, 2), 0.5, 0.5);
	var final = signal_0 + signal_2_LPF + hpf_0 + lpf_1 + signal_3;
	var env = EnvGen.ar(Env.new([1,0.0,0.0], [release2], 'lin'));
	final = RLPF.ar(final, XLine.kr(10000, 300, 0.5), 0.4, 0.6);
	final = FreeVerb.ar(final, 0.23, 0.5, 0.5);
	final = final * env;
	Out.ar(out, final!2);
}).add;
)

~synth1 = Synth(\syn, [\out, 0]);

TempoClock.default.tempo = 93/60;
(
Pbindef(\test,
	\instrument, \syn,
	\dur, Pseq([0.15, 1.15, 0.15, 1.15, 0.15, 1.15, 0.15, 1.15, 0.15, 1.15, 0.15, 1.15, 0.15, 1.15, 0.15, 0.8, 0.3], inf),
	\freq_1, Pseq([73.416, 73.416, 73.416, 73.416, 58.270, 58.270, 65.406, 65.406, 73.416, 73.416, 73.416, 73.416, 58.270, 58.270, 65.406, 65.406, 87.307], inf),
	\release2, Pseq([0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.3], inf),
	\out, 0
).play
)