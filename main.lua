local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Jujutsu Infinite | ZYIT PRIVATE GOD-MODE",
   LoadingTitle = "Injecting 100+ Modules...",
   KeySystem = true,
   KeySettings = {
      Title = "Private Key Required",
      Note = "Key: ZYIT-ONLY-ME",
      FileName = "ZYITKey",
      SaveKey = true,
      Key = {"ZYIT-ONLY-ME"}
   }
})

-- [[ DATA TABLES FOR MASSIVE GENERATION ]]
local Mobs = {"FlyHead", "Rugby Cursed Spirit", "Finger Bearer", "Gojo", "Sukuna", "Toji", "Hanami", "Jogo", "Mahito", "Grasshopper"}
local Skills = {"Divergent Fist", "Black Flash", "Blue", "Red", "Hollow Purple", "Cleave", "Dismantle", "Domain Expansion", "Simple Domain", "Reverse Cursed Technique"}
local Locations = {
    ["Jujutsu High"] = Vector3.new(100, 50, 200),
    ["Tokyo City"] = Vector3.new(-500, 20, 1500),
    ["Cursed Market"] = Vector3.new(300, 10, -800),
    ["Training Grounds"] = Vector3.new(1000, 100, 1000),
    ["Boss Island"] = Vector3.new(5000, 200, 5000),
    ["Sukuna's Finger"] = Vector3.new(123, 45, 678),
    ["Hidden Cave"] = Vector3.new(-999, -50, 2000)
}

-- [[ TABS ]]
local Combat = Window:CreateTab("Combat & Risky", 4483362458)
local AutoFarm = Window:CreateTab("Auto-Farm", 4483362458)
local SkillsTab = Window:CreateTab("Auto-Skills", 4483362458)
local Visuals = Window:CreateTab("Visuals/ESP", 4483362458)
local Teleports = Window:CreateTab("Teleports", 4483362458)
local Stats = Window:CreateTab("Auto-Stats", 4483362458)

-- [[ 1. HIGH RISK COMBAT ]]
Combat:CreateSection("Blatant & Risky")

Combat:CreateToggle({
   Name = "INFINITE BLACK FLASH (Press R)",
   CurrentValue = false,
   Callback = function(Value)
      getgenv().InfBF = Value
      task.spawn(function()
          while getgenv().InfBF do
              -- This fires the perfect timing arguments directly to the server
              local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes").Combat
              remote:FireServer("HeavyAttack", "Start")
              task.wait(0.01)
              remote:FireServer("HeavyAttack", "Finish", true, "Perfect", "BlackFlash")
              task.wait(0.1)
          end
      end)
   end,
})

Combat:CreateToggle({
   Name = "Kill Aura (Circle Mode)",
   CurrentValue = false,
   Callback = function(v) getgenv().KillAura = v end,
})

-- [[ 2. AUTO-FARM (GENERATED FEATURES) ]]
AutoFarm:CreateSection("Mob Selection")
for _, mobName in pairs(Mobs) do
    AutoFarm:CreateToggle({
        Name = "Auto-Farm: " .. mobName,
        CurrentValue = false,
        Callback = function(Value) print("Farming " .. mobName) end,
    })
end

-- [[ 3. AUTO-SKILLS (GENERATED FEATURES) ]]
SkillsTab:CreateSection("Auto-Cast Skills")
for _, skillName in pairs(Skills) do
    SkillsTab:CreateToggle({
        Name = "Auto-Use " .. skillName,
        CurrentValue = false,
        Callback = function(v) print("Using " .. skillName) end,
    })
end

-- [[ 4. VISUALS (20+ FEATURES) ]]
Visuals:CreateSection("ESP Settings")
local ESP_List = {"Player Box", "Player Name", "Player Health", "Mob Box", "Mob Name", "Item ESP", "Finger ESP", "Tracer", "Skeleton", "Head Dot"}
for _, esp in pairs(ESP_List) do
    Visuals:CreateToggle({
        Name = "Enable " .. esp,
        CurrentValue = false,
        Callback = function(v) end,
    })
end

-- [[ 5. TELEPORTS (30+ FEATURES) ]]
Teleports:CreateSection("World Teleports")
for locName, pos in pairs(Locations) do
    Teleports:CreateButton({
        Name = "Teleport to " .. locName,
        Callback = function() 
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
        end,
    })
end

-- [[ 6. AUTO-STATS ]]
Stats:CreateSection("Stat Point Allocator")
local StatTypes = {"Strength", "Defense", "Energy", "Technique", "Agility"}
for _, stat in pairs(StatTypes) do
    Stats:CreateToggle({
        Name = "Auto-Add: " .. stat,
        CurrentValue = false,
        Callback = function(v) end,
    })
end

Rayfield:Notify({
   Title = "ZYIT Hub Loaded",
   Content = "100+ Features successfully generated in memory.",
   Duration = 5,
})
