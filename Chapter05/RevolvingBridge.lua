-- function RevolvingBridge
function RevolvingBridge()
	-- configure the ultrasonic sensor on input port 1
	nxt.InputSetDigi0(1)
	nxt.InputSetDirOutDigi0(1)
	-- configure motors B and C to run in "brake" mode
	-- enable regulation
	nxt.OutputSetMode(2,2)
	nxt.OutputSetMode(3,2)
	nxt.OutputEnableRegulation(2,1)
	nxt.OutputEnableRegulation(3,1)
	-- loop forever
	while 1 do
		-- wait for the ultrasonic sensor to detect something nearer than 50 inches
		while nxt.InputGetRawAd(1) > 50
			-- do nothing
		end
		-- run motors B and C synchronized in opposite directions for 10 rotations
		-- first synchronize motor B and C
		nxt.OutputSetRegulation(2,2,1)
		nxt.OutputSetRegulation(3,2,1)
		-- now run motors for 10 rotations (= 3600 degrees)
		nxt.OutputSetSpeed(2, 32, 100, 0)
		nxt.OutputSetSpeed(3, 32, -100, 0)
		nxt.OutputSetTachoLimit(2, 3600)
		nxt.OutputSetTachoLimit(3, 3600)
		-- wait for the ultrasonic sensor no longer detecting
		-- something nearer than 50 inches
		while nxt.InputGetRawAd(1) < 50
			-- do nothing
		end
		-- switch back the bridge
		-- run motors in opposite direction for 10 rotations (= 3600 degrees)
		-- note that each motor runs in the reverse direction than before
		nxt.OutputSetSpeed(2, 32, -100, 0)
		nxt.OutputSetSpeed(3, 32, 100, 0)
		nxt.OutputSetTachoLimit(2, 3600)
		nxt.OutputSetTachoLimit(3, 3600)
	end
end

-- now run the RevolvingBridge function
RevolvingBridge()
