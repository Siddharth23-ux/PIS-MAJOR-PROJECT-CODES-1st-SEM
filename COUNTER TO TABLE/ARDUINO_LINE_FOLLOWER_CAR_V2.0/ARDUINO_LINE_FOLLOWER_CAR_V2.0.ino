//ARDUINO LINE FOLLOWER CAR Based On Arduino Motor Driver Shield
//You have to install the AFMotor library before uploading the sketch
//First download the AFMotor Zip file then open Arduino IDE
//go to sketch >> Include library >> ADD .Zip file >> Select the downloaded AFMotor Zip File >> open
// Created by DIY Builder
// You Can modify the sketch according to your need.

#include <AFMotor.h> //Include Adafruit Motor Driver Shield Library
#include <Servo.h>


const int trigger1 = 2;
const int echo1 = A2 ;
const int trigger2 = 13;
const int echo2 = A3 ;
int duration1, distance1, flag = 0;       //flag=1:deployment of the CheckandPerform
const int distLimit = 50;                                     //Distance would be in cm

int servoPin1 = 9 ;                       //these servo pins must be PWM pins
int servoPin2 = 10;

char servoStatus = 'u';                 //'u':up,'d':down



AF_DCMotor motor1(1, MOTOR12_1KHZ);
AF_DCMotor motor2(2, MOTOR12_1KHZ);
AF_DCMotor motor3(3, MOTOR34_1KHZ);
AF_DCMotor motor4(4, MOTOR34_1KHZ);
Servo servo1;
Servo servo2;


#define LEFT_SENSOR A0 // connect the Left sensor with analog pin A0
#define RIGHT_SENSOR A1 // connect the Right sensor with analog pin A1
#define LEFT_SENSOR1 A4 // connect the Left sensor with analog pin A0
#define RIGHT_SENSOR1 A5
#define SD_ChipSelectPin 4                //define CS pin


void setup() {

  pinMode(RIGHT_SENSOR, INPUT); // initialize Right sensor as an inut
  pinMode(LEFT_SENSOR, INPUT);
  pinMode(RIGHT_SENSOR1, INPUT); // initialize Right sensor as an inut
  pinMode(LEFT_SENSOR1, INPUT);
  pinMode(trigger1, OUTPUT);
  pinMode(echo1, INPUT);
  pinMode(trigger2, OUTPUT);
  pinMode(echo2, INPUT);
  pinMode(22, INPUT);     //22:FORWARD 23: BACKWARD
  pinMode(23, INPUT);
  //define speaker pin.
  //you must use pin 9 of the Arduino Uno and Nano
  //the library is using this pin
  servo1.attach(servoPin1);
  servo2.attach(servoPin2);
  Serial.begin(9600);



}

void getUltrasonic1()
{
  digitalWrite(trigger1, LOW);

  delayMicroseconds(2);
  digitalWrite(trigger1, HIGH);

  delayMicroseconds(10);
  digitalWrite(trigger1, LOW);

  duration1 = pulseIn(echo1, HIGH);

  distance1 = duration1 * 17.0695;
  Serial.println(duration1);

}
void getUltrasonic2()
{
  digitalWrite(trigger2, LOW);

  delayMicroseconds(2);
  digitalWrite(trigger2, HIGH);

  delayMicroseconds(10);
  digitalWrite(trigger2, LOW);

  duration1 = pulseIn(echo2, HIGH);

  distance1 = duration1 * 17.0695;

}

void CheckandPerform()
{
  if ((distance1 <= 1100))
  { if (flag == 0)
    { motor1.run(RELEASE);
      motor2.run(RELEASE);
      motor3.run(RELEASE);
      motor4.run(RELEASE);
      delay(100);
      servo1.write(180);
      servo2.write(180);

      servoStatus = 'd';

      flag = 1;
    }

  }
  else
  { //if SERVO is up then do not mind otherwise turn SERVO up
    if (servoStatus == 'd')
    {
      servo1.write(0);
      servo2.write(0);

      servoStatus = 'u';
    }
    flag = 0;
  }
}

void loop() {
  if (1)
  {
    getUltrasonic1();/*top right:3,bottom right: 4, top left: 1, bottom left: 2*/
    CheckandPerform();
    if (flag == 0)
    { if (analogRead(RIGHT_SENSOR) <= 35 && analogRead(LEFT_SENSOR) <= 35) //compare both sensor value to set the directionc
      {
        motor1.run(FORWARD); // run motor1 clockwise
        motor1.setSpeed(255); // set motor1 speed 50 percent
        motor2.run(FORWARD); // run motor2 clockwise
        motor2.setSpeed(255); // set motor2 speed 50 percent
        motor3.run(FORWARD); // run motor3 clockwise
        motor3.setSpeed(255); // set motor3 speed 50 percent
        motor4.run(FORWARD); // run motor4 clockwise
        motor4.setSpeed(255); // set motor4 speed 50 percent
      }
      else if (!analogRead(RIGHT_SENSOR) <= 35 && analogRead(LEFT_SENSOR) <= 35) //compare both sensor value to set the direction
      {
        motor1.run(FORWARD); // run motor1 clockwise
        motor1.setSpeed(255); // set motor1 speed 100 percent
        motor2.run(FORWARD); // run motor2 clockwise
        motor2.setSpeed(255); // set motor2 speed 100 percent
        motor3.run(BACKWARD); // run motor3 anti-clockwise
        motor3.setSpeed(255); // set motor3 speed 100 percent
        motor4.run(BACKWARD); // run motor4 anti-clockwise
        motor4.setSpeed(255); // set motor4 speed 100 percent

      }
      else if (analogRead(RIGHT_SENSOR) <= 35 && !analogRead(LEFT_SENSOR) <= 35) //compare both sensor value to set the direction
      {
        motor1.run(BACKWARD); // run motor1 anti-clockwise
        motor1.setSpeed(255); // set motor1 speed 100 percent
        motor2.run(BACKWARD); // run motor2 anti-clockwise
        motor2.setSpeed(255); // set motor2 speed 100 percent
        motor3.run(FORWARD);  // run motor3 clockwise
        motor3.setSpeed(255); // set motor3 speed 100 percent
        motor4.run(FORWARD);  // run motor4 clockwise
        motor4.setSpeed(255); // set motor4 speed 100 percent
      }
      else if (!analogRead(RIGHT_SENSOR) <= 35 && !analogRead(LEFT_SENSOR) <= 35) //compare both sensor value to set the direction
      {
        //stop all the motors
        motor1.run(RELEASE);
        motor2.run(RELEASE);
        motor3.run(RELEASE);
        motor4.run(RELEASE);
      }
    }
  }
  else if ((digitalRead(22) == 0) && (digitalRead(23) == 1))
  {
    getUltrasonic2();/*top right:1,bottom right: 2, top left: 3, bottom left: 4*/
    CheckandPerform();
    if (flag == 0)
    { if (analogRead(RIGHT_SENSOR1) <= 35 && analogRead(LEFT_SENSOR1) <= 35) //compare both sensor value to set the directionc
      {
        motor1.run(BACKWARD); // run motor1 clockwise
        motor1.setSpeed(255); // set motor1 speed 50 percent
        motor2.run(BACKWARD); // run motor2 clockwise
        motor2.setSpeed(255); // set motor2 speed 50 percent
        motor3.run(BACKWARD); // run motor3 clockwise
        motor3.setSpeed(255); // set motor3 speed 50 percent
        motor4.run(BACKWARD); // run motor4 clockwise
        motor4.setSpeed(255); // set motor4 speed 50 percent
      }
      else if (!analogRead(RIGHT_SENSOR1) <= 35 && analogRead(LEFT_SENSOR1) <= 35) //compare both sensor value to set the direction
      {
        motor1.run(FORWARD); // run motor1 clockwise
        motor1.setSpeed(255); // set motor1 speed 100 percent
        motor2.run(FORWARD); // run motor2 clockwise
        motor2.setSpeed(255); // set motor2 speed 100 percent
        motor3.run(BACKWARD); // run motor3 anti-clockwise
        motor3.setSpeed(255); // set motor3 speed 100 percent
        motor4.run(BACKWARD); // run motor4 anti-clockwise
        motor4.setSpeed(255); // set motor4 speed 100 percent

      }
      else if (analogRead(RIGHT_SENSOR1) <= 35 && !analogRead(LEFT_SENSOR1) <= 35) //compare both sensor value to set the direction
      {
        motor1.run(BACKWARD); // run motor1 anti-clockwise
        motor1.setSpeed(255); // set motor1 speed 100 percent
        motor2.run(BACKWARD); // run motor2 anti-clockwise
        motor2.setSpeed(255); // set motor2 speed 100 percent
        motor3.run(FORWARD);  // run motor3 clockwise
        motor3.setSpeed(255); // set motor3 speed 100 percent
        motor4.run(FORWARD);  // run motor4 clockwise
        motor4.setSpeed(255); // set motor4 speed 100 percent
      }
      else if (!analogRead(RIGHT_SENSOR1) <= 35 && !analogRead(LEFT_SENSOR1) <= 35) //compare both sensor value to set the direction
      {
        //stop all the motors
        motor1.run(RELEASE);
        motor2.run(RELEASE);
        motor3.run(RELEASE);
        motor4.run(RELEASE);
      }
    }
  }

}
