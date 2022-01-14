(SynthDef("sawSynth", {
	arg freq = 400, amp = 0.1, att = 0.1, rel = 2, lofreq = 1000, hifreq = 3000, pan = 0;
    var env, sig, sig2, env2;
 //   env = Env.perc(
	//	attackTime: att,
		//releaseTime: rel,
		//level: amp
	//).kr(doneAction: 2);
	env = EnvGen.kr(Env.new(
		[0.00001, 2, 1, 1, 0.00000001],
		[1.5, 0.5, 0.5, 1.5],
		[0.5, 0.5, 0, -3]), doneAction: 2);
	env2 = EnvGen.kr(Env.new(
		[0.00001, 1, 0.5, 0.5, 0.00000001],
		[1.5, 0.5, 0.5, 1.5],
		[0.5, 0.5, 0, -0.5]), doneAction: 2);
    sig = Saw.ar(freq: freq * [0.99, 1, 1.001, 1.008])*env;
	sig2 = Saw.ar(0.5*freq)*env2;
	sig = Mix([sig, sig2]);
	//sig2 = Saw.ar(freq) *env;
	//sig = Mix(sig, sig2);
	//sig = LPF.ar(
		//in: snd,
		//freq: LFNoise2.kr(1).range(lofreq, hifreq)
	//);
	sig = Pan2.ar(sig, pan);
    Out.ar(0, sig);
}).add;)

a = Synth.new(\sawSynth);

t = TempoClock(93/60);
(
Pbindef(\try,
	\instrument, \plotSaw,
	\dur, Pseq([1,0.6, 1.5, 0.6, 0.5], inf),
	\freq, Pseq([260, 330, 440, 330, 260], inf),
	\amp, 1,
	\out, 0
).play
)
