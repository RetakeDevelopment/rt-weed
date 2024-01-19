function createDealerPed()
  local dealerPedModel = dealer(config.pedmodel)
  if not HasModelLoaded(dealerPedModel) then
    RequestModel(dealerPedModel)
    Wait(10)
  end
  while not HasModelLoaded(dealerPedModel) do
    Wait(10)
  end

  dealerPed = CreatePed(5, dealerPedModel, config.location, config.heading, false, false)
  FreezeEntityPosition(dealerPed, true)
  SetEntityInvincible(dealerPed, true)
  SetBlockingOfNonTemporaryEvents(dealerPed, true)
  SetModelAsNoLongerNeeded(dealerPedModel)
  TaskStartScenarioInPlace(dealerPed, config.pedanimation, 0 ,true)
  
