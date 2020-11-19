// Attributes
float x = 300;
float y = 300;
float r = 200;

// Constructor
ClockHand secondHand = new ClockHand(255, 215, 0, 100, 20, second() * PI / 30, PI / 30);
ClockHand minuteHand = new ClockHand(192, 192, 192, 100, 25,(minute() + second() / 60) * PI / 30, PI / 1800);
ClockHand hourHand = new ClockHand(205, 127, 50, 100, 30,(hour() + minute() / 60) * PI / 6, PI / 21600);

void setup() {
	size(600, 600);
	frameRate(1);
}

void draw() {
	background(255);
	noStroke();
	fill(0,150);
	ellipse(300,300,8,8);
	
    secondHand.flow();
    minuteHand.flow();
    hourHand.flow();
	
}

class ClockHand { 
	float color1, color2, color3, color4, radius, theta, speed;
	float thetaDefault = 0; 
	ClockHand(color1, color2, color3, color4, radius, theta, speed) {  
		this.color1 = color1;
		this.color2 = color2;
		this.color3 = color3;
		this.color4 = color4;
		this.radius = radius;
		this.theta = theta;
		this.speed = speed;
	} 
	void flow() { 
		fill(this.color1, this.color2, this.color3, this.color4);
		ellipse(x + r * sin(thetaDefault + this.theta), y - r * cos(thetaDefault + this.theta), this.radius, this.radius);
		thetaDefault = thetaDefault + this.speed;
		if (thetaDefault == TWO_PI) {
			thetaDefault = 0;
		}
	}
} 
