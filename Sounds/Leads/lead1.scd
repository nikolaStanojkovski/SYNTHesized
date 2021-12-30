s.boot
MIDIClient.init;
MIDIIn.connectAll;
MIDIdef.noteOn(\noteOnTest,{"key down".postln});
(
SynthDef(\lead, {
	arg oscamp1=0.20, oscamp2 = 0.25, detune1 = -0.1, detune2=0.1,
	ffreqhi = 15000, ffreqlo=0,
	trig=1, atk = 0.001, rel=0.001, crv= -1,
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
	env = EnvGen.ar( Env.asr(atk, 1, rel, crv), trig);
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
a = Synth(\lead, [\pitch, 72]);
a.free


(
SynthDef(\lead, {
	arg oscamp1=0.25, oscamp2 = 0.15, detune1 = -0.2, detune2=0.1,
	ffreqhi = 14000, ffreqlo=400,
	trig=1, atk = 0.2, rel=1, crv= -2,
	fatk= 0.2, fdecay=1.2, fsus=0.4, frel=2, fcrv= -2,
	lfo1freq=25, lfo1w=2.5,
	lfo2freq=4, glide=0.1;
	var osc1, freq1;
	var osc2, freq2;
	var sig,sig2, env, fenv;
	var lfo1,lfo2;
	var amp, pitch;
	pitch = \pitch.kr(60, glide);
	amp = \amp.kr(1, 0.03);
	env = EnvGen.ar( Env.asr(atk, 1, rel, crv), trig);
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
b = Synth(\lead, [\pitch, 68]);
b.free

s.record(duration:4)
a = Synth(\lead, [\pitch, 68]);
a.free
s.stopRecording;
s.recSampleFormat="int24"
s.recHeaderFormat="aiff"
s.makeWindow


(
~blipArp=SynthDef.new(\blipArp,{
    arg outBus=0,freq=320,nharm=3,amp=0.5,atk=0.1,rel=0.1;
    var sig,env;
    sig=Blip.ar(freq,nharm,amp).scope(1);
    env=EnvGen.kr(Env([0,amp,0],[atk,rel]),doneAction:2);
    sig=sig*env;
    Out.ar(outBus,sig);

}).add;
)
~blipArp.play


