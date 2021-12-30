(
SynthDef(\syn, {
	arg out = 0, freq_1 = 43.6535, freq_2 = 130.813;
	var signal_0 = SinOsc.ar(freq_1, 0.8, 0.8);
	var signal_1 = Pulse.ar(freq_1, 0.8, 0.3);
	var signal_1_LPF = RLPF.ar(signal_1, XLine.kr(5000, 300, 3), 0.8);
	var signal_2 = Saw.ar(freq_2, 0.5);
	var signal_3 = Saw.ar(freq_2 * 1.005, 0.5);
	var hpf_0 = HPF.ar(signal_2, XLine.kr(5000, 20, 1), 0.9);
	var hpf_1 = RLPF.ar(signal_2, XLine.kr(5000, 1220, 2), 0.5, 0.5);
	var test = hpf_0;
	var final = signal_0 + signal_1_LPF + hpf_0 + hpf_1 + signal_3;
	var env = EnvGen.ar(Env.new([1,0.5,0], [1.5, 4], 'lin'));
	final = RLPF.ar(final, XLine.kr(10000, 1000, 2.5), 0.2);
	final = FreeVerb.ar(final, 0.33, 0.5, 0.5);
	final = final * env;
	Out.ar(out, final!2);
}).add;
)

~synth1 = Synth.new(\syn, [\out, 0]);