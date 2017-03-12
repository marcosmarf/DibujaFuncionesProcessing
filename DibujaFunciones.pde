int offset;
float[] yvalues= new float[360*4];
int spacing =16;
int amp = 30;
int offSetX, offSetY;

void setup() {
  size(640, 360);
  calcFunction(amp);
  offSetY= height/2;
}


void draw() {
  fill(0, 60);
  rect(0, 0, width, height);
  offSetX+=12;
  renderFunction();
  println(frameRate);
}

// Calcula los yvalues en función de la amplitud 
// y el periodo
void calcFunction(int amp) {
  for(int x=0; x<360*4; x++){
    yvalues[x]=sin(radians(x/4))*amp;
  }
}

void renderFunction() {
  noStroke();
  fill(255);
  for ( int x=0; x<width; x+=16){
    ellipse(x,offSetY+yvalues[(offSetX+x)%360*4],15,15);
  }
}