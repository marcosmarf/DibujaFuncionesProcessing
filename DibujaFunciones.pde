int offset;
float[] yvalues= new float[360*4];
int spacing =16;
int amp = 60;
int offSetX, offSetY;

void setup() {
  size(640, 360);
  pulseWave(amp, 1);
  offSetY= height/2;
}


void draw() {
  fill(0, 60);
  rect(0, 0, width, height);
  offSetX+=6;
  renderFunction();
}

// Calcula los yvalues en función de la amplitud 
// y el periodo
void sineWave(int amp, float period) {
  for (int x=0; x<360*4; x++) {
    yvalues[x]=sin(radians((x/4)*period))*amp;
  }
}

// falta el periodo
void rampWave(int amp, float period) {
  for (int x=0; x<360*4; x++) {
    yvalues[x]=((float(x)/(4*360))*amp);
    println(yvalues[x]);
  }
}

void pulseWave(int amp, float period) {
  for (int x=0; x<360*4; x++) {
    if (sin(radians((x/4)*period))>0)  yvalues[x]=amp;
    else yvalues[x]=0;
  }
}

void renderFunction() {
  noStroke();
  fill(255);
  for ( int x=0; x<width; x+=16) {
    ellipse(x, offSetY+yvalues[(offSetX+x)%360*4], 15, 15);
  }
}

void keyReleased(){
  if( key =='a') pulseWave(amp, 1);
  if( key =='b') sineWave(amp, 1);
  if( key =='c') rampWave(amp, 1);
}