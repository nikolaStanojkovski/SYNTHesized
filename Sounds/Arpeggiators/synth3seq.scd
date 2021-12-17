(
s.boot;
)

(
SynthDef(\smooth, { |freq = 440, sustain = 1, amp = 0.1|
    var sig;
	sig = SinOsc.ar(freq, 0, amp) * EnvGen.kr(Env.linen(0.05, sustain, 0.1), doneAction: 2);
    Out.ar(0, sig ! 2)
}).add;
);

(
~blipArp=SynthDef.new(\blipArp,{
	arg outBus=0,freq=1620,nharm=3,amp=0.8,atk=0.1,rel=0.1;
	var sig,env;
	sig=Blip.ar(freq,nharm,amp).scope(1);
	env=EnvGen.kr(Env([0,amp,0],[atk,rel]),doneAction:2);
	sig=sig*env;
	Out.ar(outBus,sig);

}).add;
)

(
p = Pbind(
        // the name of the SynthDef to use for each note
    \instrument, \blipArp,
        // MIDI note numbers -- converted automatically to Hz
	\midinote, Pseq([40 + 0,  40 + 7, 40+ 12,40+ 0], inf),
        // rhythmic values
    \dur, Pseq([0.25, 0.25, 0.50,0.25], inf)
).play;
)
