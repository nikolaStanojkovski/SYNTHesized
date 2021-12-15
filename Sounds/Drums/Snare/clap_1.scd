s.boot;

s.meter;
s.freqscope;

(
SynthDef.new(\clap, {
	var oscilator, envelope, noise, signal;

	noise = BPF.ar(LPF.ar(GrayNoise.ar(1),7500),1500, 0.4);
	envelope = Line.ar(1, 0, 0.9, doneAction: 2);

	signal = {Mix.arFill(7,
		{arg i;
			EnvGen.ar(
				Env.new(
					[0,0,1,0],
					[0.01 * i,0,0.04]
				)
			) * noise * 0.5;
		}
	)};
	signal = (signal * envelope);
	signal = signal = FreeVerb.ar(signal, 0.1, 0.1, 0.5);
	signal = Pan2.ar(signal, 0, 1);

	Out.ar(0, signal);
}).add;
)

x = Synth.new(\clap);