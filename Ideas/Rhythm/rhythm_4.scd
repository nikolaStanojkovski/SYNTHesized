var s, k;


///////////////////////
//// Kick 2,5,7,8 /////
///////////////////////

(
var kick_3_buffer, kick_4_buffer;

kick_3_buffer = Buffer.read(s, "C:/Users/Nick/Desktop/Fax/Kompjuterski zvuk i muzika/Project/Code/Kicks/kick_sample_2.wav");
kick_4_buffer = Buffer.read(s, "C:/Users/Nick/Desktop/Fax/Kompjuterski zvuk i muzika/Project/Code/Kicks/kick_sample_3.wav");

SynthDef.new(\kick, {
	arg freqFirst_1=300,freqSecond_1=70,freqThird_1=10,freqDur1_1=0.05,freqDur2_1=5,freqC1_1=1,freqC2_1=(-10),atack_1=0.02,release_1=1,c1_1=1,c2_1=(-20),amplitude_1=0.3,pan=0,out=0,	freqFirst_2=300,freqSecond_2=70,freqThird_2=10,freqDur1_2=0.05,freqDur2_2=5,freqC1_2=1,freqC2_2=(-10),atack_2=0.01,decay_2=0.05,sustain_2=0.03,release_2=1.5,c1_2=1,c2_2=(-20),amplitude_2=0.3, amplitude=1.0,
	attack_3=0.01, decay_3=0.2, release_3=0.6, c1_3=1, c2_3=(-1), amplitude_3=0.2, buffer_3=kick_3_buffer,
	attack_4=0.01, release_4=0.6, c1_4=1, c2_4=(-1), amplitude_4=0.2, buffer_4=kick_4_buffer;
	var signal, signal_1,envelope_1,freqSweep_1,mixA_1,mixB_1,mixC_1,mixD_1,mixE_1,
	signal_2,envelope_2,freqSweep_2,mixA_2,mixB_2,mixC_2,mixD_2,mixE_2, noise_2,
	signal_3, envelope_3, freqSweep_3,  signal_4, envelope_4, freqSweep_4;

	if(amplitude != 0, {
		freqSweep_1 = Env([freqFirst_1,freqSecond_1,freqThird_1],[freqDur1_1,freqDur2_1],[freqC1_1, freqC2_1]).ar;
		envelope_1 = Env([0,1,0],[atack_1, release_1],[c1_1, c2_1]).kr(2);
		mixA_1 = [SinOsc.ar(freqSweep_1, pi), PMOsc.ar(freqSweep_1, pi/2)];
		mixB_1 = [Osc.ar(freqSweep_1, pi/2), FSinOsc.ar(freqSweep_1, pi*3)];
		mixC_1 = [LFNoise2.ar(400, 0.1, 0.4)];
		mixD_1 = [LFDNoise0.ar(9000, 0.1, 0.1)];
		mixE_1 = [SinOsc.ar(freqSweep_1, pi*3)];
		signal_1 = Mix([mixA_1, mixB_1, mixC_1, mixD_1, mixE_1]);
		signal_1 = signal_1*envelope_1;
		signal_1 = signal_1*mixC_1*0.7 * amplitude_1;

		freqSweep_2 = Env([freqFirst_2,freqSecond_2,freqThird_2],[freqDur1_2,freqDur2_2],[freqC1_2, freqC2_2]).ar;
		envelope_2 = Env([0,1,0],[atack_2, decay_2, sustain_2, release_2],[c1_2, c2_2]).kr(2);
		mixA_2 = [SinOsc.ar(freqSweep_2, pi), PMOsc.ar(freqSweep_2, pi/2)];
		mixB_2 = [Osc.ar(freqSweep_2, pi/2), FSinOsc.ar(freqSweep_2, pi*3)];
		mixC_2 = SinOsc.ar(Env([250, 80, 70, 0], [0.01, freqDur2_2], [freqC1_2, freqC2_2]).ar, pi/2);
		mixD_2 = LFTri.ar(Env([200, 80, 70, 0], [0.01, freqDur2_2], [freqC1_2, freqC2_2]).ar, pi/2);
		mixE_2 = LFNoise2.ar(5000, 0.2, 0.1);
		noise_2 = WhiteNoise.ar(envelope_2);
		noise_2 = HPF.ar(noise_2, 2000);
		noise_2 = BPF.ar(noise_2, 900, 3);
		signal_2 = Mix([mixA_2, mixB_2, mixC_2 * 0.8, mixD_2, mixE_2]) + (noise_2 * 0.1);
		signal_2 = signal_2*envelope_2*amplitude_2;

		envelope_3 = Env([0,1,0], [attack_3, decay_3, release_3], [c1_3,c2_3]).kr(2);
		signal_3 = PlayBuf.ar(2, buffer_3) * 0.6;
		freqSweep_3 = Env([300,70,10],[0.01,1.5],[1, (-6)]).ar;
		signal_3 = signal_3 * freqSweep_3 * 2;
		signal_3 = BRF.ar(signal_3, 500, 0.4, 1, 0.4);
		signal_3 = BRF.ar(signal_3, 700, 0.7, 1, 0.8);
		signal_3 = BRF.ar(signal_3, 700, 0.8, 1, 0.9);
		signal_3 = BRF.ar(signal_3, 1000, 0.3, 1, 0.2);
		signal_3 = BRF.ar(signal_3, 1300, 0.3, 1, 0.2);
		signal_3 = BRF.ar(signal_3, 1500, 0.4, 1, 0.6);
		signal_3 = BRF.ar(signal_3, 1800, 0.4, 1, 0.9);
		signal_3 = BRF.ar(signal_3, 2000, 0.3, 1, 0.4);
		signal_3 = BRF.ar(signal_3, 2500, 0.3, 1, 0.6);
		signal_3 = BRF.ar(signal_3, 3000, 0.1, 1, 0.7);
		signal_3 = BRF.ar(signal_3, 3000, 0.1, 1, 0.8);
		signal_3 = BRF.ar(signal_3, 3500, 0.1, 1, 0.6);
		signal_3 = BRF.ar(signal_3, 4500, 0.4, 1, 0.5);
		signal_3 = BRF.ar(signal_3, 5000, 0.5, 1, 0.6);
		signal_3 = BRF.ar(signal_3, 6000, 0.4, 1, 0.5);
		signal_3 = LPF.ar(signal_3, 10500, 1, 1);
		signal_3 = HPF.ar(signal_3, 80, 1, 1);
		signal_3 = signal_3 * envelope_3;
		signal_3 = Compander.ar(signal_3, 0, 0.7, 1, 1, 0.1);
		signal_3 = signal_3 * amplitude_3;

		envelope_4 = Env([0,1,0], [attack_4, release_4], [c1_4,c2_4]).kr(2);
		signal_4 = PlayBuf.ar(2, buffer_4) * 0.6;
		freqSweep_4 = Env([300,70,10],[0.01,1.5],[1, (-6)]).ar;
		signal_4 = signal_4 * freqSweep_4 * 2;
		signal_4 = BRF.ar(signal_4, 500, 0.4, 1, 0.4);
		signal_4 = BRF.ar(signal_4, 700, 0.7, 1, 0.8);
		signal_4 = BRF.ar(signal_4, 900, 0.8, 1, 0.9);
		signal_4 = BRF.ar(signal_4, 1000, 0.3, 1, 0.2);
		signal_4 = BRF.ar(signal_4, 1300, 0.3, 1, 0.2);
		signal_4 = BRF.ar(signal_4, 1500, 0.4, 1, 0.6);
		signal_4 = BRF.ar(signal_4, 1800, 0.4, 1, 0.9);
		signal_4 = BRF.ar(signal_4, 2000, 0.3, 1, 0.4);
		signal_4 = BRF.ar(signal_4, 2500, 0.3, 1, 0.6);
		signal_4 = BRF.ar(signal_4, 3000, 0.6, 1, 0.7);
		signal_4 = BRF.ar(signal_4, 3000, 0.5, 1, 0.8);
		signal_4 = BRF.ar(signal_4, 3500, 0.7, 1, 0.6);
		signal_4 = BRF.ar(signal_4, 4500, 0.3, 1, 0.5);
		signal_4 = BRF.ar(signal_4, 5000, 0.5, 1, 0.6);
		signal_4 = BRF.ar(signal_4, 5500, 0.8, 1, 1);
		signal_4 = BRF.ar(signal_4, 6000, 0.4, 1, 0.5);
		signal_4 = BRF.ar(signal_4, 6000, 0.7, 1, 0.7);
		signal_4 = BRF.ar(signal_4, 8000, 0.3, 1, 0.4);
		signal_4 = BRF.ar(signal_4, 10000, 0.1, 1, 0.4);
		signal_4 = LPF.ar(signal_4, 10500, 1, 1);
		signal_4 = HPF.ar(signal_4, 80, 1, 1);
		signal_4 = signal_4 * envelope_4;
		signal_4 = Compander.ar(signal_4, 0, 0.7, 1, 1, 0.1);
		signal_4 = signal_4 * amplitude_4;

		signal = Mix.ar([signal_1, signal_2, signal_3, signal_4]);

		Out.ar(out, Pan2.ar(signal*amplitude, pan));
	});
}).add;
)

///////////////////////
///// Snare 2,3,5 /////
///////////////////////

(
SynthDef.new(\snare, {
	arg out = 0, amplitude=1, amplitude_1 = 0.3, pan = 0, attack_1 = 0.05, decay_1 = 0.03, release_1 = 0.1, curve_1 = -6, preAmplitude_1 = 1.2, harmonic_1 = 1.2, oscsHarmonic_1 = 1.6, blend_1 = 0.333, oscsAmplitude_1 = 1, noiseRatio_1 = 0.4, noiseBottom_1 = 200, noisePeak_1 = 6900, rq_1 = 0.6, noiseamplitude_1 = 1,
amplitude_2 = 0.3, attack_2 = 0.01, release_2 = 0.25,
amplitude_3 = 0.4, attack_3 = 0.01, decay_3 = 0.01, release_3 = 0.35, curve_3 = -6, preAmplitude_3 = 1.2, harmonic_3 = 1.6, oscsHarmonic_3 = 2.5, blend_3 = 0.333, oscsAmplitude_3 = 1, noiseRatio_3 = 0.4, noiseBottom_3 = 200, noisePeak_3 = 5300, rq_3 = 0.8, noiseamplitude_3 = 1;

	var signal, envOscs_1, envSweep_1, envNoise_1, oscs_1, noise_1, signal_1,
	noise_2, signal_2, envelope_2,
	envOscs_3, envSweep_3, envNoise_3, oscs_3, noise_3, signal_3;

	envOscs_1 = Env.new(
		            levels: [0.5, 1, 0.5, 0] * oscsAmplitude_1,
		            times: [(attack_1 * 0.1), decay_1, release_1],
		            curve: [1, 0.5, 1] * curve_1).kr;
	envSweep_1 = Env.new(
		            levels: [33.81, 1.88, 1] * 140,
		            times: [(attack_1 * 0.1), release_1],
		            curve: [1, 1.25] * curve_1).kr;
	envNoise_1 = Env.new(
		            levels: [1, noiseRatio_1, 0] * noiseamplitude_1,
		            times: [attack_1, (decay_1 + release_1)],
		            curve: [0.5, 0.5] * curve_1).kr(doneAction: 2);
	oscs_1 = LFPulse.ar(freq: [envSweep_1, envSweep_1 * oscsHarmonic_1], width: [0.5, 0.5], mul: [1 - blend_1, blend_1], add: [-0.5, -0.25]);
	oscs_1 = LPF.ar(in: oscs_1, freq: envSweep_1 * harmonic_1, mul: envOscs_1 * 1.5);
	oscs_1 = oscs_1 + SinOsc.ar(freq: envSweep_1, phase: pi/4, mul: envOscs_1);
	noise_1 = WhiteNoise.ar(1/3);
	noise_1 = HPF.ar(in: noise_1, freq: noiseBottom_1);
	noise_1 = noise_1 + BPF.ar(in: noise_1, freq: noisePeak_1, rq: rq_1, mul: 3);
	noise_1 = noise_1 * envNoise_1;
	signal_1 = Mix.ar(oscs_1 + noise_1) * preAmplitude_1;
	signal_1 = signal_1.clip2(1) * amplitude_1;

	noise_2 = WhiteNoise.ar(amplitude_2);
	signal_2 = SinOsc.ar(180,0,amplitude_2);
	envelope_2 = Env.perc(attack_2, release_2).kr;
	signal_2 = HPF.ar(signal_2, 1800) + noise_2;
	signal_2 = signal_2 * envelope_2;
	signal_2 = FreeVerb.ar(signal_2);

	envOscs_3 = Env.new(
		            levels: [0.2, 1, 0.2, 0] * oscsAmplitude_3,
		            times: [(attack_3 * 0.1), decay_3, 0.3],
		            curve: [1, 0.5, 1] * curve_3).kr;
	envSweep_3 = Env.new(
		            levels: [33.81, 1.88, 1] * 140,
		            times: [(attack_3 * 0.1), release_3],
		            curve: [1, 1.25] * curve_3).kr;
	envNoise_3 = Env.new(
		            levels: [1, noiseRatio_3, 0] * noiseamplitude_3,
		            times: [attack_3, (decay_3 + release_3)],
		            curve: [0.75, 0.75] * curve_3).kr(doneAction: 2);
	oscs_3 = LFPulse.ar(freq: [envSweep_3, envSweep_3 * oscsHarmonic_3], width: [0.8, 0.8], mul: [1 - blend_3, blend_3], add: [-0.5, -0.25]);
	oscs_3 = LPF.ar(in: oscs_3, freq: envSweep_3 * harmonic_3, mul: envOscs_3 * 1.5);
	oscs_3 = oscs_3 + SinOsc.ar(freq: envSweep_3, phase: pi/4, mul: envOscs_3);
	noise_3 = WhiteNoise.ar(1, 0.3);
	noise_3 = HPF.ar(in: noise_3, freq: noiseBottom_3);
	noise_3 = noise_3 + BPF.ar(in: noise_3, freq: noisePeak_3, rq: rq_3, mul: 5);
	noise_3 = noise_3 * envNoise_3;
	signal_3 = Mix.ar(oscs_3 + noise_3) * preAmplitude_3;
	signal_3 = signal_3.clip2(1) * amplitude_3;
	signal_3 = FreeVerb.ar(Limiter.ar(signal_3), 0.2, 0.6, 0.5);

	signal = Mix.ar([signal_1, signal_2, signal_3]);

	Out.ar(out, Pan2.ar(signal*amplitude, pan));
}).add;
)


///////////////
///////////////
// Sequence ///
///////////////
///////////////

(
  var kick, kick_duration, snare, snare_duration;

  kick = Pseq(
	[
		1, 0, 1, 0,
		1, 0, 1, 0,
		1, 0, 1, 0,
		1, 0, 1, 1,
		1, 0, 1, 0,
		1, 0, 1, 0,
		1, 0, 1, 0,
		1, 0, 0, 1
	], inf).asStream;

  kick_duration = Pseq(
	[
		1/2
	], inf).asStream;

  snare = Pseq(
	[
		0, 1, 0, 1,
		0, 1, 0, 1,
		0, 1, 0, 1,
		0, 1, 0, 1,
		0, 1, 0, 1,
		0, 1, 0, 1,
		0, 1, 0, 1,
		0, 1, 1, 0
	], inf).asStream;

  snare_duration = Pseq(
	[
		1/2
	], inf).asStream;


  TempoClock.default.tempo = 93/60;

  k = Pbind(
	\instrument, \kick,
	\dur, kick_duration,
	\amplitude, kick*0.6,
  );

  s = Pbind(
	\instrument, \snare,
    \dur, snare_duration,
    \amplitude, snare*1.3
  );
)

/////////////
/////////////
// Playing //
/////////////
/////////////


(
  k.play; s.play;
)

(
  k.stop; s.stop;
)