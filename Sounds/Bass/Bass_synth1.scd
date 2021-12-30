(
SynthDef(\syn1, {
	|out = 0, freq = 100, sustain = 1.2, amp = 0.5|
	var signal = Saw.ar(freq, 0.3, 0.1);
	var env;
	var dsig;
	dsig = AllpassL.ar(signal, 4, SinOsc.ar(66, 0, 0.002, 0.005), 0);
	env = EnvGen.ar(Env.new([1,0.0],[4,0.1]));
	signal = signal + dsig;
	signal = signal * env * 0.8;
	//signal = Decay.ar(signal, 0.005, 0.1);
	//signal = Klank.ar([800, 1071, 1153, 1723], signal, nil);
	signal = RLPF.ar(signal, XLine.kr(10000, 300, 0.8));
	//signal = Decay2.ar(signal);
	Out.ar(out, signal!2);
}).add;
)

~synth1 = Synth.new(\syn1, [\out, 0]);