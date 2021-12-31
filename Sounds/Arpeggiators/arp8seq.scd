s.boot
(
SynthDef(\pluck, {|freq = 440, dur = 1|
var klang,note,local;
dur = dur * 2;
note = freq.cpsmidi;
note = note + (LFNoise2.ar(20).range(-1,1) * (1/8));
klang = SinOsc.ar((note * [1,1.002]).midicps, phase: VarSaw.ar(note.midicps, width: Line.ar(1,0.2,dur))) * 0.3;
klang = klang * XLine.ar(1,1/10000,dur,doneAction:2);
Out.ar(0, klang);
}).store;
)


(
p = Pbind(
	// the name of the SynthDef to use for each note
	\instrument, \pluck,
	// MIDI note numbers -- converted automatically to Hz
	\midinote, Pseq([70,  74, 77 ,70,  74, 77 ,70,  74, 77 ,70,  74, 77 ,70,  74, 77 ,67,  71, 74,67,  71, 74,67,  71, 74,67,  71, 74,67,  71, 74,72,  76, 79,72,  76, 79,72,  76, 79,72,  76, 79,72,  76, 79,69,  73, 76,69,  73, 76,69,  73, 76,69,  73, 76,69,  73, 76,], 2),
	// rhythmic values
	\dur, Pseq([0.14, 0.10, 0.14], inf)
).play;
)
