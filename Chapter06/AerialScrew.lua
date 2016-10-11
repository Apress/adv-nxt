-- function AerialScrew
function AerialScrew()
	-- configure the light sensor on input port 3
	nxt.InputSetDigi0(3)
	nxt.InputSetDirOutDigi0(3)
	-- configure motor A to run in "brake" mode
	nxt.OutputSetMode(1,2)
	-- define a variable that holds the present rotation speed
	-- initial value is 20
	local rotationSpeed = 20
	-- loop until rotation speed is maximum (100)
	while rotationSpeed < 100 do
		-- set the power of the helix's motor to the rotation speed
		-- 32 means "run mode"
		nxt.outputSetSpeed(1, 32, rotationSpeed, 0)
		-- loop until light sensor detects the passing spill grip
		while nxt.InputGetRawAd(3) >= 50
			-- do nothing
		end
		-- increment the rotation speed
		rotationSpeed = rotationSpeed + 1
	end
	-- run the motor with maximum power
	nxt.outputSetSpeed(1, 32, 100, 0)
end

-- Now run the AerialScrew function
AerialScrew()
