s.boot
(
SynthDef(\arp82, {|freq = 440, dur = 1|
var klang,note,local;
dur = dur * 2;
note = freq.cpsmidi;
note = note + (LFNoise2.ar(20).range(-1,1) * (1/8));
klang = SinOsc.ar((note * [1,1.002]).midicps, phase: VarSaw.ar(note.midicps, width: Line.ar(1,0.2,dur))) * 0.3;
klang = klang * XLine.ar(1,1/10000,dur,doneAction:2);
Out.ar(0, klang);
}).store;
)


TempoClock.default.tempo = 93/60;
(
p = Pbind(
	// the name of the SynthDef to use for each note
	\instrument, \arp82,
	// MIDI note numbers -- converted automatically to Hz
	\midinote, Pseq([60,63,65,60,63,65,68,63,60,63,65,60,63,65,68,63,60,63,65,60,63,65,68,63,60,63,65,60,63,65,68,63,60,63,68,60,63,70,68,63,60,63,68,60,63,70,68,63,58,63,67,58,63,68,67,63,58,63,67,58,63,68,67,63], inf),
	// rhythmic values
	\dur, Pseq([0.25], inf)
).play;
)


TempoClock.default.tempo = 93/60;
(
p = Pbind(
	// the name of the SynthDef to use for each note
	\instrument, \arp82,
	// MIDI note numbers -- converted automatically to Hz
	\midinote, Pseq([48,51,53,48,51,53,56,51,48,51,53,48,51,53,56,51,48,51,53,48,51,53,56,51,48,51,53,48,51,53,56,51,48,51,56,48,51,58,56,51,48,51,56,48,51,58,56,51,46,51,55,46,51,56,55,51,46,51,55,46,51,56,55,51], inf),
	// rhythmic values
	\dur, Pseq([0.25], inf)
).play;
)


TempoClock.default.tempo = 93/60;
(
p = Pbind(
	// the name of the SynthDef to use for each note
	\instrument, \arp82,
	// MIDI note numbers -- converted automatically to Hz
	\midinote, Pseq([65,60,72,60,65,60,72,60,65,60,72,60,65,60,72,60,68,65,75,65,68,65,75,65,68,65,75,65,68,65,75,65,68,63,72,63,68,63,72,63,68,63,72,63,68,63,72,63,67,63,70,63,67,63,70,63,68,63,70,63,72,67,63,60], inf),
	// rhythmic values
	\dur, Pseq([0.25], inf)
).play;
)