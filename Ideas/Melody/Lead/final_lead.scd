s.boot;

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
s.record()
a = Synth(\lead1, [\pitch, 72]);
a.free;


TempoClock.default.tempo = 93/60;
(
~myLead_1 = Pbind(
    \instrument, \lead1,
    \dur, Pseq([1.5,0.5,0.5,1,2.5,0.5,1.5,2.5,1.5,4],2).trace,
    \ffreqhi, 11000,
    \pitch, Pseq([65,65,68,65,72,73,72,68,70,67],inf).trace,
    \atk, 0.001,
    \rel, Pseq([1.7,0.7,0.7,1.2,2.7,0.7,1.7,2.7,1.7,4.2],inf).trace,
    \amp, 1,
    \out, 0,
).play(t)
)

(
~myLead_1_octave = Pbind(
    \instrument, \lead1,
    \dur, Pseq([1.5,0.5,0.5,1,2.5,0.5,1.5,2.5,1.5,4],2).trace,
    \ffreqhi, 11000,
    \pitch, Pseq([77,77,80,77,84,85,84,80,82,79],inf).trace,
    \atk, 0.001,
    \rel, Pseq([1.7,0.7,0.7,1.2,2.7,0.7,1.7,2.7,1.7,4.2],inf).trace,
    \amp, 1,
    \out, 0,
).play(t)
)

(
~myLead_2 = Pbind(
    \instrument, \lead1,
    \dur, Pseq([1,0.25,0.5,1,2,0.25,1.5,0.5,1.5,2],2).trace,
    \ffreqhi, 10000,
    \pitch, Pseq([80,84,77,80,85,77,80,79,82,77],inf).trace,
    \atk, 0.001,
    \rel, Pseq([1.8,0.5,0.7,1.2,2.5,1,1.8,2.5,2,2],inf).trace,
    \amp, 1,
    \out, 0,
).play(t)
)

(
~myLead_1_thirds = Pbind(
    \instrument, \lead1,
    \dur, Pseq([1.5,0.5,0.5,1,2.5,0.5,1.5,2.5,1.5,4],2).trace,
    \ffreqhi, 11000,
    \pitch, Pseq([80,80,84,80,87,89,87,84,85,82],inf).trace,
    \atk, 0.001,
    \rel, Pseq([1.7,0.7,0.7,1.2,2.7,0.7,1.7,2.7,1.7,4.2],inf).trace,
    \amp, 1,
    \out, 0,
).play(t)
)

(
~myLead_1_sixths = Pbind(
    \instrument, \lead1,
    \dur, Pseq([1.5,0.5,0.5,1,2.5,0.5,1.5,2.5,1.5,4],2).trace,
    \ffreqhi, 11000,
    \pitch, Pseq([78,78,72,68,75,77,75,72,73,70],inf).trace,
    \atk, 0.001,
    \rel, Pseq([1.7,0.7,0.7,1.2,2.7,0.7,1.7,2.7,1.7,4.2],inf).trace,
    \amp, 1,
    \out, 0,
).play(t)
)

s.stopRecording
~myLead.stop;
