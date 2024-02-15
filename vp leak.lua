--- sorry xylex lmao


local ClientCrasher = {Enabled = false}
runFunction(function()
	local AntiCrash = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
		Name = "AntiCrash",
		Function = function(callback)
			if callback then 
				bedwars.AnimationType.JADE_HAMMER_SLAM = "rbxassetid://4522582858"
			else
				bedwars.AnimationType.JADE_HAMMER_SLAM = "rbxassetid://7341729415"
			end
		end
	})

	local ClientCrasherStart = {Enabled = false}
	ClientCrasher = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api.CreateOptionsButton({
		Name = "ClientCrasher",
		Function = function(callback)
			if callback then 
				if not AntiCrash.Enabled then 
					AntiCrash.ToggleButton(false)
				end
				task.spawn(function()
					if ClientCrasherStart.Enabled then 
						repeat task.wait() until bedwarsStore.matchState ~= 0 or not ClientCrasher.Enabled
						if not ClientCrasher.Enabled then return end
					end
					local animationLimit = 0
					repeat
						task.wait()
						if entityLibrary.isAlive then
							task.spawn(function()
								if animationLimit > 250 or not entityLibrary.isAlive then return end
								if not entityLibrary.character.Humanoid:IsDescendantOf(workspace) then return end
								local anim = Instance.new("Animation")
								anim.AnimationId = "rbxassetid://7341729415"
								local loaded = entityLibrary.character.Humanoid:LoadAnimation(anim)
								loaded:Play(0, 0, 0)
								animationLimit = animationLimit + 1
								task.wait()
								loaded:Stop()
								animationLimit = animationLimit - 1
							end)
							task.spawn(function()
								if not entityLibrary.isAlive then return end
								if not entityLibrary.character.Humanoid:IsDescendantOf(workspace) then return end
								if entityLibrary.character.Humanoid.MoveDirection.Magnitude < 0.1 then 
									lplr:Move(entityLibrary.character.HumanoidRootPart.CFrame.lookVector * 0.004, false)
									task.wait()
									lplr:Move(entityLibrary.character.HumanoidRootPart.CFrame.lookVector * -0.004, false)
								end
							end)
						end
					until not ClientCrasher.Enabled
				end)
			end
		end
	})
	ClientCrasherStart = ClientCrasher.CreateToggle({
		Name = "Match Start",
		Function = function() end
	})
end)

runFunction(function()
	local damagetick = tick()
	local CrashAura = {Enabled = false}
	CrashAura = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
		Name = "CrashAura",
		Function = function(callback)
			if callback then 
				task.spawn(function()
					repeat
						task.wait()
						if damagetick > tick() then 
							if not ClientCrasher.Enabled then
								ClientCrasher.ToggleButton(false)
							end
						else
							if ClientCrasher.Enabled then
								ClientCrasher.ToggleButton(false)
							end
						end
					until not CrashAura.Enabled
				end)
				table.insert(CrashAura.Connections, vapeEvents.EntityDamageEvent.Event:Connect(function(damageTable)
					if damageTable.entityInstance == lplr.Character then 
						damagetick = tick() + 0.5
					end
				end))
			end
		end
	})
end)

runFunction(function()
	local BarrelExploit = {Enabled = false}
	local BarrelExploitMode = {Value = "None"}
	local BarrelExploitBlacklist = {ObjectList = {}}
	local BarrelExploitServer = {Enabled = false}
	local BarrelExploitBed = {Enabled = false}
	local BarrelExploitMove = {Enabled = false}
	local BarrelExploitNoclip = {Enabled = false}
	local PhaseOverlap = OverlapParams.new()
	PhaseOverlap.MaxParts = 9e9
	PhaseOverlap.FilterType = Enum.RaycastFilterType.Include
	PhaseOverlap.FilterDescendantsInstances = {}
	local PhaseModifiedParts = {}
	local cooldown = {}

	local function roundPosition(pos)
		return Vector3.new(math.floor(pos.X / 3) * 3, math.floor(pos.Y / 3) * 3, math.floor(pos.Z / 3) * 3)
	end

	local rem = bedwars.ClientHandler:Get("CollectGunpowderBarrel")
	BarrelExploit = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api.CreateOptionsButton({
		Name = "👺",
		Function = function(callback)
			if callback then 
				RunLoops:BindToStepped("BarrelExploit", function()
					if entityLibrary.isAlive then
						PhaseOverlap.FilterDescendantsInstances = bedwarsStore.blocks
						local parts = BarrelExploitNoclip.Enabled and workspace:GetPartBoundsInRadius(entityLibrary.character.HumanoidRootPart.CFrame.p, 3, PhaseOverlap) or {}
						if BarrelExploitMove.Enabled then
							if entityLibrary.character.Humanoid.MoveDirection == Vector3.zero then parts = {} end
						end
						for i, v in pairs(parts) do 
							if v.CanCollide then 
								PhaseModifiedParts[v] = true
								v.CanCollide = false
							end
						end
						for i,v in pairs(PhaseModifiedParts) do 
							if not table.find(parts, i) then
								PhaseModifiedParts[i] = nil
								i.CanCollide = true
							end
						end
					end
				end)
				task.spawn(function()
					repeat
						task.wait()
						local breaktable = {}
						if entityLibrary.isAlive then
							if BarrelExploitMove.Enabled then
								if entityLibrary.character.Humanoid.MoveDirection == Vector3.zero then continue end
							end
							local selfpos = roundPosition((entityLibrary.LocalPosition - Vector3.new(0, entityLibrary.character.Humanoid.HipHeight + (entityLibrary.character.HumanoidRootPart.Size.Y / 2), 0)))
							for x = -6, 6, 3 do 
								for y = -12, 12, 3 do 
									for z = -6, 6, 3 do 
										local triedpos = selfpos + Vector3.new(x, y, z)
										local block, blockpos = getPlacedBlock(triedpos)
										if block then
											if BarrelExploitBed.Enabled and block.Name == "bed" and block:GetAttribute("Team"..(lplr:GetAttribute("Team") or 0).."NoBreak") then 
												continue
											end
											if BarrelExploitServer.Enabled then 
												if block:GetAttribute("PlacedByUserId") == 0 and block.Name ~= "bed" then 
													continue
												end
											end
											if BarrelExploitMode.Value ~= "None" then 
												if table.find(BarrelExploitBlacklist.ObjectList, block.Name) then 
													if BarrelExploitMode.Value == "Blacklist" then continue end
												else
													if BarrelExploitMode.Value == "Whitelist" then continue end
												end
											end
											if breaktable[block] then 
												if (triedpos - selfpos).Magnitude >= (breaktable[block] - selfpos).Magnitude then 
													continue
												end
											end
											breaktable[block] = triedpos
										end
									end
								end
							end
						end
						local breaktable2 = {}
						for i,v in pairs(breaktable) do table.insert(breaktable2, v) end
						table.sort(breaktable2, function(a, b)
							return (a - entityLibrary.LocalPosition).Magnitude < (b - entityLibrary.LocalPosition).Magnitude
						end)
						for i, v in pairs(breaktable2) do 
							if (v - entityLibrary.LocalPosition).Magnitude < 7 then
								if not cooldown[v] or cooldown[v] < tick() then 
									task.spawn(function()
										cooldown[v] = tick() + 0.1
										local res = rem:CallServer({
											barrelPos = v
										})
										cooldown[v] = res and tick() + 10000 or nil
									end)
								end
							end
						end
					until not BarrelExploit.Enabled
				end)
			else
				RunLoops:UnbindFromStepped("BarrelExploit")
				for i,v in pairs(PhaseModifiedParts) do if i then i.CanCollide = true end end
				table.clear(PhaseModifiedParts)
			end
		end
	})
	BarrelExploitMode = BarrelExploit.CreateDropdown({
		Name = "Mode",
		List = {"None", "Blacklist", "Whitelist"},
		Function = function() end
	})
	BarrelExploitBlacklist = BarrelExploit.CreateTextList({
		Name = "BlockList",
		TempText = "block name"
	})
	BarrelExploitServer = BarrelExploit.CreateToggle({
		Name = "Ignore Map",
		Function = function() end
	})
	BarrelExploitBed = BarrelExploit.CreateToggle({
		Name = "Bed Team Check",
		Function = function() end
	})
	BarrelExploitMove = BarrelExploit.CreateToggle({
		Name = "Move Check",
		Function = function() end,
		Default = true
	})
	BarrelExploitNoclip = BarrelExploit.CreateToggle({
		Name = "Noclip",
		Function = function() end
	})
end)

runFunction(function()
	local SpawnParts = {}
	GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api.CreateOptionsButton({
		Name = "SpawnESP",
		Function = function(callback)
			if callback then 
				for i,v2 in pairs(workspace.MapCFrames:GetChildren()) do 
					if v2.Name:find("spawn") and v2.Name ~= "spawn" and v2.Name:find("respawn") == nil then
						local part = Instance.new("Part")
						part.Size = Vector3.new(1, 1000, 1)
						part.Position = v2.Value.p
						part.Anchored = true
						part.Parent = workspace
						part.CanCollide = false
						part.Transparency = 0.5
						part.Material = Enum.Material.Neon
						part.Color = Color3.new(1, 0, 0)
						bedwars.QueryUtil:setQueryIgnored(part, true)
						table.insert(SpawnParts, part)
					end
				end
			else
				for i,v in pairs(SpawnParts) do v:Destroy() end
				table.clear(SpawnParts)
			end
		end
	})
end)
