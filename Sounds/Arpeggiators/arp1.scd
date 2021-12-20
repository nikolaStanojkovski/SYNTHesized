(
SynthDef(
	"bassarp",
	{|note=55,amp=0.7,cutoff=350,decay=1|
		var env,audio;
		env=EnvGen.kr(Env.new([0,0.8,0],[0.05,2],[3,-50]),doneAction:2);
		audio=RLPF.ar(Saw.ar(note.midicps,amp),cutoff)*env;
		audio=CombC.ar(audio,1,0.125,decay);
		Out.ar([0,1],audio);
	}
).store;
)
~bpfarp=Synth.new(\bassarp);