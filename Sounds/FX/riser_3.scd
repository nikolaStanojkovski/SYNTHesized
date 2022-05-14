(
SynthDef.new(\riser_3, { arg freq = 87.31, amp = 0.4, attack = 3, release = 1.5, lofreq = 100, hifreq = 500, pan = 0;
    var envelope, sound;
    envelope = Env.perc(
		attackTime: attack,
		releaseTime: release,
		level: amp
	).kr(doneAction: 2);
    sound = Saw.ar(freq: freq * [0.99, 1, 1.001], mul: envelope);
	sound = LPF.ar(
		in: sound,
		freq: LFNoise2.kr(1).range(lofreq, hifreq)
	);
    sound = Mix.ar(sound);
	sound = Pan2.ar(sound, pan);
    Out.ar(0, sound);
}).add;
)

x = Synth.new(\riser_3);