var s, k;


///////////////////////
////// Kick 2,6 ///////
///////////////////////

(
var kick_2_buffer;

kick_2_buffer = Buffer.read(s, "C:/Users/Nick/Desktop/Fax/Kompjuterski zvuk i muzika/Project/Code/Kicks/kick_sample_1.wav");

SynthDef.new(\kick, {
	arg freqFirst_1=300,freqSecond_1=70,freqThird_1=10,freqDur1_1=0.05,freqDur2_1=5,freqC1_1=1,freqC2_1=(-10),atack_1=0.02,release_1=1,c1_1=1,c2_1=(-20),amplitude_1=0.6,attack_2=0.01,decay_2=0.2,release_2=0.6, c1_2=1,c2_2=(-1),amplitude_2=0.2,buffer_2=kick_2_buffer,pan=0,out=0,amplitude=1;
	var signal_1,envelope_1,freqSweep_1,mixA_1,mixB_1,mixC_1,mixD_1,mixE_1,signal_2,envelope_2,freqSweep_2,signal;

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
		signal_1 = signal_1*mixC_1*0.7;

		envelope_2 = Env([0,1,0], [attack_2, decay_2, release_2], [c1_2,c2_2]).kr(2);
		signal_2 = PlayBuf.ar(2, buffer_2) * 0.6;
		freqSweep_2 = Env([300,70,10],[0.01,1.5],[1, (-10)]).ar;
		signal_2 = signal_2 * freqSweep_2 * 2;
		signal_2 = BRF.ar(signal_2, 500, 0.4, 1, 0.4);
		signal_2 = BRF.ar(signal_2, 700, 0.4, 1, 0.6);
		signal_2 = BRF.ar(signal_2, 1000, 0.3, 1, 0.2);
		signal_2 = BRF.ar(signal_2, 1500, 0.4, 1, 0.6);
		signal_2 = BRF.ar(signal_2, 2000, 0.4, 1, 0.4);
		signal_2 = BRF.ar(signal_2, 2500, 0.7, 1, 0.6);
		signal_2 = BRF.ar(signal_2, 3000, 0.8, 1, 0.7);
		signal_2 = BRF.ar(signal_2, 3000, 0.8, 1, 0.8);
		signal_2 = BRF.ar(signal_2, 3500, 0.8, 1, 0.6);
		signal_2 = BRF.ar(signal_2, 4500, 0.5, 1, 0.5);
		signal_2 = BRF.ar(signal_2, 5000, 0.5, 1, 0.6);
		signal_2 = BRF.ar(signal_2, 6000, 0.4, 1, 0.5);
		signal_2 = LPF.ar(signal_2, 10500, 1, 1);
		signal_2 = HPF.ar(signal_2, 80, 1, 1);
		signal_2 = signal_2 * envelope_2;
		signal_2 = Compander.ar(signal_2, 0, 0.7, 1, 1, 0.02);

		signal = Mix.ar([signal_1, signal_2]);

		Out.ar(out, Pan2.ar(signal*amplitude, pan));
	});
}).add;
)


///////////////////////////////
////// Snare 2,3, Clap 2 //////
///////////////////////////////

(
SynthDef.new(\snare, {
	arg amplitude_1=0.3,attack_1=0.05,decay_1=0.03,release_1=0.1,curve_1=(-6),preAmplitude_1=1.2,harmonic_1=1.2, oscsHarmonic_1=1.6,blend_1=0.333,oscsAmplitude_1=1,noiseRatio_1=0.4,noiseBottom_1=200,noisePeak_1=6900,rq_1=0.6, noiseamplitude_1=1,amplitude_2=0.3,attack_2=0.01,release_2=0.25,amplitude_3=0.6,attack_3=0.005,release_3=0.5, curve_3= -4,spreadRate_3=75,minDelay_3=0.025,maxDelay_3=0.05,decay_3=0.25,rq_3=0.4,blend_3=0.7,reverb_3=0.3,size_3 = 0.2,damp_3=1,out=0,pan=0,amplitude=1;
	var envOscs_1,envSweep_1,envNoise_1,oscs_1,noise_1,signal_1,noise_2,signal_2,envelope_2,envelope1_3, envelope2_3, signal_3, noise1_3, noise2_3, spread_3, spreadsignal_3, signal;

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
	oscs_1 = LFPulse.ar(freq: [envSweep_1,envSweep_1*oscsHarmonic_1], width: [0.5, 0.5], mul: [1 - blend_1, blend_1], add: [-0.5, -0.25]);
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

	spread_3 = LFNoise1.kr(spreadRate_3).range(minDelay_3, maxDelay_3);
	envelope1_3 = Env.perc(attackTime: attack_3 / 10, releaseTime: release_3 / 8, curve: [0, curve_3]).kr;
	envelope1_3 = CombC.ar(in: envelope1_3, maxdelaytime: maxDelay_3, delaytime: spread_3, decaytime: decay_3);
	noise1_3 = GrayNoise.ar(envelope1_3);
	noise1_3 = RHPF.ar(in: noise1_3, freq: 1000, rq: rq_3);
	noise1_3 = BPF.ar(in: noise1_3, freq: 2500, rq: 3);
	envelope2_3 = Env.perc(attackTime: attack_3, releaseTime: release_3, curve: [0, curve_3]).kr;
	noise2_3 = GrayNoise.ar(envelope2_3);
	noise2_3 = RHPF.ar(in: noise2_3, freq: 1000, rq: rq_3);
	noise2_3 = BPF.ar(in: noise2_3, freq: 1600, rq: 0.9);
	signal_3 = Mix.ar((blend_3 * noise1_3) + ((1 - blend_3) * noise2_3));
	signal_3 = (signal_3 * 2).softclip;
	signal_3 = FreeVerb.ar(in: signal_3, mix: reverb_3, room: size_3, damp: damp_3, mul: amplitude_3);
	DetectSilence.ar(in: signal_3, doneAction: 2);

	signal = Mix.ar([signal_1, signal_2, signal_3*0.6]);

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
		1, 0, 0, 1,
		0, 1, 0, 0,
		0, 0.6, 0.95, 0,
		0, 1, 0, 0,
		1, 0, 0, 1,
		0, 0, 1, 0,
		0, 1, 0, 1,
		0, 1, 0, 1,
	], inf).asStream;

  kick_duration = Pseq(
	[
		1/2
	], inf).asStream;

  snare = Pseq(
	[
		0, 0, 0, 0,
		0, 0, 0, 1,
		0, 0, 0, 0,
		0, 0, 0, 1,
		0, 0, 0, 0,
		0, 0, 0, 1,
		0, 0.05, 0, 0,
		0, 0, 0, 1,
		0, 0, 0, 0,
		0, 0, 0, 1,
		0, 0, 0, 0,
		0, 0, 0, 1,
		0, 0, 0, 0,
		0, 0, 0, 1,
		0, 0, 0.6, 0,
		0.07, 0.06, 0.8, 0,
	], inf).asStream;

  snare_duration = Pseq(
	[
		1/2
	], inf).asStream;


  TempoClock.default.tempo = 93/60;

  k = Pbind(
	\instrument, \kick,
	\dur, kick_duration,
	\amplitude, kick*0.3,
  );

  s = Pbind(
	\instrument, \snare,
    \dur, snare_duration,
    \amplitude, snare*1.4
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