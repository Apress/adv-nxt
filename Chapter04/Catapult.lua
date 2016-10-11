-- function Catapult
function Catapult()
	-- configure the touch sensors on input ports 1 and 2
	nxt.InputSetDigi0(1)
	nxt.InputSetDirOutDigi0(1)
	nxt.InputSetDigi0(2)
	nxt.InputSetDirOutDigi0(2)
	-- configure motors A and C to run in "brake" mode
	nxt.OutputSetMode(1,2)
	nxt.OutputSetMode(3,2)
	-- loop forever
	while 1 do
		-- lift crank mechanism
		-- rotate motor A by 30 degrees
		rotate(1,30)
		-- load catapult
		-- run motor C until until the first
		-- touch sensor gets pressed by the liftarm
		nxt.outputSetSpeed(3, 32, 100, 0)
		while nxt.InputGetRawAd(1) == 0
			-- do nothing
		end
		nxt.OutputSetSpeed(3,0,0,0)
		-- wait for the user to press the second touch sensor
		while nxt.InputGetRawAd(2) == 0
			-- do nothing
		end
		-- drop crank mechanism
		rotate(1,-30)
		-- wait for 2 seconds
		local endOfWait = nxt.TimerRead() + 2000
		while nxt.TimerRead() < endOfWait
			-- do nothing
		end
	end
end

-- function to rotate a motor by a given number of degrees
function rotate(motor,degrees)
	nxt.OutputEnableRegulation(motor,1)
	nxt.OutputSetMode(motor,2)
	nxt.OutputSetSpeed(motor,32,75,0)
	nxt.OutputSetTachoLimit(motor,degrees)
end

-- now run the Catapult function
Catapult()
