-- function ArmoredCar
function ArmoredCar()
	-- configure motors B and C to run in "brake" mode
	nxt.OutputSetMode(2,2)
	nxt.OutputSetMode(3,2)
	-- loop forever
	while(1) do
		-- set the power of the motors to 75 %
		-- 32 means "run mode"
		nxt.outputSetSpeed(2, 32, 75, 0)
		nxt.outputSetSpeed(3, 32, -75, 0)
	end
end

-- run the ArmoredCar function
ArmoredCar()