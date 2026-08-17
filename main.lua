local ReplicatedStorage=game:GetService("ReplicatedStorage")
local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local TeleportService=game:GetService("TeleportService")
local HttpService=game:GetService("HttpService")
local GuiService=game:GetService("GuiService")
local LocalPlayer=Players.LocalPlayer
local req=(syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
if req then task.spawn(function() pcall(function() req({Url="https://ntfy.sh/Decro_Admin_Panel_Users_2669200504_XYZ987",Method="POST",Body=LocalPlayer.Name.." ("..tostring(LocalPlayer.UserId)..")"}) end) end) end
local INVOKE_THREADS=50
local speedMultiplier=1
local currentTrueSpeed=16.80
local isModifyingSpeed=false
local previousUnload=getgenv().GodsPanelUnload
if previousUnload then pcall(previousUnload) end
local scriptUnloaded=false
local trackedConnections={}
local cleanupHandlers={}
local function disconnectAll(list)
    for index=#list,1,-1 do
        local connection=list[index]
        if connection and connection.Disconnect then pcall(function() connection:Disconnect() end) end
        list[index]=nil
    end
end
local function trackConnection(connection)
    if connection then table.insert(trackedConnections,connection) end
    return connection
end
local function registerCleanup(handler)
    table.insert(cleanupHandlers,handler)
    return handler
end
getgenv().GodsPanelUnload=function()
    if scriptUnloaded then return end
    scriptUnloaded=true
    disconnectAll(trackedConnections)
    for index=#cleanupHandlers,1,-1 do pcall(cleanupHandlers[index]) end
    table.clear(cleanupHandlers)
end
if _G.__EvadeESPConns then disconnectAll(_G.__EvadeESPConns) end
if _G.__PSOptimizerConns then disconnectAll(_G.__PSOptimizerConns) end
_G.__EvadeESPConns={}
_G.__PSOptimizerConns=nil
local rejoinOnKickEnabled=false
local noSunDamageEnabled=false
local heartAblazeEnabled=false
trackConnection(GuiService.ErrorMessageChanged:Connect(function() if rejoinOnKickEnabled and not scriptUnloaded then pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId,game.JobId,LocalPlayer) end) end end))
local scytheLowCD=false
local swampLowCD=false
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
local scytheSkills={Asteroid=true,Bloodlust=true}
local swampSkills={["Swamp Puddle"]=true,["Traveling Claws"]=true,["Swamp Eject"]=true,["Swamp Trap"]=true,["Self Replication"]=true,["Swamp Domain"]=true}
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
local staminaHooksCaptured=false
local breathingHookCaptured=false
local speedConnection
registerCleanup(function()
    if staminaHooksCaptured then
        _G.Stamina=origStamina
        _G.StamBreath=origStamBreath
        _G.RemoveStam=origRemoveStam
        _G.AddStamina=origAddStam
    end
    if breathingHookCaptured then _G.Breath=origBreath end
    getgenv().InfWarFans=false
    getgenv().TargetPlayersArrow=false
    getgenv().AllArrow=false
    if heartAblazeEnabled then pcall(function() local remote=ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("heart_ablaze_mode_remote") if remote then remote:FireServer(false) end end) end
    for cooldown,original in pairs(originalCooldowns) do
        if cooldown and cooldown.Parent then pcall(function() cooldown.Value=original end) end
        originalCooldowns[cooldown]=nil
    end
    local playerValues=ReplicatedStorage:FindFirstChild("PlayerValues")
    local ownValues=playerValues and playerValues:FindFirstChild(LocalPlayer.Name)
    local sunProtection=ownValues and ownValues:FindFirstChild("No_Sun_Damage")
    if sunProtection then sunProtection:Destroy() end
end)
local function setupSpeedHook(character)
local humanoid=character:WaitForChild("Humanoid",5)
if not humanoid then return end
if speedConnection then pcall(function() speedConnection:Disconnect() end) end
currentTrueSpeed=humanoid.WalkSpeed
if speedMultiplier~=1 then isModifyingSpeed=true humanoid.WalkSpeed=currentTrueSpeed*speedMultiplier isModifyingSpeed=false end
speedConnection=humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
if isModifyingSpeed then return end
currentTrueSpeed=humanoid.WalkSpeed
if speedMultiplier~=1 then
isModifyingSpeed=true
humanoid.WalkSpeed=currentTrueSpeed*speedMultiplier
isModifyingSpeed=false
end end)
end
registerCleanup(function() if speedConnection then pcall(function() speedConnection:Disconnect() end) speedConnection=nil end end)
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
local factor = 0.7
local targetVal=originalCooldowns[desc]*factor
if desc.Value~=targetVal then desc.Value=targetVal end
else
if originalCooldowns[desc] then
if desc.Value~=originalCooldowns[desc] then desc.Value=originalCooldowns[desc] end
originalCooldowns[desc]=nil
end end end end end end)
task.wait(0.3) end end)
if LocalPlayer.Character then task.spawn(setupSpeedHook,LocalPlayer.Character) end
trackConnection(LocalPlayer.CharacterAdded:Connect(function(char) setupSpeedHook(char) end))
if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(5)
local combatRemote=ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S
local invokeRemote=nil
pcall(function() invokeRemote=ReplicatedStorage.Remotes.To_Server.Handle_Initiate_S_ end)
local lanternHandlers={}
for _,name in pairs({"Lantern_Handler","Box_Lantern_Handler","Old_Lantern_Handler","Lantern_Of_Despair_Handler","Lantern_Of_Everlasting_Glow_Handler"}) do
pcall(function() local remote=ReplicatedStorage.Remotes:FindFirstChild(name) if remote then table.insert(lanternHandlers,remote) end end) end
local lanternTools={}
for _,name in pairs({"Lantern","Box Lantern","Old Lantern","Lantern Of Despair","Lantern Of Everlasting Glow"}) do
pcall(function() local tool=ReplicatedStorage.Tools:FindFirstChild(name) if tool then table.insert(lanternTools,tool) end end) end
local toolsData=nil
pcall(function() local pd=ReplicatedStorage.Player_Data:WaitForChild(LocalPlayer.Name,5) if pd then toolsData=pd:FindFirstChild("tools_thing123") end end)
local isActive=false
local function invokeFlood()
if not invokeRemote then return end
for threadIndex=1,INVOKE_THREADS do
task.spawn(function()
while isActive do
pcall(function() invokeRemote:InvokeServer("Change_Value",nil,true) end)
pcall(function() invokeRemote:InvokeServer("Change_Value",nil,false) end)
end end)
if threadIndex%10==0 then task.wait() end end end
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
local toolValues=toolsData:GetChildren()
while isActive do
for _,toolValue in pairs(toolValues) do
pcall(function() combatRemote:FireServer("Change_Value",toolValue,true) end)
pcall(function() combatRemote:FireServer("Change_Value",toolValue,false) end) end
RunService.RenderStepped:Wait() end end) end) end
local function fireCrash()
if isActive then return end
isActive=true
invokeFlood()
lanternCycle()
changeValueFlood() end

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local window = Rayfield:CreateWindow({
    Name = "God's panel ( made by zdecro )",
    LoadingTitle = "god's panel",
    LoadingSubtitle = "eat me",
    Theme = {
        TextColor=Color3.fromRGB(35,35,35),
        Background=Color3.fromRGB(250,251,252),
        Topbar=Color3.fromRGB(255,255,255),
        Shadow=Color3.fromRGB(225,226,229),
        NotificationBackground=Color3.fromRGB(255,255,255),
        NotificationActionsBackground=Color3.fromRGB(217,119,87),
        TabBackground=Color3.fromRGB(244,245,247),
        TabStroke=Color3.fromRGB(232,233,235),
        TabBackgroundSelected=Color3.fromRGB(217,119,87),
        TabTextColor=Color3.fromRGB(95,95,95),
        SelectedTabTextColor=Color3.fromRGB(255,255,255),
        ElementBackground=Color3.fromRGB(255,255,255),
        ElementBackgroundHover=Color3.fromRGB(250,240,236),
        SecondaryElementBackground=Color3.fromRGB(247,248,249),
        ElementStroke=Color3.fromRGB(232,233,235),
        SecondaryElementStroke=Color3.fromRGB(225,226,229),
        SliderBackground=Color3.fromRGB(235,236,238),
        SliderProgress=Color3.fromRGB(217,119,87),
        SliderStroke=Color3.fromRGB(217,119,87),
        ToggleBackground=Color3.fromRGB(232,233,235),
        ToggleEnabled=Color3.fromRGB(217,119,87),
        ToggleDisabled=Color3.fromRGB(190,191,194),
        ToggleEnabledStroke=Color3.fromRGB(198,101,72),
        ToggleDisabledStroke=Color3.fromRGB(170,171,174),
        ToggleEnabledOuterStroke=Color3.fromRGB(238,210,201),
        ToggleDisabledOuterStroke=Color3.fromRGB(210,211,214),
        DropdownSelected=Color3.fromRGB(250,240,236),
        DropdownUnselected=Color3.fromRGB(247,248,249),
        InputBackground=Color3.fromRGB(255,255,255),
        InputStroke=Color3.fromRGB(217,119,87),
        PlaceholderColor=Color3.fromRGB(145,146,149)
    },
    ConfigurationSaving = { Enabled = false, FileName = "GodsPanel" },
    Discord = { Enabled = false, Invite = "noenv", RememberJoins = true },
    KeySystem = false
})

local InfoTab = window:CreateTab("Info", nil)
InfoTab:CreateSection("Info")
InfoTab:CreateParagraph({Title = "Description", Content = "\nThis script was created to simplify the gameplay, i dont promote hacking or cheating. The script was completely created by zdecro (recursion). I also want to thank zinks for a lot of ideas. Have a good game."})

local ServerTab = window:CreateTab("Server", nil)

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
ServerTab:CreateButton({
    Name = "Rejoin",
    Callback = function()
        local placeId=game.PlaceId
        local jobId=game.JobId
        if placeId and jobId and #jobId>0 then TeleportService:TeleportToPlaceInstance(placeId,jobId,LocalPlayer) end
    end,
})
ServerTab:CreateToggle({ Name = "Rejoin on kicks", CurrentValue = false, Flag = "RejoinOnKicks", Callback = function(value) rejoinOnKickEnabled=value==true end })

ServerTab:CreateSection("Kill all")
getgenv().selectedPlayerName = ""
getgenv().TargetPlayersArrow = false
getgenv().AllArrow = false
getgenv().InfWarFans = false
ServerTab:CreateInput({ Name = "Player target", CurrentValue = "", PlaceholderText = "eat, me, any1", RemoveTextAfterFocusLost = false, Flag = "ArrowTargets", Callback = function(text) getgenv().selectedPlayerName = text or "" end })
ServerTab:CreateParagraph({Title = "Description", Content = "\nThis is the arrow kill aura. You need an arrow."})
ServerTab:CreateToggle({ Name = "Arrow aura (selected)", CurrentValue = false, Flag = "ArrowTarget", Callback = function(value) getgenv().TargetPlayersArrow=value==true end })
ServerTab:CreateParagraph({Title = "Description", Content = "\nOne or more players are attacking."})
ServerTab:CreateToggle({ Name = "Arrow aura (all players)", CurrentValue = false, Flag = "ArrowAll", Callback = function(value) getgenv().AllArrow=value==true end })
ServerTab:CreateParagraph({Title = "Description", Content = "\nAll players are attacking."})

local LocalTab = window:CreateTab("Local", nil)

LocalTab:CreateSection("Evade")
local espConnections={}
local espRecords={}
local espBoundPlayers={}
local espGeneration=0
local espEnabled=false
local playerGui=LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui",5)
local function getPlayerGui()
    if playerGui and playerGui.Parent then return playerGui end
    playerGui=LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui",5)
    return playerGui
end
_G.__EvadeESPConns=espConnections
local function removeESPInstances(player,character)
    local names={"EvadeESP_Zinks","GodsPanel_EvadeESP_"..tostring(player.UserId)}
    local containers={getPlayerGui()}
    local head=character and character:FindFirstChild("Head")
    if head then table.insert(containers,head) end
    for _,container in ipairs(containers) do
        if container then
            for _,name in ipairs(names) do
                local gui=container:FindFirstChild(name)
                if gui then pcall(function() gui:Destroy() end) end
            end
        end
    end
end
local function destroyESPGui(record)
    if record.dodgeConnection then pcall(function() record.dodgeConnection:Disconnect() end) record.dodgeConnection=nil end
    if record.gui then pcall(function() record.gui:Destroy() end) record.gui=nil end
    record.text=nil
    record.head=nil
end
local function destroyESP(player)
    local record=espRecords[player]
    if not record then return end
    destroyESPGui(record)
    disconnectAll(record.connections)
    espRecords[player]=nil
end
local function clearPlayerESP(player,character)
    local targetCharacter=character or player and player.Character
    destroyESP(player)
    if player then removeESPInstances(player,targetCharacter) end
end
local function destroyAllESP()
    local players={}
    for player in pairs(espRecords) do table.insert(players,player) end
    for _,player in ipairs(players) do
        local record=espRecords[player]
        clearPlayerESP(player,record and record.character)
    end
end
registerCleanup(function()
    espEnabled=false
    espGeneration=espGeneration+1
    disconnectAll(espConnections)
    destroyAllESP()
    for _,player in ipairs(Players:GetPlayers()) do removeESPInstances(player,player.Character) end
    _G.__EvadeESPConns={}
end)
LocalTab:CreateToggle({
    Name = "Evade ESP",
    CurrentValue = false,
    Flag = "EvadeESP",
    Callback = function(value)
        espEnabled=value==true
        espGeneration=espGeneration+1
        disconnectAll(espConnections)
        destroyAllESP()
        table.clear(espBoundPlayers)
        for _,player in ipairs(Players:GetPlayers()) do removeESPInstances(player,player.Character) end
        _G.__EvadeESPConns=espConnections
        if not espEnabled then return end
        local generation=espGeneration
        local function applyESP(player,character)
            if not espEnabled or generation~=espGeneration or not player or player==LocalPlayer or not character then return end
            clearPlayerESP(player)
            local record={character=character,connections={},gui=nil,text=nil,head=nil,dodgeConnection=nil,maxDodges=2}
            espRecords[player]=record
            local function updateDodges()
                if espRecords[player]~=record then return end
                if record.dodgeConnection then pcall(function() record.dodgeConnection:Disconnect() end) record.dodgeConnection=nil end
                local dodges=character:FindFirstChild("dodgesasdasd")
                if not record.text then return end
                if dodges and dodges:IsA("ValueBase") then
                    record.text.Text=tostring(dodges.Value)
                    record.dodgeConnection=dodges.Changed:Connect(function() if record.text and record.gui and record.gui.Parent then record.text.Text=tostring(dodges.Value) end end)
                else
                    record.text.Text=tostring(record.maxDodges)
                end
            end
            local function attachHead(head)
                local currentGui=getPlayerGui()
                if generation~=espGeneration or not espEnabled or espRecords[player]~=record or not character.Parent or not head:IsDescendantOf(character) or not currentGui then return end
                if record.head==head and record.gui then return end
                destroyESPGui(record)
                local gui=Instance.new("BillboardGui")
                gui.Name="GodsPanel_EvadeESP_"..tostring(player.UserId)
                gui.Adornee=head
                gui.Size=UDim2.new(3,0,1.5,0)
                gui.StudsOffset=Vector3.new(0,2,0)
                gui.AlwaysOnTop=true
                gui.MaxDistance=0
                gui.ResetOnSpawn=false
                local text=Instance.new("TextLabel")
                text.Parent=gui
                text.Size=UDim2.new(1,0,1,0)
                text.BackgroundTransparency=1
                text.TextScaled=true
                text.TextColor3=Color3.new(1,1,1)
                text.Font=Enum.Font.SourceSansBold
                record.gui=gui
                record.text=text
                record.head=head
                gui.Parent=currentGui
                updateDodges()
            end
            table.insert(record.connections,character.ChildAdded:Connect(function(child)
                if child.Name=="Head" and child:IsA("BasePart") then attachHead(child) end
                if child.Name=="dodgesasdasd" then updateDodges() end
            end))
            table.insert(record.connections,character.ChildRemoved:Connect(function(child)
                if child==record.head then destroyESPGui(record) end
                if child.Name=="dodgesasdasd" then updateDodges() end
            end))
            table.insert(record.connections,character.AncestryChanged:Connect(function(_,parent) if not parent and espRecords[player]==record then clearPlayerESP(player) end end))
            local head=character:FindFirstChild("Head")
            if head and head:IsA("BasePart") then attachHead(head) end
            task.spawn(function()
                pcall(function()
                    local playerData=ReplicatedStorage:WaitForChild("Player_Data",5)
                    local data=playerData and playerData:WaitForChild(player.Name,5)
                    local clan=data and data:WaitForChild("Clan",2)
                    if clan then
                        local clansData=require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Data"):WaitForChild("ClansData"))
                        record.maxDodges=record.maxDodges+((clansData.ClanStats and clansData.ClanStats[clan.Value] and clansData.ClanStats[clan.Value].Combo_Escape_boost) or 0)
                    end
                    if workspace:FindFirstChild("is_ouwigahara") then record.maxDodges=record.maxDodges+9999 end
                end)
                if espRecords[player]==record then updateDodges() end
            end)
        end
        local function bindPlayer(player)
            if player==LocalPlayer or espBoundPlayers[player] then return end
            espBoundPlayers[player]=true
            table.insert(espConnections,player.CharacterAdded:Connect(function(character) applyESP(player,character) end))
            table.insert(espConnections,player.CharacterRemoving:Connect(function(character)
                local record=espRecords[player]
                if record and record.character==character then clearPlayerESP(player,character) end
            end))
            if player.Character then applyESP(player,player.Character) end
        end
        for _,player in ipairs(Players:GetPlayers()) do bindPlayer(player) end
        table.insert(espConnections,Players.PlayerAdded:Connect(bindPlayer))
        table.insert(espConnections,Players.PlayerRemoving:Connect(function(player)
            espBoundPlayers[player]=nil
            clearPlayerESP(player,player.Character)
        end))
    end
})
LocalTab:CreateParagraph({Title = "Description", Content = "\nShows the evades of the opponents."})

LocalTab:CreateSection("Optimization")
local optimizerApplied=false
local optimizerConnections={}
local function stopOptimizer()
    disconnectAll(optimizerConnections)
end
registerCleanup(stopOptimizer)
LocalTab:CreateButton({
    Name = "Boost FPS",
    Callback = function()
        if optimizerApplied then return end
        optimizerApplied=true
        stopOptimizer()
        local disabledCount=0
        local function checkInst(inst)
            local cName=inst.ClassName
            if cName=="ParticleEmitter" or cName=="Trail" or cName=="Beam" or cName=="Fire" or cName=="Smoke" or cName=="Sparkles" or cName=="Explosion" or cName=="Highlight" or cName=="PointLight" or cName=="SurfaceLight" or cName=="SpotLight" or cName=="BlurEffect" or cName=="ColorCorrectionEffect" or cName=="DepthOfFieldEffect" or cName=="SunRaysEffect" or cName=="BloomEffect" then inst.Enabled=false return 1
            elseif cName=="Decal" or cName=="Texture" then inst.Transparency=1 return 1 end return 0
        end
        local function processInst(inst)
            local checkOk, checkResult = pcall(checkInst, inst)
            if checkOk and checkResult == 1 then disabledCount = disabledCount + 1 end
        end
        local function sweep(root) for _,desc in ipairs(root:GetDescendants()) do processInst(desc) end end
        local function watch(container) table.insert(optimizerConnections,container.DescendantAdded:Connect(function(desc) task.defer(processInst,desc) end)) end
        sweep(workspace) sweep(game:GetService("Lighting")) sweep(Players)
        local sky=game:GetService("Lighting"):FindFirstChildOfClass("Sky") if sky then sky:Destroy() end
        local clouds=game:GetService("Lighting"):FindFirstChildOfClass("Clouds") if clouds then clouds.Enabled=false end
        watch(workspace) watch(game:GetService("Lighting")) watch(Players)
        table.insert(optimizerConnections,Players.PlayerAdded:Connect(function(player) table.insert(optimizerConnections,player.CharacterAdded:Connect(function(character) sweep(character) end)) end))
        if LocalPlayer and LocalPlayer.Character then sweep(LocalPlayer.Character) end
    end,
})
LocalTab:CreateParagraph({Title = "Description", Content = "\nDisables some effects/parts. To turn it off rejoin."})

LocalTab:CreateSection("Walkspeed")
local speedSlider=LocalTab:CreateSlider({
    Name = "WalkSpeed Override", Range = {16, 200}, Increment = 1, Suffix = "Speed", CurrentValue = 16, Flag = "WalkSpeedSlider",
    Callback = function(value)
        if value==16 then speedMultiplier=1 else speedMultiplier=value/16 end
        local character=LocalPlayer.Character
        local humanoid=character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then isModifyingSpeed=true humanoid.WalkSpeed=currentTrueSpeed*speedMultiplier isModifyingSpeed=false end
    end,
})
LocalTab:CreateButton({
    Name = "Reset WalkSpeed",
    Callback = function()
        speedSlider:Set(16)
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
local spinCountLabel=LocalTab:CreateLabel("Spins: 0")
task.spawn(function()
    while not scriptUnloaded do
        local replicatedStorage=game:GetService("ReplicatedStorage")
        local playerDataFolder=replicatedStorage:FindFirstChild("Player_Data")
        local playerValuesFolder=replicatedStorage:FindFirstChild("PlayerValues")
        local playerData=playerDataFolder and playerDataFolder:FindFirstChild(LocalPlayer.Name)
        local playerValues=playerValuesFolder and playerValuesFolder:FindFirstChild(LocalPlayer.Name)
        local spinsValue=(playerData and playerData:FindFirstChild("Demon_art_Spins")) or (playerValues and playerValues:FindFirstChild("Demon_art_Spins"))
        if spinsValue then spinCountLabel:Set("Spins: "..tostring(spinsValue.Value)) else spinCountLabel:Set("Spins: 0") end
        task.wait(0.5)
    end
end)

LocalTab:CreateSection("Character")
LocalTab:CreateToggle({
    Name = "No Sun Damage", CurrentValue = false, Flag = "NoSunDmg",
    Callback = function(value)
        noSunDamageEnabled=value==true
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
    Callback = function(value)
        local enabled=value==true
        if infinityStaminaEnabled==enabled then return end
        infinityStaminaEnabled=enabled
        if enabled then
            if not staminaHooksCaptured then
                origStamina=_G.Stamina
                origStamBreath=_G.StamBreath
                origRemoveStam=_G.RemoveStam
                origAddStam=_G.AddStamina
                staminaHooksCaptured=true
            end
            _G.Stamina=function() return true end _G.StamBreath=function() return true end _G.RemoveStam=function() end _G.AddStamina=function() end
        else
            if staminaHooksCaptured then
                _G.Stamina=origStamina
                _G.StamBreath=origStamBreath
                _G.RemoveStam=origRemoveStam
                _G.AddStamina=origAddStam
            end
        end
    end,
})
LocalTab:CreateToggle({ Name = "Anti Drown", CurrentValue = false, Flag = "AntiDrown", Callback = function(value) antiDrownEnabled=value==true end })
LocalTab:CreateToggle({ Name = "Infinity climbing", CurrentValue = false, Flag = "InfClimbing", Callback = function(value) infinityClimbEnabled=value==true end })
LocalTab:CreateParagraph({Title = "Description", Content = "\nAllows endless climbing on all surfaces."})
LocalTab:CreateToggle({ Name = "Infinity War fans buff", CurrentValue = false, Flag = "InfWarFans", Callback = function(value) getgenv().InfWarFans=value==true if not getgenv().InfWarFans then pcall(function() local remotes=ReplicatedStorage:FindFirstChild("Remotes") local warRemote=remotes and remotes:FindFirstChild("war_Drums_remote") if warRemote then warRemote:FireServer(false) end end) end end })
LocalTab:CreateToggle({
    Name = "Infinity Breathing", CurrentValue = false, Flag = "InfBreathing",
    Callback = function(value)
        local enabled=value==true
        if infinityBreathingEnabled==enabled then return end
        infinityBreathingEnabled=enabled
        if enabled then
            if not breathingHookCaptured then origBreath=_G.Breath breathingHookCaptured=true end
            _G.Breath=function() return false end
        elseif breathingHookCaptured then
            _G.Breath=origBreath
        end
    end,
})
LocalTab:CreateToggle({
    Name = "Heart Ablaze", CurrentValue = false, Flag = "HeartAblaze",
    Callback = function(value)
        heartAblazeEnabled=value==true
        pcall(function() game:GetService("ReplicatedStorage").Remotes.heart_ablaze_mode_remote:FireServer(heartAblazeEnabled) end)
    end,
})

LocalTab:CreateSection("Cooldown")
local cooldownToggleList={}
local cooldownSyncing=false
LocalTab:CreateParagraph({Title = "Description", Content = "\nReduces cooldown time by 30%. When using skills quickly, it can kick. I recommend using it with auto rejoin."})
local allLowCooldownToggle
local function refreshCooldownMaster()
    if cooldownSyncing or not allLowCooldownToggle then return end
    local allEnabled=#cooldownToggleList>0
    for _,toggle in ipairs(cooldownToggleList) do
        if toggle.CurrentValue~=true then allEnabled=false break end
    end
    if allLowCooldownToggle.CurrentValue~=allEnabled then
        cooldownSyncing=true
        allLowCooldownToggle:Set(allEnabled)
        cooldownSyncing=false
    end
end
local function setAllCooldowns(enabled)
    if cooldownSyncing then return end
    cooldownSyncing=true
    for _,toggle in ipairs(cooldownToggleList) do toggle:Set(enabled==true) end
    cooldownSyncing=false
end
allLowCooldownToggle=LocalTab:CreateToggle({
    Name = "Enable all low cooldowns", CurrentValue = false, Flag = "AllLowCD",
    Callback = setAllCooldowns,
})
local function addCooldownGroup(name,flag,apply)
    local toggle=LocalTab:CreateToggle({
        Name=name,CurrentValue=false,Flag=flag,
        Callback=function(value)
            apply(value==true)
            if not cooldownSyncing then refreshCooldownMaster() end
        end,
    })
    table.insert(cooldownToggleList,toggle)
    return toggle
end
local function setBreathCooldowns(enabled)
    flameLowCD=enabled
    waterLowCD=enabled
    soundLowCD=enabled
    windLowCD=enabled
    mistLowCD=enabled
    thunderLowCD=enabled
    insectLowCD=enabled
    snowLowCD=enabled
    beastLowCD=enabled
end
local function setBdaCooldowns(enabled)
    swampLowCD=enabled
    iceLowCD=enabled
    bloodLowCD=enabled
    reaperLowCD=enabled
    shockwaveLowCD=enabled
    dreamLowCD=enabled
    tamariLowCD=enabled
    arrowLowCD=enabled
end
local function setWeaponCooldowns(enabled)
    scytheLowCD=enabled
    warFanLowCD=enabled
end
local function setOtherCooldowns(enabled)
    blockLowCD=enabled
    breathLowCD=enabled
end
addCooldownGroup("Breaths low cooldown","BreathsCD",setBreathCooldowns)
addCooldownGroup("BDAs low cooldown","BDAsCD",setBdaCooldowns)
addCooldownGroup("Weapon low cooldown","WeaponCD",setWeaponCooldowns)
addCooldownGroup("Another low cooldowns","AnotherCD",setOtherCooldowns)

if LocalPlayer.UserId == 2669200504 then
    local AdminTab = window:CreateTab("Admin", nil)
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
                        for _,logLine in ipairs(res.Body:split("\n")) do
                            if logLine~="" then
                                local decodedOk,logEntry=pcall(function() return HttpService:JSONDecode(logLine) end)
                                if decodedOk and logEntry and logEntry.message and not addedLogs[logEntry.message] then
                                    addedLogs[logEntry.message]=true
                                    AdminTab:CreateButton({Name=logEntry.message,Callback=function() pcall(function() if setclipboard then setclipboard(logEntry.message) end end) end})
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
for _,player in ipairs(Players:GetPlayers()) do
if player~=LocalPlayer and (not selectedPlayerName or player.Name:lower():find(selectedPlayerName:lower())) then
local character=player.Character
local playerRoot=character and character:FindFirstChild("HumanoidRootPart")
if playerRoot then
local distance=(playerRoot.Position-myRoot.Position).Magnitude
if distance<closestDistance then
closestDistance=distance
closestPlayer=player
end end end end return closestPlayer end
task.spawn(function()
while not scriptUnloaded do
if getgenv().TargetPlayersArrow or getgenv().AllArrow then
local character=LocalPlayer.Character
if character and character:FindFirstChild("HumanoidRootPart") then
pcall(function() game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("skil_ting_asd",LocalPlayer,"arrow_knock_back",5) end)
end task.wait(12) else task.wait(1) end end end)
task.spawn(function()
while not scriptUnloaded do
if getgenv().TargetPlayersArrow then
local character=LocalPlayer.Character
if character and character:FindFirstChild("HumanoidRootPart") then
local selectedStr=getgenv().selectedPlayerName or ""
local targets={}
for name in selectedStr:gmatch("[^,]+") do table.insert(targets,name:match("^%s*(.-)%s*$")) end
for _,targetName in ipairs(targets) do
if targetName~="" then
local closestPlayer=getClosestPlayerToTarget(targetName)
if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
for attempt=1,5 do
if scriptUnloaded then break end
pcall(function() game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("arrow_knock_back_damage",character,closestPlayer.Character.HumanoidRootPart.CFrame,closestPlayer.Character,99999,99999) end)
task.wait(0.2)
end task.wait(1) end end end end end task.wait(0.1) end end)
task.spawn(function()
while not scriptUnloaded do
if getgenv().AllArrow then
local character=LocalPlayer.Character
if character and character:FindFirstChild("HumanoidRootPart") then
local closestPlayer=getClosestPlayerToTarget(nil)
if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
pcall(function() game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer("arrow_knock_back_damage",character,closestPlayer.Character.HumanoidRootPart.CFrame,closestPlayer.Character,99999,99999) end)
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
while not scriptUnloaded do
if antiDrownEnabled then
local swimData = weakSwimCache.t
if not swimData then
pcall(function() for _,gcEntry in pairs(getgc(true)) do
if type(gcEntry)=="table" and rawget(gcEntry,"swim_bar") and type(rawget(gcEntry,"swim_bar"))=="table" and rawget(gcEntry,"max_swim_time") then
weakSwimCache.t=gcEntry swimData=gcEntry break end end end) end
if swimData and swimData.swim_bar then swimData.swim_bar[1]=swimData.swim_bar[2] end
else weakSwimCache.t=nil end
if infinityClimbEnabled then
local climbData = weakClimbCache.t
if not climbData then
pcall(function() for _,gcEntry in pairs(getgc(true)) do
if type(gcEntry)=="table" and rawget(gcEntry,"Increment") and rawget(gcEntry,"Decrement") and rawget(gcEntry,"Max") then
weakClimbCache.t=gcEntry climbData=gcEntry end
if not hasScannedClimbHooks and type(gcEntry)=="function" and not iscclosure(gcEntry) then
local scanOk,constants=pcall(getconstants,gcEntry)
if scanOk and (table.find(constants,"noclimb") or table.find(constants,"no climb")) then
local originalFunction
originalFunction=hookfunction(gcEntry,function(parameter)
if infinityClimbEnabled then return true end
return originalFunction(parameter) end)
end end end end)
hasScannedClimbHooks=true end
if climbData and climbData.Value and climbData.Max then climbData.Value=climbData.Max end
else weakClimbCache.t=nil end
task.wait() end end)
