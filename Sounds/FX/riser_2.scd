(
SynthDef.new(\riser_2, { arg freq = 349.23, amp = 0.1, attack = 3, release = 1.5, lofreq = 1000, hifreq = 3000, pan = 0;
    var envelope, sound;
    envelope = Env.perc(
		attackTime: attack,
		releaseTime: release,
		level: amp
	).kr(doneAction: 2);
    sound = Saw.ar(freq: freq * [0.99, 1, 1.001, 1.008], mul: envelope);
	sound = LPF.ar(
		in: sound,
		freq: LFNoise2.kr(1).range(lofreq, hifreq)
	);
    sound = Mix.ar(sound);
	sound = Pan2.ar(sound, pan);
    Out.ar(0, sound);
}).add;
)

x = Synth.new(\riser_2);