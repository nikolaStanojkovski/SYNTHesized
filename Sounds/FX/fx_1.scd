(
SynthDef(\fx_1,{
	arg atk=2,sus=0,rel=2,c1=1,c2=(-1),
	freq=349.23, detune=0.2,amp=0.0001,out=0;
	var sig,env;
	env=EnvGen.kr(Env([0,1,1,0],[atk,sus,rel],[c1,0,c2]),doneAction:2);
	sig=Saw.ar(freq*LFNoise1.kr(0.5,detune).midiratio);
	sig=BPF.ar(sig);
	sig=sig*env*amp;
	Out.ar(out,sig!2);
}).add;
)

(
5.do{
	Synth(
		\fx_1,
		[
			\freq,349.23,
			\amp,0.1,
			\cfmin,50*2,
			\cfmax,50*50,
			\rqmin,0.005,
			\rqmax,0.003,
		],
	);
};
)