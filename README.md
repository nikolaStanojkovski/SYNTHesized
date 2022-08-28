# SYNTHesized

<hr />

## Computer Sound and Music (CSAM) Project by:
### <i>Nikola Stanojkovski, Rade Bikovski, Leon Spremo, Jovana Chaloska, Andrej Slavejkov, Borjan Gagovski & Marko Petrushev</i>

<hr />

A music project intended to create a whole <b>'synthwave'</b> song only with generated sounds and synths, as well as sampled processed recordings. The sounds are generated, sampled and processed with the help of <b>SuperCollider</b> as a main environment and programming language. The sounds are arranged and recorded with <b>DAWs</b> (Digital Audio Workstations) such as <b>Ableton and Cubase</b>. 

<b>Form:</b>
<i> Intro + Verse + Prechorus 1 + Pause + Chorus + Prechorus 2 + Pause + Chorus + Outro </i>

<hr />

## Local setup

<hr />

1. Clone the project resository locally with the following command:
```ruby
git clone https://github.com/nikolaStanojkovski/SYNTHesized.git
```
2. Enter the <b>Mix</b> folder, and then create a <b>Stems</b> folder inside it.
3. Download all the audio <i>wave</i> files from the <a href="https://drive.google.com/drive/folders/1QoowgxKT6yO1_UKBS_Y0a0VO95JdAb_w?usp=sharing">Google Drive Link</a>.
3. Copy all the downloaded audio files to the <b>Stems</b> folder.
4. Open up the ``` mix_master.scd ``` file in <b>SuperCollider</b>, which is located inside the <b>Mix</b> folder.
5. Open up the <i>Replace</i> window with navigating to the toolbar with ``` Edit -> Replace ```, or just use the shortcut ``` Ctrl + R ```.
6. Replace all string instances of ``` <LOCAL_REPOSITORY_PATH> ``` with your local path to the repository where the project was cloned.
7. Boot the server, run the ``` synthesized_master ``` synth-definition code, and then run the synth, which is being called on the last line of the ``` mix_master.scd ``` file:
```ruby
Synth(\synthesized_master);
```
8. Enjoy the music.
