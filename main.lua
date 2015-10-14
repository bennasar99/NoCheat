Time = {}

function Initialize(Plugin)
	Plugin:SetName("NoCheat")
	Plugin:SetVersion(3)

	cPluginManager.AddHook(cPluginManager.HOOK_WORLD_TICK, OnWorldTick)

	LOG("Initialized " .. Plugin:GetName() .. " v." .. Plugin:GetVersion())
	return true
end





function OnWorldTick(World, TimeDelta)
    if Time[World:GetName()] == 20 then
        Time[World:GetName()] = 0
        local ForEachPlayer = function(Player)
			x = Player:GetPosX()
            y = Player:GetPosY()
            z = Player:GetPosZ()
            if lasty == nil then
				lasty = Player:GetPosY()
			end
            World = Player:GetWorld()
            if World:GetBlock(x, y - 1, z) == E_BLOCK_AIR and World:GetBlock(x, y - 2, z) == E_BLOCK_AIR and World:GetBlock(x, y - 3, z) == E_BLOCK_AIR and y >= lasty then
                Player:SendMessage("Yoou're flying")
            end
			lastx = Player:GetPosX()
            lasty = Player:GetPosY()
            lastz = Player:GetPosZ()
        end
        local ForEachWorld = function(World)
            World:ForEachPlayer(ForEachPlayer)
        end
        cRoot:Get():ForEachWorld(ForEachWorld)
	elseif Time[World:GetName()] == nil then
		Time[World:GetName()] = 0
    else
		Time[World:GetName()] = Time[World:GetName()] + 1
    end
end

