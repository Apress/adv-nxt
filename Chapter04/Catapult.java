package org.nxtdavinci.catapult;

import lejos.nxt.*;

public class Catapult {
	public static void main(String[] args) throws Exception {
		// configure the touch sensors on input ports 1 and 2
		TouchSensor touchSensor1 = new TouchSensor(Port.S1);
		TouchSensor touchSensor2 = new TouchSensor(Port.S2);
		// configure the motors' speed
		Motor.A.setSpeed(600);
		Motor.C.setSpeed(900);
		// endless loop
		while(true) {
			// lift crank mechanism
			Motor.A.rotateTo(30);
			// load catapult
			// run gear wheel's motor until the liftarm
			// presses the first touch sensor
			while(!touchSensor1.isPressed()) {
				Motor.C.forward();
			};
			Motor.C.stop();
			// wait for the user to fire the catapult
			while(!touchSensor2.isPressed()) {
				// do nothing
			};
			// drop crank mechanism
			Motor.A.rotateTo(-30);
			// wait for two seconds
			Thread.sleep(2000);
		}
	}
}
