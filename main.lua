Time = 0

function Initialize(Plugin)
	Plugin:SetName("NoCheat")
	Plugin:SetVersion(3)

	cPluginManager.AddHook(cPluginManager.HOOK_TICK, OnTick)

	LOG("Initialized " .. Plugin:GetName() .. " v." .. Plugin:GetVersion())
	return true
end





function OnTick(TimeDelta)
    print(Time)
    if Time == 20 then
        Time = 0
        local ForEachPlayer = function(Player)
            World = Player:GetWorld()
            x = Player:GetPosX()
            y = Player:GetPosY()
            z = Player:GetPosZ()
            if World:GetBlock(x, y, z) == E_BLOCK_AIR and World:GetBlock(x, y - 1, z) == E_BLOCK_AIR and World:GetBlock(x, y - 2, z) == E_BLOCK_AIR and World:GetBlock(x, y - 3, z) == E_BLOCK_AIR then
                Player:SendMessage("Yoou're flying")
            end
        end
        local ForEachWorld = function(World)
            World:ForEachPlayer(ForEachPlayer)
        end
        cRoot:Get():ForEachWorld(ForEachWorld)
    else
        Time = Time + 1
    end
end
