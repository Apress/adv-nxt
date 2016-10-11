package org.davincinxt.revolvingbridge;

import lejos.nxt.Motor;
import lejos.nxt.SensorPort;
import lejos.nxt.UltrasonicSensor;

public class RevolvingBridge {
	public static void main(String[] args) throws Exception {
		// speed
		Motor.B.setSpeed(600);
		Motor.C.setSpeed(600);
		// sonar sensor at port 1
		UltrasonicSensor us = new UltrasonicSensor(SensorPort.S1);
		// endless loop
		while(true) {
			// check for detection
			// we do nothing as long as nothing is detected
			int distanceToNearestObject = 1000;
			while((distanceToNearestObject = us.getDistance())>=50) {
				// do nothing
			}
			// switch bridge away
			// note that leJOS NXJ did not provide an explicit feature
			// synchronization at the date of this writing
			Motor.B.rotateTo(3600);
			Motor.C.rotateTo(-3600);
			// check for detection
			// we do nothing as long as something is detected
			while((distanceToNearestObject = us.getDistance())<50) {
				// do nothing
			}
			// reset bridge
			// note that leJOS NXJ did not provide an explicit feature
			// for motor synchronization at the date of this writing
			Motor.B.rotateTo(-3600);
			Motor.C.rotateTo(3600);
		}
	}
}
