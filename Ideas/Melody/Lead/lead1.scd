s.boot
MIDIClient.init;
MIDIIn.connectAll;
MIDIdef.noteOn(\noteOnTest,{"key down".postln});
(
SynthDef(\lead1, {
	arg oscamp1=0.20, oscamp2 = 0.25, detune1 = -0.1, detune2=0.1,
	ffreqhi = 15000, ffreqlo=0,
	trig=1, atk = 0.001, rel=3, crv= 1,
	fatk= 0.005, fdecay=1.2, fsus=0.07, frel=0.02, fcrv= -1,
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
	sig2 = DelayC.ar(sig,0.2,0.00);

	Out.ar(0, [sig, sig2]*env*amp);
}).add;
)
s.record(duration:4)
a = Synth(\lead1, [\pitch, 72]);
a.free
(
~myLead = Pbind(
	\instrument, \lead1,
	\dur, Pseq([3,0.5,3,0.5,3,0.5,3],2).trace,
	\ffreqhi, 11000,
	\pitch, Pseq([82,80,76,80,78,74,76],inf).trace,
	\atk, 0.001,
	\rel, Pseq([3,0.5,3,0.5,3,0.5,3],inf).trace,
	\amp, 1,
	\out, 0,
).play(t)
)
~myLead.stop;
t = TempoClock(93/60);
