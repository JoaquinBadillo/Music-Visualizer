import processing.sound.*;

AudioIn sample;
FFT fft;

int bands = 1024;
float[] spectrum = new float[bands];

float w;

float k = 20/(4*log(10));

int n0;
int n;
int nBands;

float h1;
float h2;
float h3;

int counter = 0;

public void setup() {
  size(1920, 980);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 0);
  
  h1 = height/3.0;
  h2 = 2*h1;
  h3 = height;
  
  k *= height;
  
  // Sound and FFT
  sample = new AudioIn(this, 0);
  
  sample.play();
   
  fft = new FFT(this, bands);
  
  fft.input(sample);
}

public void draw() {
  background(0, 0, 0);
  stroke(0, 0, 100);
  
  fft.analyze(spectrum);

  n0 = 0;
  n = 40;
  nBands = n - n0;
  
  for (int i = n0; i < n; i++)
  {
    w = width/float(nBands);
    fill(53, 47, 74);
    
    float h = k*log(spectrum[i]+1);
    
    rect(w*(i-n0), h1, w, -h -20);
  }
  
  n0 = 15;
  n = 250;
  nBands = n - n0;

  for (int i = n0; i < n; i++)
  {
    w = width/float(nBands);
    fill(52, 28, 60);
    
    float h = k*log(spectrum[i]+1);
    
    rect(w*(i-n0), h2, w, -h - 20);
  }
  
  n0 = 250;
  n = bands/2;
  nBands = n - n0;

  for (int i = n0; i < n; i++)
  {
    w = width/float(nBands);
    fill(52, 14, 47);
    
    float h = k*log(spectrum[i]+1);
    
    rect(w*(i-n0), h3, w, -h - 20);
  }
}
