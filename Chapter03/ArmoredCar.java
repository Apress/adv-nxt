package org.nxtdavinci.armoredcar;

import lejos.nxt.*;

public class ArmoredCar {
	public static void main(String[] args) {
		// switch on speed regulation
		Motor.B.regulateSpeed(true);
		Motor.C.regulateSpeed(true);
		// set the speed of the motors to 600 rpm
		Motor.B.setSpeed(600);
		Motor.C.setSpeed(600);
		// loop forever
		while(true) {
			// run the motors in opposite direction
			Motor.B.forward();
			Motor.C.backward();
		}
	}
}