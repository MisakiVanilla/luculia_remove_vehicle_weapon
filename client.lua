if not lib then return end

lib.onCache('ped', function(ped)
	WeaponWheel()
end)

lib.onCache('seat', function(seat)
	if seat then
		local hasWeapon = GetCurrentPedVehicleWeapon(cache.ped)

		if hasWeapon then
			return WeaponWheel(true)
		end
	end

	WeaponWheel(false)
end)

local rewardTypes = 1 << 0 | 1 << 1 | 1 << 2 | 1 << 3 | 1 << 7 | 1 << 10

function WeaponWheel(state)
	if state == nil then state = EnableWeaponWheel end

	EnableWeaponWheel = state
	SetWeaponsNoAutoswap(not state)
	SetWeaponsNoAutoreload(not state)

    -- CLEAR_PICKUP_REWARD_TYPE_SUPPRESSION | SUPPRESS_PICKUP_REWARD_TYPE
    return state and N_0x762db2d380b48d04(rewardTypes) or N_0xf92099527db8e2a7(rewardTypes, true)
end
