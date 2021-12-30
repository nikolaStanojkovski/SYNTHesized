(
SynthDef(\syn, {
	arg out = 0, freq_1 = 65.4064;
	var signal_0 = SinOsc.ar(freq_1, 0.9, 0.9);
	var signal_2 = Saw.ar(freq_1, 0.3);
	var signal_2_LPF = RLPF.ar(signal_2, XLine.kr(5000, 300, 3), 0.5);
	var signal_3 = Saw.ar(freq_1 * 2, 0.4);
	var hpf_0 = HPF.ar(signal_2, XLine.kr(3000, 20, 0.3), 0.9);
	var lpf_1 = RLPF.ar(signal_2, XLine.kr(5000, 1220, 0.3), 0.5, 0.5);
	//var test = signal_0 + signal_2_LPF + signal_3 + hpf_0 + hpf_1;
	var final = signal_0 + signal_2_LPF + hpf_0 + lpf_1 + signal_3;
	var env = EnvGen.ar(Env.new([1,0.5,0.0], [0.2, 0.3], 'lin'));
	final = RLPF.ar(final, XLine.kr(5000, 700, 0.3), 0.7, 0.8);
	final = FreeVerb.ar(final, 0.33, 0.5, 0.4);
	final = final * env;
	Out.ar(out, final!2);
}).add;
)

~synth1 = Synth.new(\syn, [\out, 0]);