local function FetchModel(model)
    RequestModel(GetHashKey(model))
    while not HasModelLoaded(model) do 
        Wait(100)
    end
  end

local LocalNPCs = {}

local function GetLocalNPC(index)
    return LocalNPCs[index]
end

local function CreateLocalNPC(index)
    if (LocalNPCs[index]) then 
        DestroyLocalNPC(index)
    end
      
    LocalNPCs[index] = {}
    local cfg = Config.WeedProccessBoss[index]
  
    FetchModel(cfg.WeedPedModel)
    ------| CREATING PED |------
    local weedProccessPed = CreatePed(1, cfg.WeedPedModel, cfg.WeedPedLocation, false, true)
        FreezeEntityPosition(weedProccessPed, true)
        SetEntityInvincible(weedProccessPed, true)
        SetBlockingOfNonTemporaryEvents(weedProccessPed, true)
    LocalNPCs[index].weedProccessPed = weedProccessPed
end

local function DestroyLocalNPC(index)
    if (LocalNPCs[index]) then 
        DeleteEntity(LocalNPCs[index].weedProccessPed)
        LocalNPCs[index] = nill
    end 
end
------| END OF PED CREATION |------
------| CREATING TARGET ON PED |------



------| KEEP THIS AT BOTTOM |------
------| CHECKS TO SEE IF PLAYER IS CERTAIN DISTANCE FROM THE PED |---
Citizen.CreateThread(function()
    while true do
        local wait = 1000
        local ped = PlayerPedId() 
        local pcoords = GetEntityCoords(ped)
        for i=1, 1 do 
            local cfg = Config.WeedProccessBoss[i]
            local coords = vector3(cfg.WeedPedLocation)
            local dist = #(pcoords - coords)
            local weedProccessPed = GetLocalNPC(i)
            if dist < cfg.RenderDistance then 
                if (GetLocalNPC(i) == nill) then 
                  CreateLocalNPC(i)
                end 
            else 
                DestroyLocalNPC(i)
            end 
        end
      Wait(wait)
    end
end)
  
