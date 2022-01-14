s.boot
(
SynthDef(\lead2, {
	arg oscamp1=0.25, oscamp2 = 0.3, detune1 = -0.2, detune2=0.1,
	ffreqhi = 14000, ffreqlo=400,
	trig=1, atk = 0.01, rel=1, crv= -1,
	fatk= 0.2, fdecay=1.2, fsus=0.4, frel=2, fcrv= -2,
	lfo1freq=25, lfo1w=2.5,
	lfo2freq=4, glide=0.9;
	var osc1, freq1;
	var osc2, freq2;
	var sig,sig2, env, fenv;
	var lfo1,lfo2;
	var amp, pitch;
	pitch = \pitch.kr(60, glide);
	amp = \amp.kr(1, 0.03);
	env= EnvGen.ar(Env([0,1,0], [atk,rel,crv]), doneAction:2);
	fenv = EnvGen.ar( Env.adsr( fatk, fdecay, fsus, frel, 1, fcrv), trig);
	lfo1= SinOsc.kr((lfo1freq*fenv)+1)*lfo1w;
	lfo2 = SinOsc.kr( lfo2freq);
	freq1 = (pitch+ (lfo2*detune1)).midicps;
	freq2 = (pitch+ (lfo2*detune2)).midicps;
	osc1 = Saw.ar(freq1);
	osc2 = Saw.ar(freq2);
	sig = Mix.ar([ osc1*oscamp1, osc2*oscamp2]);
	sig = RLPF.ar(sig,
		(((ffreqhi*fenv)+ffreqlo).cpsmidi + lfo1).midicps , 0.35);
	sig2 = DelayC.ar(sig,0.2,0.01);
	Out.ar(0, [sig, sig2]*env*amp);
}).add;
)
b = Synth(\lead2, [\pitch, 70]);
b.free
(
~myLead = Pbind(
	\instrument, \lead2,
	\dur, Pseq([0.7,0.7,0.7,3],1).trace,
	\ffreqhi, 9000,
	\pitch, Pseq([70,69,70,68,78,74,76],inf).trace,
	\atk, [0.01,0.05,0.05,0.05,0.05],
	\rel, Pseq([1,1,1,1.7],inf).trace,
	\amp, 1,
	\out, 0,
).play(t)
)
~myLead.stop;
t = TempoClock(93/60);
