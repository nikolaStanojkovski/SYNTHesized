s.boot;
s.meter;

(
SynthDef.new(\synthesized_master, {
	arg out=0, buffer, rate=1, amplitude=1;
	var kick_buffer, snare_buffer, cymbals_buffer, bass_1_buffer, bass_1_octave_buffer, bass_2_buffer,
	bass_2_octave_buffer, filter_chords_buffer, pad_buffer,
	arp_1_buffer, arp_2_buffer, arp_3_buffer, downfilter_buffer, lead_1_1_buffer, lead_1_2_buffer, lead_1_3_buffer, lead_1_4_buffer,  lead_1_5_buffer, lead_2_1_buffer, lead_2_2_buffer, lead_2_3_buffer, lead_2_4_buffer, noise_hit_buffer, riser_1_buffer, riser_2_buffer, riser_3_buffer, upfilter_buffer, woosh_buffer,
	kick, kick_1, kick_2, snare, cymbals, bass_1, bass_1_octave, bass_2, bass_2_octave, filter_chords, pad,
	arp_1, arp_2, arp_3, downfilter, lead_1_1, lead_1_2, lead_1_3, lead_1_4, lead_1_5, lead_1, lead_2, noise_hit, riser_1, riser_2, riser_3, upfilter, woosh, drums_buss, bass_buss, pads_buss, leads_buss, arps_buss, fx_buss, master;

	kick_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 01. KICK.wav");
	snare_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 02. SNARE.wav");
	cymbals_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 03 .HATS.wav");
	bass_1_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 04. BASS 1.wav");
	bass_1_octave_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 05. BASS 1 OCT.wav");
	bass_2_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 06. BASS 2.wav");
	bass_2_octave_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 07. BASS 2 OCT.wav");
	filter_chords_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 08. FILTER CHORDS.wav");
	pad_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 09. PAD.wav");
	lead_1_1_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 10. LEAD 1.wav");
	lead_1_2_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 11. LEAD 1.wav");
	lead_1_3_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 12. LEAD 1.wav");
	lead_1_4_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 13. LEAD 1.wav");
	lead_1_5_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 14. LEAD 1.wav");
	lead_2_1_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 15. LEAD 2.wav");
	lead_2_2_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 16. LEAD 2.wav");
	lead_2_3_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 17. LEAD 2.wav");
	lead_2_4_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 18. LEAD 2.wav");
	arp_1_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 19. ARP 1.wav");
	arp_2_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 20. ARP 2.wav");
	arp_3_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 21. ARP 3.wav");
	upfilter_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 22. UPLIFTER.wav");
	downfilter_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 23. DOWNLIFTER.wav");
	noise_hit_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 24. NOISE HIT.wav");
	woosh_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 25. WOOSH.wav");
	riser_1_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 26. RISER 1.wav");
	riser_2_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 27 RISER 2.wav");
	riser_3_buffer = Buffer.read(s, "C:/Users/Nick/Documents/GitHub/SYNTHesized/Mix/Stems/SYNTHesized 28. RISER 3.wav");



	///////////////////////////////////////////////////////
	///////////////////////////////////////////////////////
	///////////////////// PROCESSING //////////////////////
	///////////////////////////////////////////////////////
	///////////////////////////////////////////////////////


	// Kick processing
	kick_1 = PlayBuf.ar(2, kick_buffer.bufnum, BufRateScale.kr(kick_buffer), doneAction: 2);
	kick_2 = PlayBuf.ar(2, kick_buffer.bufnum, BufRateScale.kr(kick_buffer), doneAction: 2);
	kick_1 = BPeakEQ.ar(kick_1, freq: 136.63, rq: 0.67, db: -3.18);
	kick_1 = BPeakEQ.ar(kick_1, freq: 476.94, rq: 1, db: -6.86);
	kick_1 = BPeakEQ.ar(kick_1, freq: 5384.4, rq: 1.87, db: 6.86);
	kick_1 = BPeakEQ.ar(kick_1, freq: 7591.6, rq: 0.4, db: -9.06);
	kick_2 = BHiPass.ar(kick_2, freq: 17.728, rq: 1);
	kick_2 = BPeakEQ.ar(kick_2, freq: 52.116, rq: 1, db: 2.7);
	kick_2 = BLowPass.ar(kick_2, freq: 76.339, rq: 0.86);
	kick_2 = AnalogVintageDistortion.ar(kick_2, bias: 0.7, drivegain: 0.25, lowgain: 0.07, highgain: 0.06);
	kick = Mix([kick_1, kick_2]);
	kick = DCompressor.ar(kick, sidechain: 0, ratio: 4, threshold: -24.1, attack: 30, release: 41.1, automakeup: 0);
	kick = BHiPass.ar(kick, freq: 31.429, rq: 0.7);
	kick = BPeakEQ.ar(kick, freq: 49.256, rq: 1.31, db: 2.45);
	kick = BPeakEQ.ar(kick, freq: 351.44, rq: 2.75, db: -3.92);
	kick = BPeakEQ.ar(kick, freq: 7519.5, rq: 2.22, db: 3.02);


	// Snare processing
	snare = PlayBuf.ar(2, snare_buffer.bufnum, BufRateScale.kr(snare_buffer), doneAction: 2);
	snare = BHiPass.ar(snare, freq: 88.088, rq: 0.98);
	snare = BPeakEQ.ar(snare, freq: 132.78, rq: 0.47, db: 11.2);
	snare = BPeakEQ.ar(snare, freq: 1053, rq: 0.53, db: -4.08);
	snare = BPeakEQ.ar(snare, freq: 6272.6, rq: 0.27, db: -2.4);
	snare = BLowPass.ar(snare, freq: 10200, rq: 0.93);
	snare = DCompressor.ar(snare, sidechain: 0, ratio: 4, threshold: -35, attack: 31.1, release: 6.35, automakeup: 0);


	// Cymbals processing
	cymbals = PlayBuf.ar(2, cymbals_buffer.bufnum, BufRateScale.kr(cymbals_buffer), doneAction: 2);
	cymbals = BPeakEQ.ar(cymbals, freq:  5036.5, rq: 0.59, db: -2.78);
	cymbals = BLowPass.ar(cymbals, freq: 13458, rq: 0.77);

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
	filter_chords = Greyhole.ar(filter_chords,delayTime: 0.003,feedback:0,modDepth: 0.0037,modFreq:0.54);
	filter_chords = FreeVerb.ar(filter_chords, mix: 0.44);
	filter_chords = DCompressor.ar(filter_chords, ratio: 2.46, attack: 0.42, release: 100, threshold: -22.9);
	filter_chords = BHiPass.ar(filter_chords, freq: 64.908, rq: 1.11);
	filter_chords = BPeakEQ.ar(filter_chords, freq: 368.61, rq: 1, db: -1.88);
	filter_chords = BPeakEQ.ar(filter_chords, freq: 870.09, rq: 1, db: -3.10);

	pad = PlayBuf.ar(2, pad_buffer.bufnum, BufRateScale.kr(pad_buffer), doneAction: 2);
	pad = Greyhole.ar(pad, delayTime: 0.003,feedback:0,modDepth: 0.0025, modFreq:0.47);
	pad = FreeVerb.ar(pad, mix: 0.60);
	pad= DCompressor.ar(pad, ratio: 2.46, attack: 0.42, release: 100, threshold: -34);

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


	lead_1 = Mix([
		lead_1_1, lead_1_2, lead_1_3, lead_1_4, lead_1_5
	]);
	
	
	lead_1 = Greyhole.ar(lead_1,delayTime: 0.003,feedback:0.32,modDepth: 0.005,modFreq:0.41);
	
	lead_1 = FreeVerb.ar(lead_1, mix: 0.4);
	
	// Lead_1 processing
	lead_1 = BHiPass.ar(lead_1, freq: 180.19, rq: 1.03);
	lead_1 = BPeakEQ.ar(lead_1, freq: 798.48, rq: 0.331, db: -1.63);
	lead_1 = BPeakEQ.ar(lead_1, freq: 4323.3, rq: 1.029, db: 1.8);

	lead_2 = Mix([
		PlayBuf.ar(2, lead_2_1_buffer.bufnum, BufRateScale.kr(lead_2_1_buffer), doneAction: 2),
		PlayBuf.ar(2, lead_2_2_buffer.bufnum, BufRateScale.kr(lead_2_2_buffer), doneAction: 2),
		PlayBuf.ar(2, lead_2_3_buffer.bufnum, BufRateScale.kr(lead_2_3_buffer), doneAction: 2),
		PlayBuf.ar(2, lead_2_4_buffer.bufnum, BufRateScale.kr(lead_2_4_buffer), doneAction: 2)
	]);

	 lead_2 = Greyhole.ar(lead_2,delayTime: 0.003,feedback:0,modDepth: 0.0037,modFreq:0.54);
	 
	 // Lead 2 processing here
	 lead_2 = BHiPass.ar(lead_2, freq: 178.48, rq: 1.259);
	 lead_2 = BPeakEQ.ar(lead_2, freq: 1456.7, rq: 1, db: -1.96);
	 lead_2 = BPeakEQ.ar(lead_2, freq: 6272.6, rq: 1, db: 1.55);
	

	lead_2 = Greyhole.ar(lead_2,delayTime: 0.003,feedback:0,modDepth: 0.0037,modFreq:0.54)
	lead_1= FreeVerb.ar(lead_1, mix: 0.43)

	// Lead 2 processing here
	lead_2 = BHiPass.ar(lead_1, freq: 178.48, rq: 0.794);
	lead_2= BPeakEQ.ar(lead_1, freq: 1456.7, rq: 1, db: -1.96);
	lead_2= BPeakEQ.ar(lead_1, freq: 6272.6, rq: 1, db: 1.55);


	arp_1 = PlayBuf.ar(2, arp_1_buffer.bufnum, BufRateScale.kr(arp_1_buffer), doneAction: 2);
	arp_1 = BPeakEQ.ar(arp_1, freq: 319.45, rq: 0.522, db: -2.61)

	arp_2 = PlayBuf.ar(2, arp_2_buffer.bufnum, BufRateScale.kr(arp_2_buffer), doneAction: 2);
	arp_2 = BPeakEQ.ar(arp_2, freq: 338.28, rq: 0.603, db: -2.78)
	arp_2 = BPeakEQ.ar(arp_2, freq: 1226.8, rq: 1.283, db: 1.63)

	arp_3 = PlayBuf.ar(2, arp_3_buffer.bufnum, BufRateScale.kr(arp_3_buffer), doneAction: 2);


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



	///////////////////////////////////////////////////////
	///////////////////////////////////////////////////////
	//////////////////////// BUSSES ///////////////////////
	///////////////////////////////////////////////////////
	///////////////////////////////////////////////////////

	drums_buss = Mix([
		kick, snare, cymbals
	]);
	drums_buss = BHiPass.ar(drums_buss, freq: 27.498, rq: 0.93);
	drums_buss = BPeakEQ.ar(drums_buss, freq: 129.03, rq: 0.55, db: -1.22);
	drums_buss = BPeakEQ.ar(drums_buss, freq: 348.10, rq: 0.42, db: -2.53);
	drums_buss = BPeakEQ.ar(drums_buss, freq: 7200, rq: 1.3, db: 1);
	drums_buss = BLowPass.ar(drums_buss, freq: 16134, rq: 1.1);
	drums_buss = FreeVerb.ar(drums_buss, mix: 0.4, room: 0.8, damp: 1);
	drums_buss = DCompressor.ar(drums_buss, sidechain: 0, ratio: 3.82, threshold: -26, attack: 28.3, release: 24.8, automakeup: 0);


	bass_buss = Mix([
		bass_1, bass_1_octave, bass_2, bass_2_octave
	]);

	pads_buss = Mix([
		filter_chords, pad
	]);
	pads_buss = BHiPass.ar(pads_buss, freq: 104.60, rq: 1.42);
	pads_buss = BPeakEQ.ar(pads_buss, freq: 605.45, rq: 1, db: -1.88);
	pads_buss = BPeakEQ.ar(pads_buss, freq: 5701.7, rq: 1.61, db: 1.96);
	pads_buss = BLowPass.ar(pads_buss, freq: 13718, rq: 1.15);

	leads_buss = Mix([
		lead_1_1, lead_1_2, lead_1_3, lead_1_4, lead_1_5, lead_2
	]);
	leads_buss= BPeakEQ.ar(leads_buss, freq: 1180.8, rq: 1.279, db: -2.29);
	leads_buss= BPeakEQ.ar(leads_buss, freq: 7737.9, rq: 0.512, db: 2.29);
	leads_buss = BLowPass.ar(leads_buss, freq: 21278, rq: 1);


	arps_buss = Mix([
		arp_1, arp_2, arp_3
	]);
	arps_buss = BHiPass.ar(arps_buss, freq: 139.27, rq: 1.298);
	arps_buss= BPeakEQ.ar(arps_buss, freq: 500.25, rq: 0.829, db: -5.39);
	arps_buss= BPeakEQ.ar(arps_buss, freq: 5980.3, rq: 1, db: 1.8);
	arps_buss = BLowPass.ar(arps_buss, freq: 11443, rq: 1.03);
	arps_buss = DCompressor.ar(arps_buss, ratio: 3.07, threshold: -27, attack: 7.89, release: 50, makeup: 0.5)


	fx_buss = Mix([
		riser_1, riser_2, riser_3, upfilter, downfilter, noise_hit, woosh
	]);

	master = Mix([
		drums_buss, bass_buss, pads_buss,
		leads_buss, arps_buss, fx_buss
	]);
	// Master track processing here
	// master = ...

	Out.ar(out, master * amplitude);
}).add;
)


Synth(\synthesized_master);
