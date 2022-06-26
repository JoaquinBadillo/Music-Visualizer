import processing.sound.*;

SoundFile sample;
FFT fft;

int bands = 1024;
float barWidth;
float[] spectrum = new float[bands];

int counter = 0;

public void drawBezier() {
  // Draws top of a quaver
    
  beginShape();
    vertex(58.742039999999996, -83.70800000000003);
    bezierVertex(58.742039999999996, -83.70800000000003, 58.742039999999996, -399, 58.742039999999996, -399);
    bezierVertex(58.742039999999996, -399, 103.12899999999999, -399, 103.12899999999999, -399);
    bezierVertex(103.12899999999999, -399, 97.0419, -387.1041, 103.12899999999999, -378.0166);
    bezierVertex(109.2161, -368.9291, 114.7256, -361.0985, 121.1237, -353.0899);
    bezierVertex(121.1237, -353.0899, 152.99009999999998, -318.3866, 152.99009999999998, -318.3866);
    bezierVertex(162.72, -307.8394, 172.027, -296.448, 180.911, -284.214);
    bezierVertex(189.79500000000002, -271.97900000000004, 196.987, -257.846, 202.48600000000002, -241.814);
    bezierVertex(208.409, -225.782, 211.37, -206.797, 211.37, -184.859);
    bezierVertex(211.37, -165.03, 208.62, -146.467, 203.121, -129.16899999999998);
    bezierVertex(198.044, -111.87200000000001, 190.006, -95.418, 179.007, -79.80799999999999);
    bezierVertex(179.007, -79.80799999999999, 163.143, -79.80799999999999, 163.143, -79.80799999999999);
    bezierVertex(170.335, -96.262, 175.623, -112.08300000000003, 179.007, -127.27100000000002);
    bezierVertex(182.392, -142.88099999999997, 184.084, -157.225, 184.084, -170.303);
    bezierVertex(184.084, -190.132, 180.488, -206.797, 173.296, -220.297);
    bezierVertex(166.527, -234.22, 157.855, -245.189, 147.2789, -253.205);
    bezierVertex(132.3076, -264.598, 118.5488, -266.05899999999997, 103.12899999999999, -270.717);
    bezierVertex(103.12899999999999, -270.717, 103.12899999999999, -0.009999999999990905, 103.12899999999999, -0.009999999999990905);
}

public void setup() {
  size(1920, 1080);
  colorMode(HSB, bands, 100, 100);
  background(0, 0, 0);
  
  // Sound and FFT
  sample = new SoundFile(this, "./data/sound.mp3");
  sample.play();
  fft = new FFT(this, bands);
  fft.input(sample);
}

public void draw() {
  translate(width/2, height/2 + 100);
  background(0, 0, 0);
  strokeWeight(3);
  stroke(counter, 100, 100);
  noFill();
  
  fft.analyze();

  int i = 0;
  
  drawBezier();
  
  while (i < bands/8) {
    float rad = 40*i*PI/(3*bands);
    
    float r = fft.spectrum[i] * 100 + 105;
    
    float x = r * cos(rad);
    float y = r * sin(rad);
    
    curveVertex(x, y);
    
    i++;
  }
  vertex(58.37204, -83.8988); 
  endShape(); 
  
  if (counter == bands)
  {
    counter = -1;
  }
  
  counter++;
  
}
