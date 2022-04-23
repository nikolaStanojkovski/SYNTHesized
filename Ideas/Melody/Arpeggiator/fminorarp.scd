s.boot
(
SynthDef(\fminoarp, {|freq = 440, dur = 5|
var klang,note,local;
dur = dur * 2;
note = freq.cpsmidi;
note = note + (LFNoise2.ar(20).range(-1,3) * (1/8));
klang = SinOsc.ar((note * [1,0.9]).midicps, phase: VarSaw.ar(note.midicps, width: Line.ar(0.95,0.6,dur))) * 0.5;
klang = klang * XLine.ar(1,0.0001,dur,doneAction:2);
Out.ar(0, klang);
}).store;
)


TempoClock.default.tempo = 93/60;
(
p = Pbind(
	// the name of the SynthDef to use for each note
	\instrument, \fminoarp,
	// MIDI note numbers -- converted automatically to Hz
	\midinote, Pseq([60,63,65,60,63,65,68,63,60,63,65,60,63,65,68,63,60,63,65,60,63,65,68,63,60,63,65,60,63,65,68,63,60,63,68,60,63,70,68,63,60,63,68,60,63,70,68,63,58,63,67,58,63,68,67,63,58,63,67,58,63,68,67,63], inf),
	// rhythmic values
	\dur, Pseq([0.25], inf)
).store;
)


TempoClock.default.tempo = 93/60;
(
p = Pbind(
	// the name of the SynthDef to use for each note
	\instrument, \fminoarp,
	// MIDI note numbers -- converted automatically to Hz
	\midinote, Pseq([65,60,72,60,65,60,72,60,65,60,72,60,65,60,72,60,68,65,75,65,68,65,75,65,68,65,75,65,68,65,75,65,68,63,72,63,68,63,72,63,68,63,72,63,68,63,72,63,67,63,70,63,67,63,70,63,68,63,70,63,67,63,70,63], inf),
	// rhythmic values
	\dur, Pseq([0.25], inf)
).play;
)


TempoClock.default.tempo = 93/60;
(
p = Pbind(
	// the name of the SynthDef to use for each note
	\instrument, \fminoarp,
	// MIDI note numbers -- converted automatically to Hz
	\midinote, Pseq([65,60,72,60,65,60,72,60,65,60,72,60,65,60,72,60,68,65,75,65,68,65,75,65,68,65,75,65,68,65,75,65,68,63,72,63,68,63,72,63,68,63,72,63,68,63,72,63,67,63,70,63,67,63,70,63,68,63,70,63,72,67,63,60], inf),
	// rhythmic values
	\dur, Pseq([0.25], inf)
).play;
)