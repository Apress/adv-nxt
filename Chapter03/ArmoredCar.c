task main() {
	// motor B and C should run synchronized
	nSyncedMotors = synchBC;
	// motor C has to rotate in the opposite direction
	nSyncedTurnRatio = -100;
	// endless loop
	while(true) {
		// run motors B and C at a power level of 75%
		// motor C spins in the opposite direction
		motor[motorB] = 75;
	}
}
