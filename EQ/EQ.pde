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

float[] bg = {0,0,0};
float[] c1 = {53, 47, 74};
float[] c2 = {52, 28, 60};
float[] c3 = {52, 14, 47};

Scrollbar bg1;
Scrollbar bg2;
Scrollbar bg3;

Scrollbar c11;
Scrollbar c12;
Scrollbar c13;

Scrollbar c21;
Scrollbar c22;
Scrollbar c23;

Scrollbar c31;
Scrollbar c32;
Scrollbar c33;

float w0;
float h0;


boolean cMode = false;

public void setup() {
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 0);
  textSize(30);
  
  w0 = width/10.0;
  h0 = height/5.0;
  
  h1 = 3*height/10.0;
  h2 = 2*h1;
  h3 = 3*h1;
  
  k *= height;
  
  // Scrollbars (Edit Colors)
  bg1 = new Scrollbar(w0, 3.2*h0, int(h0), 5, 16);
  bg2 = new Scrollbar(w0, 3.6*h0, int(h0), 16, 16);
  bg3 = new Scrollbar(w0, 4.0*h0, int(h0), 16, 16);
  
  // Sound and FFT
  sample = new AudioIn(this, 0);
  
  sample.start();
   
  fft = new FFT(this, bands);
  
  fft.input(sample);
}

public void draw() {
  background(bg[0], bg[1], bg[2]);
  stroke(0, 0, 100);
  if (cMode) {
    bg1.update();
    
    fill(0,0,100);
    float displace = (h0-textWidth("Background"))/2.0;;
    text("Background", w0 + displace, h0);
    displace = (h0-textWidth("Bass"))/2.0;
    text("Bass", 4*w0 + displace, h0);
    displace = (h0-textWidth("Mid"))/2.0;
    text("Mid", 6*w0 + displace, h0);
    displace = (h0-textWidth("Treble"))/2.0;
    text("Treble", 8*w0 + displace, h0);
    
    fill(bg[0], bg[1], bg[2]);
    square(w0, 2*h0, h0);
    
    fill(c1[0], c1[1], c1[2]);
    square(4*w0, 2*h0, h0);
    
    fill(c2[0], c2[1], c2[2]);
    square(6*w0, 2*h0, h0);
    
    fill(c3[0], c3[1], c3[2]);
    square(8*w0, 2*h0, h0);
    
    for (int i = 0; i < 360; i++)
    {
      fill(i, 100, 100);
      stroke(i, 100, 100);
      circle(w0+i*(h0/360.0), 3.2*h0 + 10, 2);
      circle(4.0*w0+i*(h0/360.0), 3.2*h0 + 10, 2);
      circle(6.0*w0+i*(h0/360.0), 3.2*h0 + 10, 2);
      circle(8.0*w0+i*(h0/360.0), 3.2*h0 + 10, 2);
    }
    
    bg1.display();
  } else {
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
}

void keyPressed() {
  if (key == 'c' || key == 'C')
  {
    cMode = !cMode;
  }
}
