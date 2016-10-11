// use the light sensor connected to port 3
const tSensors lightSensor = (tSensors) S3;
// main
task main() {
	// define a variable that holds the present rotation speed
	// initial value is 20
	int rotationSpeed = 20;
	// loop until rotation speed is maximum (100)
	while(rotationSpeed < 100) {
		// loop until light sensor detects the passing spill grip
		do {
			// run the helix's motor with constant speed
			motor[motorA] = rotationSpeed;
			// check light sensor
		} while(SensorValue(lightSensor) >= 50);
		// the grip has passed the light sensor
		// hence we increment the rotation speed
		rotationSpeed = rotationSpeed + 1;
	}
	// rotation speed is maximum now
	// so we run the helix with constant motor power
	// until the user stops the program manually
	while(true) {
		motor[motorA] = 100;
	}
}