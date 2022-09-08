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

1. Clone the project repository locally with the following command:
```ruby
git clone https://github.com/nikolaStanojkovski/SYNTHesized.git
```
2. Enter the <b>Mix</b> folder, and then create a <b>Stems</b> folder inside it.
3. Download all the <i>audio <b>.wav</b></i> files from the following <a href="https://drive.google.com/drive/folders/1QoowgxKT6yO1_UKBS_Y0a0VO95JdAb_w?usp=sharing">Link</a>
4. Move all of the <i>audio <b>.wav</b></i> files you downloaded to the <b>Stems</b> folder. 
5. Use <b>SuperCollider</b> to open the ``` mix_master.scd ``` file, which is located inside the <b>Mix</b> folder. 
6. Go to the toolbar and select ``` Edit -> Replace ```, or simply press ``` Ctrl + R ``` to open the <i>Replace</i> window. 
7. Replace all ``` <LOCAL_REPOSITORY_PATH> ``` string instances with the local path to the repository where the project was previously cloned. 
8. Start the server, then run the ``` synthesized_master ``` synth-definition code, followed by the synth called on the last line of the ``` mix_master.scd ``` file:
```ruby
Synth(\synthesized_master);
```
9. Enjoy the music.
