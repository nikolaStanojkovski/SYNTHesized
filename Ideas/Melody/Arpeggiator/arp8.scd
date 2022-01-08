(
SynthDef(\arp8, {|freq = 440, dur = 1|
var klang,note;
dur = dur * 2;
note = freq.cpsmidi;
note = note + (LFNoise2.ar(20).range(-1,1) * (1/8));
klang = SinOsc.ar((note * [1,1.002]).midicps, phase: VarSaw.ar(note.midicps, width: Line.ar(1,0.2,dur))) * 0.3;
klang = klang * XLine.ar(1,1/10000,dur,doneAction:2);
Out.ar(0, klang);
}).play;
)