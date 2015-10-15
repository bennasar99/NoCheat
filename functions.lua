function CanFly(Player)
	if Player:CanFly() == true then
		return true
	else
		return false
	end
end

function CheckHackFly(Player)
	local World = Player:GetWorld()
	if World:GetBlock(x, y, z) == E_BLOCK_AIR and World:GetBlock(x, y - 1, z) == E_BLOCK_AIR and World:GetBlock(x, y - 2, z) == E_BLOCK_AIR and World:GetBlock(x, y - 3, z) == E_BLOCK_AIR and (y - 1) > lasty[Player:GetName()] then
		Player:SendMessage("Stop using hacks NOOB")
		if lastgroundy[Player:GetName()] == nil then
			shit, height = World:TryGetHeight(x, z)
			Player:TeleportToCoords(x, height + 1, z)
			lastgroundy[Player:GetName()] = height + 1
		else
			Player:TeleportToCoords(lastgroundx[Player:GetName()], lastgroundy[Player:GetName()], lastgroundz[Player:GetName()])
		end
	elseif not(World:GetBlock(x, y - 1, z) == E_BLOCK_AIR) then
		lastgroundx[Player:GetName()] = x
		lastgroundy[Player:GetName()] = y - 1
		lastgroundz[Player:GetName()] = z
	end
end