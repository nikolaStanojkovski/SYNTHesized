(
SynthDef.new(\riser_4, { arg freq = 87.31, amp = 0.2, attack = 2.5, release = 1, lofreq = 100, hifreq = 250, pan = 0;
    var envelope, sound;
    envelope = Env.perc(
		attackTime: attack,
		releaseTime: release,
		level: amp
	).kr(doneAction: 2);
    sound = Saw.ar(freq: freq * [0.99, 1, 1.001, 1.008], mul: envelope);
    sound = Mix.ar(sound);
	sound = Pan2.ar(sound, pan);
    Out.ar(0, sound);
}).add;
)

x = Synth.new(\riser_4);