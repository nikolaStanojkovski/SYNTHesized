s.boot
(
SynthDef(\pluck, {|freq = 440, dur = 5|
var klang,note,local;
dur = dur * 2;
note = freq.cpsmidi;
note = note + (LFNoise2.ar(20).range(-1,3) * (1/8));
klang = SinOsc.ar((note * [1,0.9]).midicps, phase: VarSaw.ar(note.midicps, width: Line.ar(0.95,0.6,dur))) * 0.5;
klang = klang * XLine.ar(1,0.0001,dur,doneAction:2);
Out.ar(0, klang);
}).store;
)


(
p = Pbind(
	// the name of the SynthDef to use for each note
	\instrument, \pluck,
	// MIDI note numbers -- converted automatically to Hz
	\midinote, Pseq([
29+24,31+24, 34+24,32+24, 29+24,31+24, 34+24,32+24, 29+24,31+24, 34+24,32+24, 29+24,34+24, 31+24,29+24, 31+36,31+36, 34+36,32+36, 29+36,31+36, 34+36,32+36, 29+36,31+36, 34+36,32+36, 29+36,34+36, 31+36,29+36], inf),
	// rhythmic values
	\dur, Pseq([0.16], inf)
).play;
)
// 