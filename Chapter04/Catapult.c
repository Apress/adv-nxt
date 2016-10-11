const tSensors touchSensor1 = (tSensors) S1;
const tSensors touchSensor2 = (tSensors) S2;
task main() {
	// endless loop
	while(true) {
		// lift crank mechanism
		nMotorEncoder[motorA] = 0;
		while(nMotorEncoder[motorA] <= 30 ) {
			motor[motorA] = 75;
		}
		motor[motorA] = 0;
		// load catapult
		// run motor until until the first
		// touch sensor gets pressed
		while(SensorValue(touchSensor1) == 0) {
			motor[motorC] = 100;
		};
		motor[motorC] = 0;
		// wait for the user to press the second touch sensor
		while(SensorValue(touchSensor2) == 0) {
			// do nothing
		};
		// drop crank mechanism
		nMotorEncoder[motorA] = 0;
		while(nMotorEncoder[motorA] >= -30 ) {
			motor[motorA] = -75;
		}
		motor[motorA] = 0;
		// wait for two seconds
		wait10Msec(200);
	};
}
