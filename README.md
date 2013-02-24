Nunchuckoo
==========

Adapt a Wii Nunchuck to work with Arduino and Processing

![Nunchuckoo](https://dl.dropbox.com/u/29093681/Nunchuckoo.jpg)

This project was developed primarily to get a Wii Nunchuck working with it's sister project [SCRAPE](https://github.com/c-flynn/SCRAPE) but can be applied to any Processing sketch. Click the image below to see Nunchuckoo in action with SCRAPE:

[ ![Image](https://dl.dropbox.com/u/29093681/SCRAPE-in-a-CAVE.jpg "SCRAPE in a CAVE") ](https://www.youtube.com/watch?v=Wz4LDeIwH18 "SCRAPE In A CAVE")


Setup
=====
The following instructions demonstrate how to get a Wii Nunchuck working with a Processing sketch.  The code repository also contains a basic sketch in order to test the Nunchuck and to demonstrate how the different Nunchuck controls can work within a sketch.

Step 1
------
Firstly you will need to obtain the following items:  
* A Wii Nunchuck.  
* An [Arduino board](http://arduino.cc/en/Main/Products). For this project I used an Arduino Duemilanove but you should be able to use newer versions such as an Arduino UNO.  
* The [Arduino software](http://arduino.cc/en/Main/Software).  
* A [WiiChuck adapter](http://todbot.com/blog/2008/02/18/wiichuck-wii-nunchuck-adapter-available).  Alternatively you can attach breadboard wires directly to the Nunchuck and Arduino.  If attaching the board directly, this [image link](http://www.instructables.com/files/deriv/FOA/0I6U/GFRWRNI0/FOA0I6UGFRWRNI0.LARGE.jpg) shows the connections that need to be made.  For this project I used the WiiChuck adapter.  
* A USB printer cable to connect your Arduino to a computer.  
* A copy of [Processingv1.5.1](http://processing.org/download/) installed on the connecting computer.   

Step 2
------
If you're new to Arduino go to the [Getting Started](http://arduino.cc/en/Guide/HomePage) page of the Arduino website and follow the setup instructions for your particular OS.  As a general rule it is a good idea to test that you can get your Arduino's onboard LED to blink on and off to ensure that it is setup correctly.  This is the most basic program you can run on an Arduino and simple instructions can be found [here](http://arduino.cc/en/Tutorial/Blink)   

Step 3
------
Connect your Wii Nunchuck to your arduino board.

If you are using a [WiiChuck adapter](http://todbot.com/blog/2008/02/18/wiichuck-wii-nunchuck-adapter-available). The following image should help you to connect your Nunchuck to your Arduino:

![Connect Nunchuck and Arduino](https://dl.dropbox.com/u/29093681/connection.jpg)  
Black Wire - Arduino Gnd  
Red Wire - Arduino 3V3  
White Wire - Arduino Analog 4  
Grey Wire - Arduino Analog 5

Step 4
------
Connect the Arduino to your computer via a USB printer cable and launch the Arduino software.  

Now we need to upload some code on to the Arduino board which will be able to read the data from the Nunchuck controller and pass it back in a readable format to your computer.  Code to do this is available from the [pragmatic programmers website](http://pragprog.com/titles/msard/source_code) as part of the excellent book [Arduino: A Quick Start Guide](http://pragprog.com/book/msard/arduino).  Download and unzip the file and go to _Arduino_1_0 -> MotionSensor -> NunchuckDemo_. Copy the files to your Arduino sketchbook path and upload the code on to your Arduino board.  Using Arduino's serial monitor you should now be able to see a stream of data displayed in 7 separate columns which will change as you interact with your Nunchuck.

It should look something like this:  

     45 150 400 350 600 1 0   
     47 155 410 357 611 1 0   
     49 161 417 361 617 0 1   
     .  .   .   .   .   . .   
     .  .   .   .   .   . .   

Alternative but similar code is also available from: https://github.com/todbot/wiichuck_adapter.  This has not been tested as part of this project so some modifications may be required.

Step 5
------
Now that we are receiving a readable data stream from the Nunchuck through the Arduino and onto a computer, the next step is to test it.  At this point we know we are receiving the data and in the correct format so we can close the Arduino software if it is still open.  

Download the **NunchuckooTest** folder and place it in your Processing sketchbook folder.  

Ensure your Nunchuck and Arduino are connected, Launch processing and open the NunchuckooTest sketch.  This will open a small window which displays a grey box in the centre of the window on a black background.  All going well you should be able to rotate the box in different directions with your Nunchuck.  

![Nunchuckoo Test Window](https://dl.dropbox.com/u/29093681/nunchuckooTestsnap.png)

In order to move the box using the Nunchucks accelerometers be sure to hold down the the Z trigger button on the controller.  This acts like a safety catch to stop the box from rotating like crazy as soon as you start the sketch.  If you are having difficulties getting the Nunchuck to work with the sketch check out the [Issues](https://github.com/c-flynn/Nunchuckoo/issues) list which highlights some potential problems.

You are now ready to use your Nunchuck in any of your Processing projects.  The code in NunchuckooTest.pde has been made as simple and readable as possible so that you can take what you need and apply it to any sketch.  If you are intending to use the Nunchuck with SCRAPE please go to https://github.com/c-flynn/SCRAPE for full details.     

 
