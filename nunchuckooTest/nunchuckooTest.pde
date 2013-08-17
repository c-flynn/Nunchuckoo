// Access the arduino + nunchuck control data
import processing.serial.*;

// ASCII code 10 denotes a line feed
final int LINE_FEED = 10;
// NOTE: The baud rate set on the arduino, in this code and the connected computer must be the same
final int BAUD_RATE = 19200;
float angleX = 0.0f;
float angleY = 0.6f;

Serial arduinoPort;

void setup(){
  size(400,300,P3D);
    try{
    // Checks ports to see if a serial device is connected
    String[] ports = Serial.list();
    if(ports.length < 1){
      println("NOTICE: uh oh....your serial list is empty.  You don't appear to have your arduino and nunchuck connected!" + '\n');
    }
    else{  
      println("NOTICE: serial list is : ");
      println(ports);
      println("If your nunchuck and arduino are plugged in and not working, go to https://github.com/c-flynn/Nunchuckoo/issues for more help");
      // The printed serial list you should be able to determine which port your nunchuck is plugged into
      // This will help you determine which array index number needs to be used for serial.list()array below
      arduinoPort = new Serial(this, Serial.list()[0], BAUD_RATE);
      arduinoPort.bufferUntil(LINE_FEED);
    }
  }
  catch(Exception e){
    println(e);
    println("NOTICE: Could not run nunchuckoo! Ensure that your wii nunchuck and arduino are connected correctly" + '\n');
  }    
}

void draw(){
  // Clear the screen     
  background(0);
  lights();  
  
  // Draw Box  
  noStroke();
  fill(204);
  translate(200,150,0);
  rotateY(angleY);
  rotateX(angleX);
  box(100);
}  

 //-------------------------------------------------------------  
 // Arduino + nunchuck actions read, interpreted and broadcasted
 void serialEvent(Serial port) {
   final String arduinoData = port.readStringUntil(LINE_FEED);
   if (arduinoData != null) {
     final int[] data = int(split(trim(arduinoData), ' '));
     if (data.length == 7) {
       // data[0] is joystick left/right
       // data[1] is joystick forward/back
       // data[2] is Tilt left/right
       // data[3] is Tilt forward/back
       // data[4] is not currently used
       // data[5] is z button
       // data[6] is c button
     if (data[0] < 60) {
       //Turn Box Left
       angleY -= 0.02f;
     }
     else if(data[0] > 190) {
       //Turn Box Right
       angleY += 0.02f;
     }
     else if(data[1] > 190) {
       //Turn Box Up
       angleX += 0.02f;
     }
     else if(data[1] < 60) {
       //Turn Box Down
       angleX -= 0.02f;
     }
     //The z button has to be pressed for tilt left to work
     else if (data[2] < 400 && data[5] == 1) {
       //Turn Box Left
       angleY -= 0.02f;
     }
     //The z button has to be pressed for tilt right to work
     else if(data[2] > 600 && data[5] == 1) {
       //Turn Box Right
       angleY += 0.02f;
     }
     //The z button has to be pressed for tilt forward to work
     else if(data[3] > 600 && data[5] == 1) {
       //Turn Box Up
       angleX += 0.02f;
     }
     //The z button has to be pressed for tilt back to work
     else if(data[3] < 450 && data[5] == 1) {
       //Turn Box Down
       angleX -= 0.02f;
     }
     // Resets Box Position
     else if(data[6] == 1){
       angleX = 0.0f;
       angleY =0.6f;
     }
    }
   }
 }


