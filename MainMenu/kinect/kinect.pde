import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;



KinectTracker tracker; 
Kinect kinect; 
void setup() { 
size(640,480);

// Along with making our new kinect object reference, we're making a kinect tracker!

kinect = new Kinect(this);
tracker = new KinectTracker(); 
}

void draw() { 
background(255); 

// initialize the tracking analysis

tracker.track(); 

// Shows the depth image so we can see what it's doing

tracker.display();

// Let's draw a circle at the raw location

PVector v1 = tracker.getPos();
fill(50,100,250,200); 
noStroke(); 
ellipse(v1.x,v1.y,20,20);
}
