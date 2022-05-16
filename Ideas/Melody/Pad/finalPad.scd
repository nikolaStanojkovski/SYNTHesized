(SynthDef("sawSynth", {
    arg freq = 440, freq2 = 440, freq3 = 440, freq4 = 440, pan=0, amp=1;
    var env, sig, sig2, sig3, sig4, sig5, sig6, env2;
    env = EnvGen.kr(Env.new(
        [0.00001, 1, 0.1, 0.1, 0.00000001], [0, 3, 0, 0.5],[0.5, -2, 0, -0.5]), doneAction: 2);
    env2 = EnvGen.kr(Env.new(
        [0.00001, 1, 0.1, 0.1, 0.00000001], [0, 3, 0, 0.5],[0.5, -2, 0, -0.5]), doneAction: 2);
    sig = Saw.ar(freq: freq * [0.99, 1, 1.001, 1.008], mul: amp/4)*env;
    sig2 = Saw.ar(0.5*freq, mul: amp/4)*env2;
    sig = Mix([sig, sig2]);

    sig2 = Saw.ar(freq: freq2 * [0.99, 1, 1.001, 1.008], mul: amp/4)*env;
    sig3 = Saw.ar(0.5*freq2, mul: amp/4)*env2;
    sig4 = Mix([sig3, sig2]);

    sig2 = Saw.ar(freq: freq3 * [0.99, 1, 1.001, 1.008], mul: amp/4)*env;
    sig3 = Saw.ar(0.5*freq3, mul: amp/4)*env2;
    sig5 = Mix([sig3, sig2]);

    sig2 = Saw.ar(freq: freq4 * [0.99, 1, 1.001, 1.008], mul: amp/4)*env;
    sig3 = Saw.ar(0.5*freq4, mul: amp/4)*env2;
    sig6 = Mix([sig3, sig2]);

    sig = Mix([sig, sig4, sig5, sig6]);

    sig = Pan2.ar(sig, pan);
    Out.ar(0, sig);
}).add;)

a = Synth.new(\sawSynth);

TempoClock.default.tempo = 93/60;
(
Pbindef(\try,
    \instrument, \sawSynth,
	\dur, Pseq([8,4,4], inf),
    \freq, Pseq([349.23, 	311.13, 	311.13], inf),
    \freq2, Pseq([415.30, 415.30, 392.00], inf),
    \freq3, Pseq([	523.25, 	523.25, 466.16], inf),
    \freq4, Pseq([261.63, 261.63, 	233.08], inf),
    \amp, 0.1,
    \out, 0
).play
)

(
Pbindef(\try,
    \instrument, \sawSynth,
	\dur, Pseq([4,4,4,4], inf),
    \freq, Pseq([	233.08, 	261.63, 	174.61, 174.61], inf),
    \freq2, Pseq([ 277.18, 	311.13, 	261.63, 261.63], inf),
    \freq3, Pseq([	349.23, 	392.00, 349.23, 349.23], inf),
    \freq4, Pseq([ 466.16, 466.16, 	415.30, 415.30], inf),
    \amp, 0.1,
    \out, 0
).play
)

(
Pbindef(\try,
    \instrument, \sawSynth,
	\dur, Pseq([5,3,4,4], inf),
    \freq, Pseq([277.18, 311.13, 	261.63, 	233.08], inf),
    \freq2, Pseq([	349.23, 	392.00, 349.23, 	311.13], inf),
    \freq3, Pseq([		415.30, 466.16, 415.30, 392.00], inf),
    \freq4, Pseq([ 	523.25, 622.25, 523.25, 466.16], inf),
    \amp, 0.1,
    \out, 0
).play
) 