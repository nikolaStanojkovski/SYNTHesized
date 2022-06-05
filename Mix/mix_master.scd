s.boot;
s.meter;


(
SynthDef.new(\synthesized_master, {
	arg out=0, buffer, rate=1, amplitude=1;
	var kick_buffer, snare_buffer, cymbals_buffer, bass_1_buffer, bass_1_octave_buffer, bass_2_buffer,
	bass_2_octave_buffer, filter_chords_buffer, pad_buffer,
	arp_1_buffer, arp_2_buffer, arp_3_buffer, downfilter_buffer, lead_1_1_buffer, lead_1_2_buffer, lead_1_3_buffer, lead_1_4_buffer,  lead_1_5_buffer, lead_2_1_buffer, lead_2_2_buffer, lead_2_3_buffer, lead_2_4_buffer, noise_hit_buffer, riser_1_buffer, riser_2_buffer, riser_3_buffer, upfilter_buffer, woosh_buffer,
	kick, snare, cymbals, bass_1, bass_1_octave, bass_2, bass_2_octave, filter_chords, pad,
	arp_1, arp_2, arp_3, downfilter, lead_1_1, lead_1_2, lead_1_3, lead_1_4, lead_1_5, lead_2, noise_hit, riser_1, riser_2, riser_3, upfilter, woosh, master;

	arp_1_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Arp 1.wav");
	arp_2_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Arp 2.wav");
	arp_3_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Arp 3.wav");
	bass_1_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Bass 1.wav");
	bass_1_octave_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Bass 1 Octave.wav");
	bass_2_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Bass 2.wav");
	bass_2_octave_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Bass 2 Octave.wav");
	downfilter_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Downfilter.wav");
	filter_chords_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Filter Chords.wav");
	cymbals_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Hats.wav");
	kick_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Kick.wav");
	lead_1_1_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Lead 1_1.wav");
	lead_1_2_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Lead 1_2.wav");
	lead_1_3_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Lead 1_3.wav");
	lead_1_4_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Lead 1_4.wav");
	lead_1_5_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Lead 1_5.wav");
	lead_2_1_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Lead 2_1.wav");
	lead_2_2_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Lead 2_2.wav");
	lead_2_3_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Lead 2_3.wav");
	lead_2_4_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Lead 2_4.wav");
	noise_hit_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Noise Hit.wav");
	pad_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Pad.wav");
	riser_1_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Riser 1.wav");
	riser_2_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Riser 2.wav");
	riser_3_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Riser 3.wav");
	snare_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Snare.wav");
	upfilter_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Upfilter.wav");
	woosh_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/Woosh.wav");

	kick = PlayBuf.ar(2, kick_buffer.bufnum, BufRateScale.kr(kick_buffer), doneAction: 2);
	// Kick processing here
	// kick = ...

	snare = PlayBuf.ar(2, snare_buffer.bufnum, BufRateScale.kr(snare_buffer), doneAction: 2);
	// Snare processing here
	// snare = ...

	cymbals = PlayBuf.ar(2, cymbals_buffer.bufnum, BufRateScale.kr(cymbals_buffer), doneAction: 2);
	// Cymbals processing here
	// cymbals = ...

	bass_1 = PlayBuf.ar(2, bass_1_buffer.bufnum, BufRateScale.kr(bass_1_buffer), doneAction: 2);
	// Bass 1 processing here
	// bass_1 = ...

	bass_1_octave = PlayBuf.ar(2, bass_1_octave_buffer.bufnum, BufRateScale.kr(bass_1_octave_buffer), doneAction: 2);
	// Bass 1 Octave processing here
	// bass_1_octave = ...

	bass_2 = PlayBuf.ar(2, bass_2_buffer.bufnum, BufRateScale.kr(bass_2_buffer), doneAction: 2);
	// Bass 2 processing here
	// bass_2 = ...

	bass_2_octave = PlayBuf.ar(2, bass_2_octave_buffer.bufnum, BufRateScale.kr(bass_2_octave_buffer), doneAction: 2);
	// Bass 2 Octave processing here
	// bass_2_octave = ...

	filter_chords = PlayBuf.ar(2, filter_chords_buffer.bufnum, BufRateScale.kr(filter_chords_buffer), doneAction: 2);
	// Bass Pad Octave processing here
	// filter_chords = ...

	pad = PlayBuf.ar(2, pad_buffer.bufnum, BufRateScale.kr(pad_buffer), doneAction: 2);
	// Pad processing here
	// pad = ...

	lead_1_1 = PlayBuf.ar(2, lead_1_1_buffer.bufnum, BufRateScale.kr(lead_1_1_buffer), doneAction: 2);
	// Lead 1_1 processing here
	// lead_1_1 = ...

	lead_1_2 = PlayBuf.ar(2, lead_1_2_buffer.bufnum, BufRateScale.kr(lead_1_2_buffer), doneAction: 2);
	// Lead 1_2 processing here
	// lead_1_2 = ...

	lead_1_3 = PlayBuf.ar(2, lead_1_3_buffer.bufnum, BufRateScale.kr(lead_1_3_buffer), doneAction: 2);
	// Lead 1_3 processing here
	// lead_1_3 = ...

	lead_1_4 = PlayBuf.ar(2, lead_1_4_buffer.bufnum, BufRateScale.kr(lead_1_4_buffer), doneAction: 2);
	// Lead 1_4 processing here
	// lead_1_4 = ...

	lead_1_5 = PlayBuf.ar(2, lead_1_5_buffer.bufnum, BufRateScale.kr(lead_1_5_buffer), doneAction: 2);
	// Lead 1_5 processing here
	// lead_1_5 = ...

	lead_2 = Mix([
		PlayBuf.ar(2, lead_2_1_buffer.bufnum, BufRateScale.kr(lead_2_1_buffer), doneAction: 2),
		PlayBuf.ar(2, lead_2_2_buffer.bufnum, BufRateScale.kr(lead_2_2_buffer), doneAction: 2),
		PlayBuf.ar(2, lead_2_3_buffer.bufnum, BufRateScale.kr(lead_2_3_buffer), doneAction: 2),
		PlayBuf.ar(2, lead_2_4_buffer.bufnum, BufRateScale.kr(lead_2_4_buffer), doneAction: 2)
	]);
	// Lead 2 processing here
	// lead_2 = ...

	arp_1 = PlayBuf.ar(2, arp_1_buffer.bufnum, BufRateScale.kr(arp_1_buffer), doneAction: 2);
	// Arp 1 processing here
	// arp_1 = ...

	arp_2 = PlayBuf.ar(2, arp_2_buffer.bufnum, BufRateScale.kr(arp_2_buffer), doneAction: 2);
	// Arp 2 processing here
	// arp_2 = ...

	arp_3 = PlayBuf.ar(2, arp_3_buffer.bufnum, BufRateScale.kr(arp_2_buffer), doneAction: 2);
	// Arp 3 processing here
	// arp_3 = ...

	riser_1 = PlayBuf.ar(2, riser_1_buffer.bufnum, BufRateScale.kr(riser_1_buffer), doneAction: 2);
	// Riser 1 processing here
	// riser_1 = ...

	riser_2 = PlayBuf.ar(2, riser_2_buffer.bufnum, BufRateScale.kr(riser_2_buffer), doneAction: 2);
	// Riser 2 processing here
	// riser_2 = ...

	riser_3 = PlayBuf.ar(2, riser_3_buffer.bufnum, BufRateScale.kr(riser_3_buffer), doneAction: 2);
	// Riser 3 processing here
	// riser_3 = ...

	upfilter = PlayBuf.ar(2, upfilter_buffer.bufnum, BufRateScale.kr(upfilter_buffer), doneAction: 2);
	// Upfilter processing here
	// upfilter = ...

	downfilter = PlayBuf.ar(2, downfilter_buffer.bufnum, BufRateScale.kr(downfilter_buffer), doneAction: 2);
	// Downfilter processing here
	// downfilter = ...

	noise_hit = PlayBuf.ar(2, noise_hit_buffer.bufnum, BufRateScale.kr(noise_hit_buffer), doneAction: 2);
	// Noise Hit processing here
	// noise_hit = ...

	woosh = PlayBuf.ar(2, woosh_buffer.bufnum, BufRateScale.kr(woosh_buffer), doneAction: 2);
	// Upfilter processing here
	// upfilter = ...


	master = Mix([
		kick, snare, cymbals, bass_1, bass_1_octave, bass_2, bass_2_octave, filter_chords, pad,
		lead_1_1, lead_1_2, lead_1_3, lead_1_4, lead_1_5, lead_2,  arp_1, arp_2, arp_3,
		riser_1, riser_2, riser_3, upfilter, downfilter, noise_hit, woosh
	]);
	// Master track processing here
	// master = ...

	Out.ar(out, master * amplitude);
}).add;
)


Synth(\synthesized_master);