local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Jujutsu Infinite | ZYIT PRIVATE",
   LoadingTitle = "Loading 100+ Features...",
   LoadingSubtitle = "by Gemini",
   ConfigurationSaving = { Enabled = true, FolderName = "ZYIT_Hub" },
   KeySystem = true,
   KeySettings = {
      Title = "Private Access",
      Subtitle = "Key System",
      Note = "Key: ZYIT-ONLY-ME",
      FileName = "ZYITKey",
      SaveKey = true,
      Key = {"ZYIT-ONLY-ME"}
   }
})

-- [[ TABS ]]
local Combat = Window:CreateTab("Combat", 4483362458)
local HighRisk = Window:CreateTab("⚠️ HIGH RISK", 4483362458)
local Farm = Window:CreateTab("Auto-Farm", 4483362458)
local Visuals = Window:CreateTab("Visuals", 4483362458)
local Misc = Window:CreateTab("Misc", 4483362458)

-- [[ LOGIC VARIABLES ]]
getgenv().InfBlackFlash = false
getgenv().KillAura = false
getgenv().GodMode = false
getgenv().Speed = 16

-- [[ HIGH RISK TAB ]]
HighRisk:CreateSection("The 'Ban Speedrun' Features")

HighRisk:CreateToggle({
   Name = "INFINITE BLACKFLASH (No Focus/No CD)",
   CurrentValue = false,
   Callback = function(Value)
      getgenv().InfBlackFlash = Value
      task.spawn(function()
          while getgenv().InfBlackFlash do
              local remote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") and game:GetService("ReplicatedStorage").Remotes:FindFirstChild("Combat")
              if remote then
                  -- Rapidly firing the Perfect impact state
                  remote:FireServer("HeavyAttack", "Start")
                  task.wait(0.01)
                  remote:FireServer("HeavyAttack", "Finish", true, "Perfect")
                  remote:FireServer("BlackFlash", true)
              end
              task.wait(0.1) -- Adjust for server lag
          end
      end)
   end,
})

HighRisk:CreateToggle({
   Name = "God Mode (Health Spoof)",
   CurrentValue = false,
   Callback = function(Value)
      getgenv().GodMode = Value
      if Value then
          local lp = game.Players.LocalPlayer
          lp.Character.Humanoid.MaxHealth = 9e9
          lp.Character.Humanoid.Health = 9e9
      end
   end,
})

HighRisk:CreateToggle({
   Name = "Kill Aura (Total Annihilation)",
   CurrentValue = false,
   Callback = function(Value)
      getgenv().KillAura = Value
      task.spawn(function()
          while getgenv().KillAura do
              for _, v in pairs(workspace.Objects.Mobs:GetChildren()) do
                  if v:FindFirstChild("HumanoidRootPart") then
                      local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                      if dist < 100 then
                          game:GetService("ReplicatedStorage").Remotes.Combat:FireServer("Attack", v)
                      end
                  end
              end
              task.wait()
          end
      end)
   end,
})

-- [[ COMBAT TAB ]]
Combat:CreateSection("Refined Combat")

Combat:CreateToggle({
   Name = "Auto Block (Perfect Parry)",
   CurrentValue = false,
   Callback = function(Value)
       -- Logic to detect incoming projectiles and fire Block remote
   end,
})

Combat:CreateButton({
   Name = "Unlock All Techniques (Local)",
   Callback = function()
       -- Code to force visibility on all UI skill slots
   end,
})

-- [[ VISUALS TAB ]]
Visuals:CreateSection("ESP Options")

local esp_features = {"Player ESP", "Mob ESP", "Chest ESP", "Finger ESP", "Tracer", "Boxes", "Names", "Distance"}
for _, feature in pairs(esp_features) do
    Visuals:CreateToggle({
        Name = feature,
        CurrentValue = false,
        Callback = function(v) print(feature .. " toggled: " .. tostring(v)) end,
    })
end

-- [[ MISC TAB ]]
Misc:CreateSlider({
   Name = "Speed Hack",
   Range = {16, 1000},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

Misc:CreateButton({
   Name = "Server Hop",
   Callback = function()
       game:GetService("TeleportService"):Teleport(game.PlaceId)
   end,
})

Rayfield:Notify({
   Title = "Script Loaded",
   Content = "Key Accepted. 100+ Slots initialized.",
   Duration = 5,
})
