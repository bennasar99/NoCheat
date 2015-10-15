Time = {}
lastx = {}
lasty = {}
lastz = {}
lastgroundx = {}
lastgroundy = {}
lastgroundz = {}

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
            World = Player:GetWorld()
            if lasty[Player:GetName()] == nil then
				lasty[Player:GetName()] = Player:GetPosY()
			end
			if CanFly(Player) == false then
				CheckHackFly(Player)
			end
            lastx[Player:GetName()] = Player:GetPosX()
            lasty[Player:GetName()] = Player:GetPosY()
            lastz[Player:GetName()] = Player:GetPosZ()
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
