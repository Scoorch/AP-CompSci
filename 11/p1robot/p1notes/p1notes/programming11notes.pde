// Trevor Chen
// 2-2
// 23/2/6

size(600, 600);            // (x, y)
background(199, 161, 219); // (r, g, b)
// ; at end to finish 
// 0, 0 at top right, no negative coords
// a = transparency
// general form: functionName(arg1, arg2, arg3, ...):

// shapes:
strokeWeight(5);                     // thicc outside lines, expands both directions
stroke(9, 109, 227, 100);            // (r, g, b, a) noStroke(); removes stroke
fill(4, 170, 201, 100);              // (r, g, b, a) fills to middle of stroke
rect(10, 10, 60, 60, 10);            // (x, y, w, h, c) xy top left corner, c rounded corners
ellipse(110, 40, 60, 60);            // (x, y, w, h) xy center
circle(110, 40, 60);                 // (x, y, t) t thickness (h and w)
line(150, 10, 210, 10);              // (x1, y1, x2, y2)
triangle(220, 60, 250, 10, 280, 60); // (x1, y1, x2, y2, x3, y3)

beginShape();    // begins polygon
vertex(290, 10); // (x, y)
vertex(290, 60);
vertex(310, 39);
vertex(320, 39);
vertex(340, 60);
vertex(340, 10);
vertex(320, 31);
vertex(310, 31);
vertex(290, 10);
endShape();
fill(200, 200, 0, 100); //r, g, b, transparency
