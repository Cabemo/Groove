import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

class KinectTracker { 
// Size of kinect 
int kw = 640;
int kh = 480; 
// this is the depth range, distance past which we will ignore all pixels 
int threshold= 700;
// Raw location 
PVector loc; 
// Interpolated location
PVector lerpedLoc;
// Depth data 
int[] depth; 
PImage display;
float count;

/// init constructor 
KinectTracker() {
kinect.initDepth(); 
// We could skip processing the grayscale image for efficiency 
// but this example is just demonstrating everything 
display = createImage(width,height,PConstants.RGB); 
loc = new PVector(0,0);
lerpedLoc = new PVector(0,0); 
}

void track() { 
// Get the raw depth as array of integers
depth = kinect.getRawDepth();
// Being overly cautious here, doing a "null" check
if (depth == null) return; 
float sumX = 0;
float sumY = 0; 
count = 0;
for(int x = 0; x < kw; x++) { 
for(int y = 0; y < kh; y++) { 
// Mirroring the image 
int offset = kw-x-1+y*kw; 
// Grabbing the raw depth 
int rawDepth = depth[offset]; 
// Testing the raw depth against threshold -- if it's less than the threshold, don't bother!
if (rawDepth < threshold) { 
sumX += x; sumY += y; count++; 
} 
} 
} 
// As long as we found something
if (count != 0) { 
loc = new PVector(sumX/count,sumY/count); 
} 
// Interpolating the location, doing it arbitrarily for now 
lerpedLoc.x = PApplet.lerp(lerpedLoc.x, loc.x, 0.3f); 
lerpedLoc.y = PApplet.lerp(lerpedLoc.y, loc.y, 0.3f); 
} 
PVector getLerpedPos() {
return lerpedLoc; 
} 
PVector getPos() {
return loc; 
}

/// now let's display some data!

void display() { 
PImage img = kinect.getDepthImage(); 
// Being overly cautious here 
if (depth == null || img == null) return; 
// Going to rewrite the depth image to show which pixels are in threshold 
// A lot of this is redundant, but this is just for demonstration purposes 
display.loadPixels();
for(int x = 0; x < kw; x++) { 
for(int y = 0; y < kh; y++) { 
// mirroring image 
int offset = kw-x-1+y*kw; 
// Raw depth 
int rawDepth = depth[offset];
int pix = x + y * display.width;

// if the pixel data falls within the threshold, make them red!
map(pix, 0, 326399, 0, width*height);
if (rawDepth < threshold) {
display.pixels[pix] = color(#e67e22); 
} else { 
display.pixels[pix] = color(0); 
} 
} 
}

display.updatePixels(); 
// Draw the image
image(display,0,0); 
}
// stop it!

void quit() { 
kinect.stopDepth(); 
} int getThreshold() { 
return threshold; 
}

//// set the depth threshold # 
//// this is abitrary-- but we could make this a function called from the main class... hmm...

void setThreshold(int t) {

threshold = t; 
}
float getCount() {
  return count;
}
}
