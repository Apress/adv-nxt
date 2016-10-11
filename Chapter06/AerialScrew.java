package org.nxtdavinci.aerialscrew;

import lejos.nxt.*;

public class AerialScrew {
	public static void main(String[] args) {
		// configure the light sensor on input port 3
		LightSensor lightSensor = new LightSensor(Port.S3);
		// define a variable that holds the present rotation speed
		// initial value is 20
		int rotationSpeed = 20;
		// loop until rotation speed is maximum (100)
		while(rotationSpeed < 100) {
			// set the power of the helix's motor to the rotation speed
			Motor.A.setSpeed(rotationSpeed);
			// loop until light sensor detects the passing spill grip
			do {
			// run the motor forward
			Motor.A.forward();
			// check the light sensor
			} while(lightSensor.readValue() >= 50);
			// increment the rotation speed
			rotationSpeed++;
		}
		// run the motor with maximum power
		Motor.A.setSpeed(100);
		while(true) {
			Motor.A.forward();
		}
	}
}