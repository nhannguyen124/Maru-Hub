function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso");
    end
end
function AttackNoCoolDown()
    local Hits = {}
    local Enemies = workspace.Enemies:GetChildren()
    local Target = FindEnemiesInRange(Hits, Enemies)
    if not Target then return end

    local Tool = GetEquippedTool()
    if not Tool then return end

    local Character = game.Players.LocalPlayer.Character
    local Root = Character and Character:FindFirstChild("HumanoidRootPart")
    if not Root then return end

    pcall(function()
        if Tool.ToolTip == "Blox Fruit" then
            local Remote = Tool:FindFirstChild("LeftClickRemote")
            if Remote then
                local Direction = (Target.Position - Root.Position).Unit
                Remote:FireServer(Direction, 1) -- combo = 1 (spam)
            end
            return
        end
        local Net = game:GetService("ReplicatedStorage").Modules.Net
        local RegisterAttack = Net["RE/RegisterAttack"]
        local RegisterHit = Net["RE/RegisterHit"]

        if #Hits > 0 then
            RegisterAttack:FireServer(1e-9)
            RegisterHit:FireServer(Target, Hits)
        end
    end)
end
Type = 1;
spawn(function()
    while wait() do
        if (Type == 1) then
            Pos = CFrame.new(0, 20, 0);
        elseif (Type == 2) then
            Pos = CFrame.new(- 40, 20, 0);
        elseif (Type == 3) then
            Pos = CFrame.new(40, 20, 0);
        elseif (Type == 4) then
            Pos = CFrame.new(0, 20, 40);
        elseif (Type == 5) then
            Pos = CFrame.new(0, 20, - 40);
        end
    end
end);
spawn(function()
    while wait() do
        Type = 1;
        wait(0.2);
        Type = 2;
        wait(0.2);
        Type = 3;
        wait(0.2);
        Type = 4;
        wait(0.2);
        Type = 5;
        wait(0.2);
    end
end);
function EquipTool(v217)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(v217) then
        local v570 = game.Players.LocalPlayer.Backpack:FindFirstChild(v217);
        wait();
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v570);
    end
end
TweenSpeed = 350;
function Tween(v211)
    local v212 = (v211.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
    local v213 = TweenSpeed;
    if (v212 >= 350) then
        v213 = TweenSpeed;
    end
    local v214 = TweenInfo.new(v212 / v213, Enum.EasingStyle.Linear);
    local v215 = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v214, {
        CFrame = v211
    });
    v215:Play();
    if _G.StopTween then
        v215:Cancel();
    end
end
function CancelTween(v216)
    if not v216 then
        _G.StopTween = true;
        wait();
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
        wait();
        _G.StopTween = false;
    end
end
task.spawn(function()
    while task.wait() do
        if _G.CastleRaid and _G.PirateRaiding then
            pcall(function()
                local HRP = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
                if not HRP then return end

                local CastleCF = CFrame.new(
                    -5496.17432, 313.768921, -2841.53027,
                    0.924894512, 0, 0.380223751,
                    0, 1, 0,
                    -0.380223751, 0, 0.924894512
                )

                if ((Vector3.new(-5539.31,313.8,-2972.37) - HRP.Position).Magnitude <= 500) then
                    for _, mob in pairs(workspace.Enemies:GetChildren()) do
                        if _G.CastleRaid and _G.PirateRaiding
                        and mob:FindFirstChild("HumanoidRootPart")
                        and mob:FindFirstChild("Humanoid")
                        and mob.Humanoid.Health > 0 then

                            if (mob.HumanoidRootPart.Position - HRP.Position).Magnitude < 2000 then
                                repeat
                                    task.wait(_G.Fast_Delay or 0.1)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(_G.SelectWeapon)

                                    mob.HumanoidRootPart.CanCollide = false
                                    mob.HumanoidRootPart.Size = Vector3.new(60,60,60)

                                    Tween(mob.HumanoidRootPart.CFrame * Pos)
                                until mob.Humanoid.Health <= 0
                                   or not mob.Parent
                                   or not _G.CastleRaid
                                   or not _G.PirateRaiding
                            end
                        end
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                        "requestEntrance",
                        Vector3.new(-5075.5, 314.5, -3150.02)
                    )
                    Tween(CastleCF)
                end
            end)
        end
    end
end)
