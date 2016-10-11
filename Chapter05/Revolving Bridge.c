const tSensors ultrasonicSensor = (tSensors) S1;
task main() {
	// endless loop
	while(true) {
		// wait until ultrasonic sensor detects something
		do {
			// do nothing until ultrasonic sensor detects
			// an object nearer than 50 inches
		} while(SensorValue(ultrasonicSensor) > 50);
		// synchronize motors B and C in opposite directions
		nSyncedMotors = synchBC;
		nSyncedTurnRatio = –100;
		// run motors for 10 rotations which is 3600 degrees
		nMotorEncoder[motorB] = 0;
		nMotorEncoderTarget[motorB] = 3600;
		motor[motorC] = 75;
		// wait until ultrasonic sensor does not detect anything any longer
		while(SensorValue(ultrasonicSensor) < 50) {
			// do nothing until ultrasonic sensor does not detect
			// an object nearer than 50 inches
		}
		// run motors back for 10 rotations which is -3600 degrees
		nMotorEncoder[motorB] = 0;
		nMotorEncoderTarget[motorB] = -3600;
		motor[motorB] = 75;
	}
}