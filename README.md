# Music-Visualizer ♪💻

## Author
Joaquín Badillo

## Contents
This repository cotains a frequency domain visualization, made with Processing and the FFT.

### Visualizer
To use it you just need to have an mp3 file of an audio/song you like; if you don't want to play that much with the code you can just name the file `sound.mp3` and save it on the `./Visualizer/data` directory (overwrite the current file), you can also use the one I chose to play around. To look at the visualization just run the `Visualizer.pde` program and click on the run button.

Note: You will need to have Processing installed in your computer - [download here](https://processing.org/download).

**Credits (Default song)**

**Song**: Egzod, Maestro Chives, Neoni - Royalty [NCS Release]

Music provided by NoCopyrightSounds.

**Free Download/Stream**: [Download link](http://ncs.io/Royalty)

**Watch**: [Video link](http://youtu.be/C5fLxtJH2Qs)

### EQ and Equalizer
This are work in progress, the idea is to use an input device (like your microphone or LineIn) to acquire display a barplot of the frequency domain like one would see in an Equalizer. I'm currently working on an interface to set the colors for the EQ project, to access these settings you will need to press 'c' on your keyboard, which will change the inerface to color mode where you will be able to move sliders to change the Hue, Saturation and Brightness of the different colors used.
