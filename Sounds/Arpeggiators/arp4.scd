(
SynthDef(\bpfarp,{
	arg atk=0.2,sus=0,rel=0.2,c1=1,c2=(-1),
	freq=50, detune=0.2,amp=0.0001,out=0;
	var sig,env;
	env=EnvGen.kr(Env([0,1,1,0],[atk,sus,rel],[c1,0,c2]),doneAction:2);
	sig=Saw.ar(freq*LFNoise1.kr(0.5,detune).midiratio);
	sig=BPF.ar(sig);
	sig=sig*env*amp;
	Out.ar(out,sig!2);
}).add;
)
~bpfarp=Synth.new(\bpfsaw)
(
p = Pbind(
        // the name of the SynthDef to use for each note
    \instrument, \bpfarp,
        // MIDI note numbers -- converted automatically to Hz
	\midinote, Pseq([40 + 0,  40 + 7, 40+ 0,40+ 7], inf),
        // rhythmic values
    \dur, Pseq([0.25, 0.25, 0.25,0.25], inf)
).play;
)