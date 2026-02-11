local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local FOLDER = "MaruHub"
local FILE = string.format(
    "%s/%s_%s.lua",
    FOLDER,
    game.PlaceId,
    LocalPlayer.UserId
)
if not isfolder(FOLDER) then
    makefolder(FOLDER)
end
local function serialize(tbl, indent)
    indent = indent or ""
    local nextIndent = indent .. "  "
    local lines = {}

    table.insert(lines, "{")
    for k, v in pairs(tbl) do
        if typeof(v) ~= "function" then
            local valueStr
            local t = typeof(v)

            if t == "string" then
                valueStr = string.format("%q", v)
            elseif t == "number" or t == "boolean" then
                valueStr = tostring(v)
            elseif t == "table" then
                valueStr = serialize(v, nextIndent)
            else
                valueStr = "nil"
            end

            table.insert(
                lines,
                string.format("%s%s = %s,", nextIndent, k, valueStr)
            )
        end
    end
    table.insert(lines, indent .. "}")

    return table.concat(lines, "\n")
end

local function SaveConfig(Config)
    local ok, data = pcall(function()
        return "return " .. serialize(Config)
    end)

    if ok then
        writefile(FILE, data)
    else
        warn("❌ Save Config thất bại")
    end
end
local function LoadConfig()
    if not isfile(FILE) then
        return {}
    end

    local ok, result = pcall(function()
        return loadstring(readfile(FILE))()
    end)

    if not ok or typeof(result) ~= "table" then
        warn("⚠️ Config file lỗi → reset")
        return {}
    end

    return result
end
local function MergeConfig(default, saved)
    if typeof(default) ~= "table" then
        return saved or {}
    end

    if typeof(saved) ~= "table" then
        saved = {}
    end

    local result = {}

    for k, v in pairs(default) do
        if saved[k] == nil then
            result[k] = v
        elseif typeof(v) == "table" and typeof(saved[k]) == "table" then
            result[k] = MergeConfig(v, saved[k])
        else
            result[k] = saved[k]
        end
    end

    return result
end

local SavedConfig = LoadConfig()
local Config = MergeConfig(DefaultConfig, SavedConfig)
wait(0.05)
if getgenv().MaruHubLoaded then return end
getgenv().MaruHubLoaded = true
local v14 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))();
local v15 = v14:CreateWindow({
    Title = "Maru Hub [Freemium]",
    SubTitle = "By lumakd",
    TabWidth = 160,
    Theme = "Amethyst",
    Acrylic = false,
    Size = UDim2.fromOffset(500, 320),
    MinimizeKey = Enum.KeyCode.End
});
local v16 = {
    Home = v15:AddTab({
        Title = "Thông Tin"
    }),
    Main = v15:AddTab({
        Title = "Main"
    }),
    Sea = v15:AddTab({
        Title = "Sự Kiện"
    }),
    ITM = v15:AddTab({
        Title = "Vật Phẩm"
    }),
    Setting = v15:AddTab({
        Title = "Cài Đặt"
    }),
    Status = v15:AddTab({
        Title = "Máy Chủ"
    }),
    Stats = v15:AddTab({
        Title = "Chỉ Số"
    }),
    Player = v15:AddTab({
        Title = "Người Chơi"
    }),
    Teleport = v15:AddTab({
        Title = "Dịch Chuyển"
    }),
    Visual = v15:AddTab({
        Title = "Giả"
    }),
    Fruit = v15:AddTab({
        Title = "Trái"
    }),
    Raid = v15:AddTab({
        Title = "Tập Kích"
    }),
    Race = v15:AddTab({
        Title = "Tộc"
    }),
    Shop = v15:AddTab({
        Title = "Cửa Hàng"
    }),
    Misc = v15:AddTab({
        Title = "Khác"
    })
};
local v17 = v14.Options;
local v18 = game.PlaceId;
if (v18 == 2753915549) then
    Sea1 = true;
elseif (v18 == 4442272183) then
    Sea2 = true;
elseif (v18 == 73902483975735) then
    Dungeon = true
else
    Sea3 = true;
end
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
    wait(0.05);
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
end);
Sea1 = false;
Sea2 = false;
Sea3 = false;
local v19 = game.PlaceId;
if (v19 == 2753915549) then
    Sea1 = true;
elseif (v19 == 4442272183) then
    Sea2 = true;
else
    Sea3 = true;
end
function CheckLevel()
    local v197 = game:GetService("Players").LocalPlayer.Data.Level.Value;
    if Sea1 then
        if ((v197 == 1) or (v197 <= 9) or (SelectMonster == "Bandit")) then
            Ms = "Bandit";
            NameQuest = "BanditQuest1";
            QuestLv = 1;
            NameMon = "Bandit";
            CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875);
            CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953);
        elseif ((v197 == 10) or (v197 <= 14) or (SelectMonster == "Monkey")) then
            Ms = "Monkey";
            NameQuest = "JungleQuest";
            QuestLv = 1;
            NameMon = "Monkey";
            CFrameQ = CFrame.new(- 1601.6553955078, 36.85213470459, 153.38809204102);
            CFrameMon = CFrame.new(- 1448.1446533203, 50.851993560791, 63.60718536377);
        elseif ((v197 == 15) or (v197 <= 29) or (SelectMonster == "Gorilla")) then
            Ms = "Gorilla";
            NameQuest = "JungleQuest";
            QuestLv = 2;
            NameMon = "Gorilla";
            CFrameQ = CFrame.new(- 1601.6553955078, 36.85213470459, 153.38809204102);
            CFrameMon = CFrame.new(- 1142.6488037109, 40.462348937988, - 515.39227294922);
        elseif ((v197 == 30) or (v197 <= 39) or (SelectMonster == "Pirate")) then
            Ms = "Pirate";
            NameQuest = "BuggyQuest1";
            QuestLv = 1;
            NameMon = "Pirate";
            CFrameQ = CFrame.new(- 1140.1761474609, 4.752049446106, 3827.4057617188);
            CFrameMon = CFrame.new(- 1201.0881347656, 40.628940582275, 3857.5966796875);
        elseif ((v197 == 40) or (v197 <= 59) or (SelectMonster == "Brute")) then
            Ms = "Brute";
            NameQuest = "BuggyQuest1";
            QuestLv = 2;
            NameMon = "Brute";
            CFrameQ = CFrame.new(- 1140.1761474609, 4.752049446106, 3827.4057617188);
            CFrameMon = CFrame.new(- 1387.5324707031, 24.592035293579, 4100.9575195313);
        elseif ((v197 == 60) or (v197 <= 74) or (SelectMonster == "Desert Bandit")) then
            Ms = "Desert Bandit";
            NameQuest = "DesertQuest";
            QuestLv = 1;
            NameMon = "Desert Bandit";
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625);
            CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625);
        elseif ((v197 == 75) or (v197 <= 89) or (SelectMonster == "Desert Officer")) then
            Ms = "Desert Officer";
            NameQuest = "DesertQuest";
            QuestLv = 2;
            NameMon = "Desert Officer";
            CFrameQ = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688);
            CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688);
        elseif ((v197 == 90) or (v197 <= 99) or (SelectMonster == "Snow Bandit")) then
            Ms = "Snow Bandit";
            NameQuest = "SnowQuest";
            QuestLv = 1;
            NameMon = "Snow Bandit";
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, - 1298.3576660156);
            CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, - 1328.2418212891);
        elseif ((v197 == 100) or (v197 <= 119) or (SelectMonster == "Snowman")) then
            Ms = "Snowman";
            NameQuest = "SnowQuest";
            QuestLv = 2;
            NameMon = "Snowman";
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, - 1298.3576660156);
            CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, - 1488.0262451172);
        elseif ((v197 == 120) or (v197 <= 149) or (SelectMonster == "Chief Petty Officer")) then
            Ms = "Chief Petty Officer";
            NameQuest = "MarineQuest2";
            QuestLv = 1;
            NameMon = "Chief Petty Officer";
            CFrameQ = CFrame.new(- 5035.49609375, 28.677835464478, 4324.1840820313);
            CFrameMon = CFrame.new(- 4931.1552734375, 65.793113708496, 4121.8393554688);
        elseif ((v197 == 150) or (v197 <= 174) or (SelectMonster == "Sky Bandit")) then
            Ms = "Sky Bandit";
            NameQuest = "SkyQuest";
            QuestLv = 1;
            NameMon = "Sky Bandit";
            CFrameQ = CFrame.new(- 4842.1372070313, 717.69543457031, - 2623.0483398438);
            CFrameMon = CFrame.new(- 4955.6411132813, 365.46365356445, - 2908.1865234375);
        elseif ((v197 == 175) or (v197 <= 189) or (SelectMonster == "Dark Master")) then
            Ms = "Dark Master";
            NameQuest = "SkyQuest";
            QuestLv = 2;
            NameMon = "Dark Master";
            CFrameQ = CFrame.new(- 4842.1372070313, 717.69543457031, - 2623.0483398438);
            CFrameMon = CFrame.new(- 5148.1650390625, 439.04571533203, - 2332.9611816406);
        elseif ((v197 == 190) or (v197 <= 209) or (SelectMonster == "Prisoner")) then
            Ms = "Prisoner";
            NameQuest = "PrisonerQuest";
            QuestLv = 1;
            NameMon = "Prisoner";
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, - 0.999846935, 0, 0.0175017118);
            CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, - 0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816);
        elseif ((v197 == 210) or (v197 <= 249) or (SelectMonster == "Dangerous Prisoner")) then
            Ms = "Dangerous Prisoner";
            NameQuest = "PrisonerQuest";
            QuestLv = 2;
            NameMon = "Dangerous Prisoner";
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, - 0.999846935, 0, 0.0175017118);
            CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, - 0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827);
        elseif ((v197 == 250) or (v197 <= 274) or (SelectMonster == "Toga Warrior")) then
            Ms = "Toga Warrior";
            NameQuest = "ColosseumQuest";
            QuestLv = 1;
            NameMon = "Toga Warrior";
            CFrameQ = CFrame.new(- 1577.7890625, 7.4151420593262, - 2984.4838867188);
            CFrameMon = CFrame.new(- 1872.5166015625, 49.080215454102, - 2913.810546875);
        elseif ((v197 == 275) or (v197 <= 299) or (SelectMonster == "Gladiator")) then
            Ms = "Gladiator";
            NameQuest = "ColosseumQuest";
            QuestLv = 2;
            NameMon = "Gladiator";
            CFrameQ = CFrame.new(- 1577.7890625, 7.4151420593262, - 2984.4838867188);
            CFrameMon = CFrame.new(- 1521.3740234375, 81.203170776367, - 3066.3139648438);
        elseif ((v197 == 300) or (v197 <= 324) or (SelectMonster == "Military Soldier")) then
            Ms = "Military Soldier";
            NameQuest = "MagmaQuest";
            QuestLv = 1;
            NameMon = "Military Soldier";
            CFrameQ = CFrame.new(- 5316.1157226563, 12.262831687927, 8517.00390625);
            CFrameMon = CFrame.new(- 5369.0004882813, 61.24352645874, 8556.4921875);
        elseif ((v197 == 325) or (v197 <= 374) or (SelectMonster == "Military Spy")) then
            Ms = "Military Spy";
            NameQuest = "MagmaQuest";
            QuestLv = 2;
            NameMon = "Military Spy";
            CFrameQ = CFrame.new(- 5316.1157226563, 12.262831687927, 8517.00390625);
            CFrameMon = CFrame.new(- 5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, - 0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562);
        elseif ((v197 == 375) or (v197 <= 399) or (SelectMonster == "Fishman Warrior")) then
            Ms = "Fishman Warrior";
            NameQuest = "FishmanQuest";
            QuestLv = 1;
            NameMon = "Fishman Warrior";
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
            CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
            end
        elseif ((v197 == 400) or (v197 <= 449) or (SelectMonster == "Fishman Commando")) then
            Ms = "Fishman Commando";
            NameQuest = "FishmanQuest";
            QuestLv = 2;
            NameMon = "Fishman Commando";
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
            end
        elseif ((v197 == 10) or (v197 <= 474) or (SelectMonster == "God's Guard")) then
            Ms = "God's Guard";
            NameQuest = "SkyExp1Quest";
            QuestLv = 1;
            NameMon = "God's Guard";
            CFrameQ = CFrame.new(- 4721.8603515625, 845.30297851563, - 1953.8489990234);
            CFrameMon = CFrame.new(- 4628.0498046875, 866.92877197266, - 1931.2352294922);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.82275, 872.54248, - 1667.55688));
            end
        elseif ((v197 == 475) or (v197 <= 524) or (SelectMonster == "Shanda")) then
            Ms = "Shanda";
            NameQuest = "SkyExp1Quest";
            QuestLv = 2;
            NameMon = "Shanda";
            CFrameQ = CFrame.new(- 7863.1596679688, 5545.5190429688, - 378.42266845703);
            CFrameMon = CFrame.new(- 7685.1474609375, 5601.0751953125, - 441.38876342773);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047));
            end
        elseif ((v197 == 525) or (v197 <= 549) or (SelectMonster == "Royal Squad")) then
            Ms = "Royal Squad";
            NameQuest = "SkyExp2Quest";
            QuestLv = 1;
            NameMon = "Royal Squad";
            CFrameQ = CFrame.new(- 7903.3828125, 5635.9897460938, - 1410.923828125);
            CFrameMon = CFrame.new(- 7654.2514648438, 5637.1079101563, - 1407.7550048828);
        elseif ((v197 == 550) or (v197 <= 624) or (SelectMonster == "Royal Soldier")) then
            Ms = "Royal Soldier";
            NameQuest = "SkyExp2Quest";
            QuestLv = 2;
            NameMon = "Royal Soldier";
            CFrameQ = CFrame.new(- 7903.3828125, 5635.9897460938, - 1410.923828125);
            CFrameMon = CFrame.new(- 7760.4106445313, 5679.9077148438, - 1884.8112792969);
        elseif ((v197 == 625) or (v197 <= 649) or (SelectMonster == "Galley Pirate")) then
            Ms = "Galley Pirate";
            NameQuest = "FountainQuest";
            QuestLv = 1;
            NameMon = "Galley Pirate";
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875);
            CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063);
        elseif ((v197 >= 650) or (SelectMonster == "Galley Captain")) then
            Ms = "Galley Captain";
            NameQuest = "FountainQuest";
            QuestLv = 2;
            NameMon = "Galley Captain";
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875);
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188);
        end
    end
    if Sea2 then
        if ((v197 == 700) or (v197 <= 724) or (SelectMonster == "Raider")) then
            Ms = "Raider";
            NameQuest = "Area1Quest";
            QuestLv = 1;
            NameMon = "Raider";
            CFrameQ = CFrame.new(- 427.72567749023, 72.99634552002, 1835.9426269531);
            CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688);
        elseif ((v197 == 725) or (v197 <= 774) or (SelectMonster == "Mercenary")) then
            Ms = "Mercenary";
            NameQuest = "Area1Quest";
            QuestLv = 2;
            NameMon = "Mercenary";
            CFrameQ = CFrame.new(- 427.72567749023, 72.99634552002, 1835.9426269531);
            CFrameMon = CFrame.new(- 864.85009765625, 122.47104644775, 1453.1505126953);
        elseif ((v197 == 775) or (v197 <= 799) or (SelectMonster == "Swan Pirate")) then
            Ms = "Swan Pirate";
            NameQuest = "Area2Quest";
            QuestLv = 1;
            NameMon = "Swan Pirate";
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125);
            CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125);
        elseif ((v197 == 800) or (v197 <= 874) or (SelectMonster == "Factory Staff")) then
            Ms = "Factory Staff";
            NameQuest = "Area2Quest";
            QuestLv = 2;
            NameMon = "Factory Staff";
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125);
            CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797);
        elseif ((v197 == 875) or (v197 <= 899) or (SelectMonster == "Marine Lieutenan")) then
            Ms = "Marine Lieutenant";
            NameQuest = "MarineQuest3";
            QuestLv = 1;
            NameMon = "Marine Lieutenant";
            CFrameQ = CFrame.new(- 2440.9934082031, 73.04190826416, - 3217.7082519531);
            CFrameMon = CFrame.new(- 2489.2622070313, 84.613594055176, - 3151.8830566406);
        elseif ((v197 == 900) or (v197 <= 949) or (SelectMonster == "Marine Captain")) then
            Ms = "Marine Captain";
            NameQuest = "MarineQuest3";
            QuestLv = 2;
            NameMon = "Marine Captain";
            CFrameQ = CFrame.new(- 2440.9934082031, 73.04190826416, - 3217.7082519531);
            CFrameMon = CFrame.new(- 2335.2026367188, 79.786659240723, - 3245.8674316406);
        elseif ((v197 == 950) or (v197 <= 974) or (SelectMonster == "Zombie")) then
            Ms = "Zombie";
            NameQuest = "ZombieQuest";
            QuestLv = 1;
            NameMon = "Zombie";
            CFrameQ = CFrame.new(- 5494.3413085938, 48.505931854248, - 794.59094238281);
            CFrameMon = CFrame.new(- 5536.4970703125, 101.08577728271, - 835.59075927734);
        elseif ((v197 == 975) or (v197 <= 999) or (SelectMonster == "Vampire")) then
            Ms = "Vampire";
            NameQuest = "ZombieQuest";
            QuestLv = 2;
            NameMon = "Vampire";
            CFrameQ = CFrame.new(- 5494.3413085938, 48.505931854248, - 794.59094238281);
            CFrameMon = CFrame.new(- 5806.1098632813, 16.722528457642, - 1164.4384765625);
        elseif ((v197 == 1000) or (v197 <= 1049) or (SelectMonster == "Snow Trooper")) then
            Ms = "Snow Trooper";
            NameQuest = "SnowMountainQuest";
            QuestLv = 1;
            NameMon = "Snow Trooper";
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, - 5370.5546875);
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, - 5484.9165039063);
        elseif ((v197 == 1050) or (v197 <= 1099) or (SelectMonster == "Winter Warrior")) then
            Ms = "Winter Warrior";
            NameQuest = "SnowMountainQuest";
            QuestLv = 2;
            NameMon = "Winter Warrior";
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, - 5370.5546875);
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, - 5174.130859375);
        elseif ((v197 == 1100) or (v197 <= 1124) or (SelectMonster == "Lab Subordinate")) then
            Ms = "Lab Subordinate";
            NameQuest = "IceSideQuest";
            QuestLv = 1;
            NameMon = "Lab Subordinate";
            CFrameQ = CFrame.new(- 6061.841796875, 15.926671981812, - 4902.0385742188);
            CFrameMon = CFrame.new(- 5720.5576171875, 63.309471130371, - 4784.6103515625);
        elseif ((v197 == 1125) or (v197 <= 1174) or (SelectMonster == "Horned Warrior")) then
            Ms = "Horned Warrior";
            NameQuest = "IceSideQuest";
            QuestLv = 2;
            NameMon = "Horned Warrior";
            CFrameQ = CFrame.new(- 6061.841796875, 15.926671981812, - 4902.0385742188);
            CFrameMon = CFrame.new(- 6292.751953125, 91.181983947754, - 5502.6499023438);
        elseif ((v197 == 1175) or (v197 <= 1199) or (SelectMonster == "Magma Ninja")) then
            Ms = "Magma Ninja";
            NameQuest = "FireSideQuest";
            QuestLv = 1;
            NameMon = "Magma Ninja";
            CFrameQ = CFrame.new(- 5429.0473632813, 15.977565765381, - 5297.9614257813);
            CFrameMon = CFrame.new(- 5461.8388671875, 130.36347961426, - 5836.4702148438);
        elseif ((v197 == 1200) or (v197 <= 1249) or (SelectMonster == "Lava Pirate")) then
            Ms = "Lava Pirate";
            NameQuest = "FireSideQuest";
            QuestLv = 2;
            NameMon = "Lava Pirate";
            CFrameQ = CFrame.new(- 5429.0473632813, 15.977565765381, - 5297.9614257813);
            CFrameMon = CFrame.new(- 5251.1889648438, 55.164535522461, - 4774.4096679688);
        elseif ((v197 == 1250) or (v197 <= 1274) or (SelectMonster == "Ship Deckhand")) then
            Ms = "Ship Deckhand";
            NameQuest = "ShipQuest1";
            QuestLv = 1;
            NameMon = "Ship Deckhand";
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625);
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
            end
        elseif ((v197 == 1275) or (v197 <= 1299) or (SelectMonster == "Ship Engineer")) then
            Ms = "Ship Engineer";
            NameQuest = "ShipQuest1";
            QuestLv = 2;
            NameMon = "Ship Engineer";
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625);
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
            end
        elseif ((v197 == 1300) or (v197 <= 1324) or (SelectMonster == "Ship Steward")) then
            Ms = "Ship Steward";
            NameQuest = "ShipQuest2";
            QuestLv = 1;
            NameMon = "Ship Steward";
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875);
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
            end
        elseif ((v197 == 1325) or (v197 <= 1349) or (SelectMonster == "Ship Officer")) then
            Ms = "Ship Officer";
            NameQuest = "ShipQuest2";
            QuestLv = 2;
            NameMon = "Ship Officer";
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875);
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
            end
        elseif ((v197 == 1350) or (v197 <= 1374) or (SelectMonster == "Arctic Warrior")) then
            Ms = "Arctic Warrior";
            NameQuest = "FrostQuest";
            QuestLv = 1;
            NameMon = "Arctic Warrior";
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, - 6484.6005859375);
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, - 6472.7568359375);
            if (_G.AutoLevel and ((CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000)) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422));
            end
        elseif ((v197 == 1375) or (v197 <= 1424) or (SelectMonster == "Snow Lurker")) then
            Ms = "Snow Lurker";
            NameQuest = "FrostQuest";
            QuestLv = 2;
            NameMon = "Snow Lurker";
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, - 6484.6005859375);
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, - 6618.3481445313);
        elseif ((v197 == 1425) or (v197 <= 1449) or (SelectMonster == "Sea Soldier")) then
            Ms = "Sea Soldier";
            NameQuest = "ForgottenQuest";
            QuestLv = 1;
            NameMon = "Sea Soldier";
            CFrameQ = CFrame.new(- 3054.5827636719, 236.87213134766, - 10147.790039063);
            CFrameMon = CFrame.new(- 3185.0153808594, 58.789089202881, - 9663.6064453125);
        elseif ((v197 >= 1450) or (SelectMonster == "Water Fighter")) then
            Ms = "Water Fighter";
            NameQuest = "ForgottenQuest";
            QuestLv = 2;
            NameMon = "Water Fighter";
            CFrameQ = CFrame.new(- 3054.5827636719, 236.87213134766, - 10147.790039063);
            CFrameMon = CFrame.new(- 3262.9301757813, 298.69036865234, - 10552.529296875);
        end
    end
    if Sea3 then
        if ((v197 == 1500) or (v197 <= 1524) or (SelectMonster == "Pirate Millionaire")) then
            Ms = "Pirate Millionaire";
            NameQuest = "PiratePortQuest";
            QuestLv = 1;
            NameMon = "Pirate Millionaire";
            CFrameQ = CFrame.new(- 450.1046447753906, 107.68145751953125, 5950.72607421875);
            CFrameMon = CFrame.new(- 193.99227905273438, 56.12502670288086, 5755.7880859375);
        elseif ((v197 == 1525) or (v197 <= 1574) or (SelectMonster == "Pistol Billionaire")) then
            Ms = "Pistol Billionaire";
            NameQuest = "PiratePortQuest";
            QuestLv = 2;
            NameMon = "Pistol Billionaire";
            CFrameQ = CFrame.new(- 450.1046447753906, 107.68145751953125, 5950.72607421875);
            CFrameMon = CFrame.new(- 188.14462280273438, 84.49613189697266, 6337.0419921875);
        elseif ((v197 == 1575) or (v197 <= 1599) or (SelectMonster == "Dragon Crew Warrior")) then
            Ms = "Dragon Crew Warrior";
            NameQuest = "DragonCrewQuest";
            QuestLv = 1;
            NameMon = "Dragon Crew Warrior";
            CFrameQ = CFrame.new(6735.11083984375, 126.99046325683594, - 711.0979614257812);
            CFrameMon = CFrame.new(6615.2333984375, 50.847679138183594, - 978.93408203125);
        elseif ((v197 == 1600) or (v197 <= 1624) or (SelectMonster == "Dragon Crew Archer")) then
            Ms = "Dragon Crew Archer";
            NameQuest = "DragonCrewQuest";
            QuestLv = 2;
            NameMon = "Dragon Crew Archer";
            CFrameQ = CFrame.new(6735.11083984375, 126.99046325683594, - 711.0979614257812);
            CFrameMon = CFrame.new(6818.58935546875, 483.718994140625, 512.726806640625);
        elseif ((v197 == 1625) or (v197 <= 1649) or (SelectMonster == "Hydra Enforcer")) then
            Ms = "Hydra Enforcer";
            NameQuest = "VenomCrewQuest";
            QuestLv = 1;
            NameMon = "Hydra Enforcer";
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422);
            CFrameMon = CFrame.new(4547.115234375, 1001.60205078125, 334.1954650878906);
        elseif ((v197 == 1650) or (v197 <= 1699) or (SelectMonster == "Venomous Assailant")) then
            Ms = "Venomous Assailant";
            NameQuest = "VenomCrewQuest";
            QuestLv = 2;
            NameMon = "Venomous Assailant";
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422);
            CFrameMon = CFrame.new(4637.88525390625, 1077.85595703125, 882.4183959960938);
        elseif ((v197 == 1700) or (v197 <= 1724) or (SelectMonster == "Marine Commodore")) then
            Ms = "Marine Commodore";
            NameQuest = "MarineTreeIsland";
            QuestLv = 1;
            NameMon = "Marine Commodore";
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, - 6740.0551757813);
            CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, - 7109.5043945313);
        elseif ((v197 == 1725) or (v197 <= 1774) or (SelectMonster == "Marine Rear Admiral")) then
            Ms = "Marine Rear Admiral";
            NameQuest = "MarineTreeIsland";
            QuestLv = 2;
            NameMon = "Marine Rear Admiral";
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, - 6740.0551757813);
            CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, - 7048.6342773438);
        elseif ((v197 == 1775) or (v197 <= 1799) or (SelectMonster == "Fishman Raider")) then
            Ms = "Fishman Raider";
            NameQuest = "DeepForestIsland3";
            QuestLv = 1;
            NameMon = "Fishman Raider";
            CFrameQ = CFrame.new(- 10582.759765625, 331.78845214844, - 8757.666015625);
            CFrameMon = CFrame.new(- 10553.268554688, 521.38439941406, - 8176.9458007813);
        elseif ((v197 == 1800) or (v197 <= 1824) or (SelectMonster == "Fishman Captain")) then
            Ms = "Fishman Captain";
            NameQuest = "DeepForestIsland3";
            QuestLv = 2;
            NameMon = "Fishman Captain";
            CFrameQ = CFrame.new(- 10583.099609375, 331.78845214844, - 8759.4638671875);
            CFrameMon = CFrame.new(- 10789.401367188, 427.18637084961, - 9131.4423828125);
        elseif ((v197 == 1825) or (v197 <= 1849) or (SelectMonster == "Forest Pirate")) then
            Ms = "Forest Pirate";
            NameQuest = "DeepForestIsland";
            QuestLv = 1;
            NameMon = "Forest Pirate";
            CFrameQ = CFrame.new(- 13232.662109375, 332.40396118164, - 7626.4819335938);
            CFrameMon = CFrame.new(- 13489.397460938, 400.30349731445, - 7770.251953125);
        elseif ((v197 == 1850) or (v197 <= 1899) or (SelectMonster == "Mythological Pirate")) then
            Ms = "Mythological Pirate";
            NameQuest = "DeepForestIsland";
            QuestLv = 2;
            NameMon = "Mythological Pirate";
            CFrameQ = CFrame.new(- 13232.662109375, 332.40396118164, - 7626.4819335938);
            CFrameMon = CFrame.new(- 13508.616210938, 582.46228027344, - 6985.3037109375);
        elseif ((v197 == 1900) or (v197 <= 1924) or (SelectMonster == "Jungle Pirate")) then
            Ms = "Jungle Pirate";
            NameQuest = "DeepForestIsland2";
            QuestLv = 1;
            NameMon = "Jungle Pirate";
            CFrameQ = CFrame.new(- 12682.096679688, 390.88653564453, - 9902.1240234375);
            CFrameMon = CFrame.new(- 12267.103515625, 459.75262451172, - 10277.200195313);
        elseif ((v197 == 1925) or (v197 <= 1974) or (SelectMonster == "Musketeer Pirate")) then
            Ms = "Musketeer Pirate";
            NameQuest = "DeepForestIsland2";
            QuestLv = 2;
            NameMon = "Musketeer Pirate";
            CFrameQ = CFrame.new(- 12682.096679688, 390.88653564453, - 9902.1240234375);
            CFrameMon = CFrame.new(- 13291.5078125, 520.47338867188, - 9904.638671875);
        elseif ((v197 == 1975) or (v197 <= 1999) or (SelectMonster == "Reborn Skeleton")) then
            Ms = "Reborn Skeleton";
            NameQuest = "HauntedQuest1";
            QuestLv = 1;
            NameMon = "Reborn Skeleton";
            CFrameQ = CFrame.new(- 9480.80762, 142.130661, 5566.37305, - 0.00655503059, 4.5295423e-8, - 0.999978542, 2.0492047e-8, 1, 4.5162068e-8, 0.999978542, - 2.0195568e-8, - 0.00655503059);
            CFrameMon = CFrame.new(- 8761.77148, 183.431747, 6168.33301, 0.978073597, - 0.000013950732, - 0.208259016, - 0.0000010807393, 1, - 0.00007206303, 0.208259016, 0.00007070804, 0.978073597);
        elseif ((v197 == 2000) or (v197 <= 2024) or (SelectMonster == "Living Zombie")) then
            Ms = "Living Zombie";
            NameQuest = "HauntedQuest1";
            QuestLv = 2;
            NameMon = "Living Zombie";
            CFrameQ = CFrame.new(- 9480.80762, 142.130661, 5566.37305, - 0.00655503059, 4.5295423e-8, - 0.999978542, 2.0492047e-8, 1, 4.5162068e-8, 0.999978542, - 2.0195568e-8, - 0.00655503059);
            CFrameMon = CFrame.new(- 10103.7529, 238.565979, 6179.75977, 0.999474227, 2.7754714e-8, 0.0324240364, - 2.5800633e-8, 1, - 6.068485e-8, - 0.0324240364, 5.981639e-8, 0.999474227);
        elseif ((v197 == 2025) or (v197 <= 2049) or (SelectMonster == "Demonic Soul")) then
            Ms = "Demonic Soul";
            NameQuest = "HauntedQuest2";
            QuestLv = 1;
            NameMon = "Demonic Soul";
            CFrameQ = CFrame.new(- 9516.9931640625, 178.00651550293, 6078.4653320313);
            CFrameMon = CFrame.new(- 9712.03125, 204.69589233398, 6193.322265625);
        elseif ((v197 == 2050) or (v197 <= 2074) or (SelectMonster == "Posessed Mummy")) then
            Ms = "Posessed Mummy";
            NameQuest = "HauntedQuest2";
            QuestLv = 2;
            NameMon = "Posessed Mummy";
            CFrameQ = CFrame.new(- 9516.9931640625, 178.00651550293, 6078.4653320313);
            CFrameMon = CFrame.new(- 9545.7763671875, 69.619895935059, 6339.5615234375);
        elseif ((v197 == 2075) or (v197 <= 2099) or (SelectMonster == "Peanut Scout")) then
            Ms = "Peanut Scout";
            NameQuest = "NutsIslandQuest";
            QuestLv = 1;
            NameMon = "Peanut Scout";
            CFrameQ = CFrame.new(- 2105.53198, 37.2495995, - 10195.5088, - 0.766061664, 0, - 0.642767608, 0, 1, 0, 0.642767608, 0, - 0.766061664);
            CFrameMon = CFrame.new(- 2150.587890625, 122.49767303467, - 10358.994140625);
        elseif ((v197 == 2100) or (v197 <= 2124) or (SelectMonster == "Peanut President")) then
            Ms = "Peanut President";
            NameQuest = "NutsIslandQuest";
            QuestLv = 2;
            NameMon = "Peanut President";
            CFrameQ = CFrame.new(- 2105.53198, 37.2495995, - 10195.5088, - 0.766061664, 0, - 0.642767608, 0, 1, 0, 0.642767608, 0, - 0.766061664);
            CFrameMon = CFrame.new(- 2150.587890625, 122.49767303467, - 10358.994140625);
        elseif ((v197 == 2125) or (v197 <= 2149) or (SelectMonster == "Ice Cream Chef")) then
            Ms = "Ice Cream Chef";
            NameQuest = "IceCreamIslandQuest";
            QuestLv = 1;
            NameMon = "Ice Cream Chef";
            CFrameQ = CFrame.new(- 819.376709, 64.9259796, - 10967.2832, - 0.766061664, 0, 0.642767608, 0, 1, 0, - 0.642767608, 0, - 0.766061664);
            CFrameMon = CFrame.new(- 789.941528, 209.382889, - 11009.9805, - 0.0703101531, "-0", - 0.997525156, "-0", 1.00000012, "-0", 0.997525275, 0, - 0.0703101456);
        elseif ((v197 == 2150) or (v197 <= 2199) or (SelectMonster == "Ice Cream Commander")) then
            Ms = "Ice Cream Commander";
            NameQuest = "IceCreamIslandQuest";
            QuestLv = 2;
            NameMon = "Ice Cream Commander";
            CFrameQ = CFrame.new(- 819.376709, 64.9259796, - 10967.2832, - 0.766061664, 0, 0.642767608, 0, 1, 0, - 0.642767608, 0, - 0.766061664);
            CFrameMon = CFrame.new(- 789.941528, 209.382889, - 11009.9805, - 0.0703101531, "-0", - 0.997525156, "-0", 1.00000012, "-0", 0.997525275, 0, - 0.0703101456);
        elseif ((v197 == 2200) or (v197 <= 2224) or (SelectMonster == "Cookie Crafter")) then
            Ms = "Cookie Crafter";
            NameQuest = "CakeQuest1";
            QuestLv = 1;
            NameMon = "Cookie Crafter";
            CFrameQ = CFrame.new(- 2022.29858, 36.9275894, - 12030.9766, - 0.961273909, 0, - 0.275594592, 0, 1, 0, 0.275594592, 0, - 0.961273909);
            CFrameMon = CFrame.new(- 2321.71216, 36.699482, - 12216.7871, - 0.780074954, 0, 0.625686109, 0, 1, 0, - 0.625686109, 0, - 0.780074954);
        elseif ((v197 == 2225) or (v197 <= 2249) or (SelectMonster == "Cake Guard")) then
            Ms = "Cake Guard";
            NameQuest = "CakeQuest1";
            QuestLv = 2;
            NameMon = "Cake Guard";
            CFrameQ = CFrame.new(- 2022.29858, 36.9275894, - 12030.9766, - 0.961273909, 0, - 0.275594592, 0, 1, 0, 0.275594592, 0, - 0.961273909);
            CFrameMon = CFrame.new(- 1418.11011, 36.6718941, - 12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, - 0.997700036, 0, 0.0677844882);
        elseif ((v197 == 2250) or (v197 <= 2274) or (SelectMonster == "Baking Staff")) then
            Ms = "Baking Staff";
            NameQuest = "CakeQuest2";
            QuestLv = 1;
            NameMon = "Baking Staff";
            CFrameQ = CFrame.new(- 1928.31763, 37.7296638, - 12840.626, 0.951068401, "-0", - 0.308980465, 0, 1, "-0", 0.308980465, 0, 0.951068401);
            CFrameMon = CFrame.new(- 1980.43848, 36.6716766, - 12983.8418, - 0.254443765, 0, - 0.967087567, 0, 1, 0, 0.967087567, 0, - 0.254443765);
        elseif ((v197 == 2275) or (v197 <= 2299) or (SelectMonster == "Head Baker")) then
            Ms = "Head Baker";
            NameQuest = "CakeQuest2";
            QuestLv = 2;
            NameMon = "Head Baker";
            CFrameQ = CFrame.new(- 1928.31763, 37.7296638, - 12840.626, 0.951068401, "-0", - 0.308980465, 0, 1, "-0", 0.308980465, 0, 0.951068401);
            CFrameMon = CFrame.new(- 2251.5791, 52.2714615, - 13033.3965, - 0.991971016, 0, - 0.126466095, 0, 1, 0, 0.126466095, 0, - 0.991971016);
        elseif ((v197 == 2300) or (v197 <= 2324) or (SelectMonster == "Cocoa Warrior")) then
            Ms = "Cocoa Warrior";
            NameQuest = "ChocQuest1";
            QuestLv = 1;
            NameMon = "Cocoa Warrior";
            CFrameQ = CFrame.new(231.75, 23.9003029, - 12200.292, - 1, 0, 0, 0, 1, 0, 0, 0, - 1);
            CFrameMon = CFrame.new(167.978516, 26.2254658, - 12238.874, - 0.939700961, 0, 0.341998369, 0, 1, 0, - 0.341998369, 0, - 0.939700961);
        elseif ((v197 == 2325) or (v197 <= 2349) or (SelectMonster == "Chocolate Bar Battler")) then
            Ms = "Chocolate Bar Battler";
            NameQuest = "ChocQuest1";
            QuestLv = 2;
            NameMon = "Chocolate Bar Battler";
            CFrameQ = CFrame.new(231.75, 23.9003029, - 12200.292, - 1, 0, 0, 0, 1, 0, 0, 0, - 1);
            CFrameMon = CFrame.new(701.312073, 25.5824986, - 12708.2148, - 0.342042685, 0, - 0.939684391, 0, 1, 0, 0.939684391, 0, - 0.342042685);
        elseif ((v197 == 2350) or (v197 <= 2374) or (SelectMonster == "Sweet Thief")) then
            Ms = "Sweet Thief";
            NameQuest = "ChocQuest2";
            QuestLv = 1;
            NameMon = "Sweet Thief";
            CFrameQ = CFrame.new(151.198242, 23.8907146, - 12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, - 0.906319618, 0, 0.422592998);
            CFrameMon = CFrame.new(- 140.258301, 25.5824986, - 12652.3115, 0.173624337, "-0", - 0.984811902, 0, 1, "-0", 0.984811902, 0, 0.173624337);
        elseif ((v197 == 2375) or (v197 <= 2400) or (SelectMonster == "Candy Rebel")) then
            Ms = "Candy Rebel";
            NameQuest = "ChocQuest2";
            QuestLv = 2;
            NameMon = "Candy Rebel";
            CFrameQ = CFrame.new(151.198242, 23.8907146, - 12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, - 0.906319618, 0, 0.422592998);
            CFrameMon = CFrame.new(47.9231453, 25.5824986, - 13029.2402, - 0.819156051, 0, - 0.573571265, 0, 1, 0, 0.573571265, 0, - 0.819156051);
        elseif ((v197 == 2400) or (v197 <= 2424) or (SelectMonster == "Candy Pirate")) then
            Ms = "Candy Pirate";
            NameQuest = "CandyQuest1";
            QuestLv = 1;
            NameMon = "Candy Pirate";
            CFrameQ = CFrame.new(- 1149.328, 13.5759039, - 14445.6143, - 0.156446099, 0, - 0.987686574, 0, 1, 0, 0.987686574, 0, - 0.156446099);
            CFrameMon = CFrame.new(- 1437.56348, 17.1481285, - 14385.6934, 0.173624337, "-0", - 0.984811902, 0, 1, "-0", 0.984811902, 0, 0.173624337);
        elseif ((v197 == 2425) or (v197 <= 2449) or (SelectMonster == "Snow Demon")) then
            Ms = "Snow Demon";
            NameQuest = "CandyQuest1";
            QuestLv = 2;
            NameMon = "Snow Demon";
            CFrameQ = CFrame.new(- 1149.328, 13.5759039, - 14445.6143, - 0.156446099, 0, - 0.987686574, 0, 1, 0, 0.987686574, 0, - 0.156446099);
            CFrameMon = CFrame.new(- 916.222656, 17.1481285, - 14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, - 0.500031412, 0, 0.866007268);
        elseif ((v197 == 2450) or (v197 <= 2474) or (SelectMonster == "Isle Outlaw")) then
            Ms = "Isle Outlaw";
            NameQuest = "TikiQuest1";
            QuestLv = 1;
            NameMon = "Isle Outlaw";
            CFrameQ = CFrame.new(- 16549.890625, 55.68635559082031, - 179.91360473632812);
            CFrameMon = CFrame.new(- 16162.8193359375, 11.6863374710083, - 96.45481872558594);
        elseif ((v197 == 2475) or (v197 <= 2499) or (SelectMonster == "Island Boy")) then
            Ms = "Island Boy";
            NameQuest = "TikiQuest1";
            QuestLv = 2;
            NameMon = "Island Boy";
            CFrameQ = CFrame.new(- 16549.890625, 55.68635559082031, - 179.91360473632812);
            CFrameMon = CFrame.new(- 16357.3125, 20.632822036743164, 1005.64892578125);
        elseif ((v197 == 2500) or (v197 <= 2524) or (SelectMonster == "Sun-kissed Warrior")) then
            Ms = "Sun-kissed Warrior";
            NameQuest = "TikiQuest2";
            QuestLv = 1;
            NameMon = "Sun-kissed Warrior";
            CFrameQ = CFrame.new(- 16541.021484375, 54.77081298828125, 1051.461181640625);
            CFrameMon = CFrame.new(- 16357.3125, 20.632822036743164, 1005.64892578125);
        elseif ((v197 == 2525) or (v197 <= 2549) or (SelectMonster == "Isle Champion")) then
            Ms = "Isle Champion";
            NameQuest = "TikiQuest2";
            QuestLv = 2;
            NameMon = "Isle Champion";
            CFrameQ = CFrame.new(- 16541.021484375, 54.77081298828125, 1051.461181640625);
            CFrameMon = CFrame.new(- 16848.94140625, 21.68633460998535, 1041.4490966796875);
        elseif ((v197 == 2550) or (v197 <= 2574) or (SelectMonster == "Serpent Hunter")) then
            Ms = "Serpent Hunter";
            NameQuest = "TikiQuest3";
            QuestLv = 1;
            NameMon = "Serpent Hunter";
            CFrameQ = CFrame.new(- 16665.19140625, 104.59640502929688, 1579.6943359375);
            CFrameMon = CFrame.new(- 16621.4140625, 121.40631103515625, 1290.6881103515625);
        elseif ((v197 == 2575) or (v197 <= 2599) or (SelectMonster == "Skull Slayer") or (v197 >2600)) then
            Ms = "Skull Slayer";
            NameQuest = "TikiQuest3";
            QuestLv = 2;
            NameMon = "Skull Slayer";
            CFrameQ = CFrame.new(- 16665.19140625, 104.59640502929688, 1579.6943359375);
            CFrameMon = CFrame.new(- 16811.5703125, 84.625244140625, 1542.235107421875);
        end
    end
end
if Sea1 then
    tableMon = {
        "Bandit",
        "Monkey",
        "Gorilla",
        "Pirate",
        "Brute",
        "Desert Bandit",
        "Desert Officer",
        "Snow Bandit",
        "Snowman",
        "Chief Petty Officer",
        "Sky Bandit",
        "Dark Master",
        "Prisoner",
        "Dangerous Prisoner",
        "Toga Warrior",
        "Gladiator",
        "Military Soldier",
        "Military Spy",
        "Fishman Warrior",
        "Fishman Commando",
        "God's Guard",
        "Shanda",
        "Royal Squad",
        "Royal Soldier",
        "Galley Pirate",
        "Galley Captain"
    };
elseif Sea2 then
    tableMon = {
        "Raider",
        "Mercenary",
        "Swan Pirate",
        "Factory Staff",
        "Marine Lieutenant",
        "Marine Captain",
        "Zombie",
        "Vampire",
        "Snow Trooper",
        "Winter Warrior",
        "Lab Subordinate",
        "Horned Warrior",
        "Magma Ninja",
        "Lava Pirate",
        "Ship Deckhand",
        "Ship Engineer",
        "Ship Steward",
        "Ship Officer",
        "Arctic Warrior",
        "Snow Lurker",
        "Sea Soldier",
        "Water Fighter"
    };
elseif Sea3 then
    tableMon = {
        "Pirate Millionaire",
        "Dragon Crew Warrior",
        "Dragon Crew Archer",
        "Hydra Enforcer",
        "Venomous Assailant",
        "Marine Commodore",
        "Marine Rear Admiral",
        "Fishman Raider",
        "Fishman Captain",
        "Forest Pirate",
        "Mythological Pirate",
        "Jungle Pirate",
        "Musketeer Pirate",
        "Reborn Skeleton",
        "Living Zombie",
        "Demonic Soul",
        "Posessed Mummy",
        "Peanut Scout",
        "Peanut President",
        "Ice Cream Chef",
        "Ice Cream Commander",
        "Cookie Crafter",
        "Cake Guard",
        "Baking Staff",
        "Head Baker",
        "Cocoa Warrior",
        "Chocolate Bar Battler",
        "Sweet Thief",
        "Candy Rebel",
        "Candy Pirate",
        "Snow Demon",
        "Isle Outlaw",
        "Island Boy",
        "Sun-kissed Warrior",
        "Isle Champion",
        "Serpent Hunter",
        "Skull Slayer"
    };
end
if Sea1 then
    AreaList = {
        "Jungle",
        "Buggy",
        "Desert",
        "Snow",
        "Marine",
        "Sky",
        "Prison",
        "Colosseum",
        "Magma",
        "Fishman",
        "Sky Island",
        "Fountain"
    };
elseif Sea2 then
    AreaList = {
        "Area 1",
        "Area 2",
        "Zombie",
        "Marine",
        "Snow Mountain",
        "Ice fire",
        "Ship",
        "Frost",
        "Forgotten"
    };
elseif Sea3 then
    AreaList = {
        "Pirate Port",
        "Amazon",
        "Marine Tree",
        "Deep Forest",
        "Haunted Castle",
        "Nut Island",
        "Ice Cream Island",
        "Cake Island",
        "Choco Island",
        "Candy Island",
        "Tiki Outpost"
    };
end
function CheckBossQuest()
    if Sea1 then
        if (SelectBoss == "The Gorilla King") then
            BossMon = "The Gorilla King";
            NameBoss = "The Gorrila King";
            NameQuestBoss = "JungleQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$2,000\n7,000 Exp.";
            CFrameQBoss = CFrame.new(- 1601.6553955078, 36.85213470459, 153.38809204102);
            CFrameBoss = CFrame.new(- 1088.75977, 8.13463783, - 488.559906, - 0.707134247, 0, 0.707079291, 0, 1, 0, - 0.707079291, 0, - 0.707134247);
        elseif (SelectBoss == "Bobby") then
            BossMon = "Bobby";
            NameBoss = "Bobby";
            NameQuestBoss = "BuggyQuest1";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$8,000\n35,000 Exp.";
            CFrameQBoss = CFrame.new(- 1140.1761474609, 4.752049446106, 3827.4057617188);
            CFrameBoss = CFrame.new(- 1087.3760986328, 46.949409484863, 4040.1462402344);
        elseif (SelectBoss == "The Saw") then
            BossMon = "The Saw";
            NameBoss = "The Saw";
            CFrameBoss = CFrame.new(- 784.89715576172, 72.427383422852, 1603.5822753906);
        elseif (SelectBoss == "Yeti") then
            BossMon = "Yeti";
            NameBoss = "Yeti";
            NameQuestBoss = "SnowQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$10,000\n180,000 Exp.";
            CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, - 1298.3576660156);
            CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, - 1488.0262451172);
        elseif (SelectBoss == "Mob Leader") then
            BossMon = "Mob Leader";
            NameBoss = "Mob Leader";
            CFrameBoss = CFrame.new(- 2844.7307128906, 7.4180502891541, 5356.6723632813);
        elseif (SelectBoss == "Vice Admiral") then
            BossMon = "Vice Admiral";
            NameBoss = "Vice Admiral";
            NameQuestBoss = "MarineQuest2";
            QuestLvBoss = 2;
            RewardBoss = "Reward:\n$10,000\n180,000 Exp.";
            CFrameQBoss = CFrame.new(- 5036.2465820313, 28.677835464478, 4324.56640625);
            CFrameBoss = CFrame.new(- 5006.5454101563, 88.032081604004, 4353.162109375);
        elseif (SelectBoss == "Saber Expert") then
            NameBoss = "Saber Expert";
            BossMon = "Saber Expert";
            CFrameBoss = CFrame.new(- 1458.89502, 29.8870335, - 50.633564);
        elseif (SelectBoss == "Warden") then
            BossMon = "Warden";
            NameBoss = "Warden";
            NameQuestBoss = "ImpelQuest";
            QuestLvBoss = 1;
            RewardBoss = "Reward:\n$6,000\n850,000 Exp.";
            CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, - 0.000004499464, 0.975376427, - 0.000019541258, 1, 0.000009031621, - 0.975376427, - 0.000021051976, 0.220546961);
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, - 0.731384635, 0, 0.681965172, 0, 1, 0, - 0.681965172, 0, - 0.731384635);
        elseif (SelectBoss == "Chief Warden") then
            BossMon = "Chief Warden";
            NameBoss = "Chief Warden";
            NameQuestBoss = "ImpelQuest";
            QuestLvBoss = 2;
            RewardBoss = "Reward:\n$10,000\n1,000,000 Exp.";
            CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, - 0.00062915677, 0.939684749, 0.00191645394, 0.999998152, - 0.000028042234, - 0.939682961, 0.00181045406, 0.342041939);
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, - 0.731384635, 0, 0.681965172, 0, 1, 0, - 0.681965172, 0, - 0.731384635);
        elseif (SelectBoss == "Swan") then
            BossMon = "Swan";
            NameBoss = "Swan";
            NameQuestBoss = "ImpelQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$15,000\n1,600,000 Exp.";
            CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, - 0.309060812, 0, 0.951042235, 0, 1, 0, - 0.951042235, 0, - 0.309060812);
            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, - 0.731384635, 0, 0.681965172, 0, 1, 0, - 0.681965172, 0, - 0.731384635);
        elseif (SelectBoss == "Magma Admiral") then
            BossMon = "Magma Admiral";
            NameBoss = "Magma Admiral";
            NameQuestBoss = "MagmaQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$15,000\n2,800,000 Exp.";
            CFrameQBoss = CFrame.new(- 5314.6220703125, 12.262420654297, 8517.279296875);
            CFrameBoss = CFrame.new(- 5765.8969726563, 82.92064666748, 8718.3046875);
        elseif (SelectBoss == "Fishman Lord") then
            BossMon = "Fishman Lord";
            NameBoss = "Fishman Lord";
            NameQuestBoss = "FishmanQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$15,000\n4,000,000 Exp.";
            CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734);
            CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984);
        elseif (SelectBoss == "Wysper") then
            BossMon = "Wysper";
            NameBoss = "Wysper";
            NameQuestBoss = "SkyExp1Quest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$15,000\n4,800,000 Exp.";
            CFrameQBoss = CFrame.new(- 7861.947265625, 5545.517578125, - 379.85974121094);
            CFrameBoss = CFrame.new(- 7866.1333007813, 5576.4311523438, - 546.74816894531);
        elseif (SelectBoss == "Thunder God") then
            BossMon = "Thunder God";
            NameBoss = "Thunder God";
            NameQuestBoss = "SkyExp2Quest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$20,000\n5,800,000 Exp.";
            CFrameQBoss = CFrame.new(- 7903.3828125, 5635.9897460938, - 1410.923828125);
            CFrameBoss = CFrame.new(- 7994.984375, 5761.025390625, - 2088.6479492188);
        elseif (SelectBoss == "Cyborg") then
            BossMon = "Cyborg";
            NameBoss = "Cyborg";
            NameQuestBoss = "FountainQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$20,000\n7,500,000 Exp.";
            CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875);
            CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813);
        elseif (SelectBoss == "Ice Admiral") then
            BossMon = "Ice Admiral";
            NameBoss = "Ice Admiral";
            CFrameBoss = CFrame.new(1266.08948, 26.1757946, - 1399.57678, - 0.573599219, 0, - 0.81913656, 0, 1, 0, 0.81913656, 0, - 0.573599219);
        elseif (SelectBoss == "Greybeard") then
            BossMon = "Greybeard";
            NameBoss = "Greybeard";
            CFrameBoss = CFrame.new(- 5081.3452148438, 85.221641540527, 4257.3588867188);
        end
    end
    if Sea2 then
        if (SelectBoss == "Diamond") then
            BossMon = "Diamond";
            NameBoss = "Diamond";
            NameQuestBoss = "Area1Quest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$25,000\n9,000,000 Exp.";
            CFrameQBoss = CFrame.new(- 427.5666809082, 73.313781738281, 1835.4208984375);
            CFrameBoss = CFrame.new(- 1576.7166748047, 198.59265136719, 13.724286079407);
        elseif (SelectBoss == "Jeremy") then
            BossMon = "Jeremy";
            NameBoss = "Jeremy";
            NameQuestBoss = "Area2Quest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$25,000\n11,500,000 Exp.";
            CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063);
            CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109);
        elseif (SelectBoss == "Fajita") then
            BossMon = "Fajita";
            NameBoss = "Fajita";
            NameQuestBoss = "MarineQuest3";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$25,000\n15,000,000 Exp.";
            CFrameQBoss = CFrame.new(- 2441.986328125, 73.359344482422, - 3217.5324707031);
            CFrameBoss = CFrame.new(- 2172.7399902344, 103.32216644287, - 4015.025390625);
        elseif (SelectBoss == "Don Swan") then
            BossMon = "Don Swan";
            NameBoss = "Don Swan";
            CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875);
        elseif (SelectBoss == "Smoke Admiral") then
            BossMon = "Smoke Admiral";
            NameBoss = "Smoke Admiral";
            NameQuestBoss = "IceSideQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$20,000\n25,000,000 Exp.";
            CFrameQBoss = CFrame.new(- 5429.0473632813, 15.977565765381, - 5297.9614257813);
            CFrameBoss = CFrame.new(- 5275.1987304688, 20.757257461548, - 5260.6669921875);
        elseif (SelectBoss == "Awakened Ice Admiral") then
            BossMon = "Awakened Ice Admiral";
            NameBoss = "Awakened Ice Admiral";
            NameQuestBoss = "FrostQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$20,000\n36,000,000 Exp.";
            CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, - 6483.3520507813);
            CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, - 6894.5595703125);
        elseif (SelectBoss == "Tide Keeper") then
            BossMon = "Tide Keeper";
            NameBoss = "Tide Keeper";
            NameQuestBoss = "ForgottenQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$12,500\n38,000,000 Exp.";
            CFrameQBoss = CFrame.new(- 3053.9814453125, 237.18954467773, - 10145.0390625);
            CFrameBoss = CFrame.new(- 3795.6423339844, 105.88877105713, - 11421.307617188);
        elseif (SelectBoss == "Darkbeard") then
            BossMon = "Darkbeard";
            NameBoss = "Darkbeard";
            CFrameMon = CFrame.new(3677.08203125, 62.751937866211, - 3144.8332519531);
        elseif (SelectBoss == "Cursed Captain") then
            BossMon = "Cursed Captain";
            NameBoss = "Cursed Captain";
            CFrameBoss = CFrame.new(916.928589, 181.092773, 33422);
        elseif (SelectBoss == "Order") then
            BossMon = "Order";
            NameBoss = "Order";
            CFrameBoss = CFrame.new(- 6217.2021484375, 28.047645568848, - 5053.1357421875);
        end
    end
    if Sea3 then
        if (SelectBoss == "Stone") then
            BossMon = "Stone";
            NameBoss = "Stone";
            NameQuestBoss = "PiratePortQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$25,000\n40,000,000 Exp.";
            CFrameQBoss = CFrame.new(- 289.76705932617, 43.819011688232, 5579.9384765625);
            CFrameBoss = CFrame.new(- 1027.6512451172, 92.404174804688, 6578.8530273438);
        elseif (SelectBoss == "Hydra Leader") then
            BossMon = "Hydra Leader";
            NameBoss = "Hydra Leader";
            NameQuestBoss = "VenomCrewQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$30,000\n52,000,000 Exp.";
            CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609);
            CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875);
        elseif (SelectBoss == "Kilo Admiral") then
            BossMon = "Kilo Admiral";
            NameBoss = "Kilo Admiral";
            NameQuestBoss = "MarineTreeIsland";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$35,000\n56,000,000 Exp.";
            CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, - 6739.9741210938);
            CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, - 7144.4580078125);
        elseif (SelectBoss == "Captain Elephant") then
            BossMon = "Captain Elephant";
            NameBoss = "Captain Elephant";
            NameQuestBoss = "DeepForestIsland";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$40,000\n67,000,000 Exp.";
            CFrameQBoss = CFrame.new(- 13232.682617188, 332.40396118164, - 7626.01171875);
            CFrameBoss = CFrame.new(- 13376.7578125, 433.28689575195, - 8071.392578125);
        elseif (SelectBoss == "Beautiful Pirate") then
            BossMon = "Beautiful Pirate";
            NameBoss = "Beautiful Pirate";
            NameQuestBoss = "DeepForestIsland2";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$50,000\n70,000,000 Exp.";
            CFrameQBoss = CFrame.new(- 12682.096679688, 390.88653564453, - 9902.1240234375);
            CFrameBoss = CFrame.new(5283.609375, 22.56223487854, - 110.78285217285);
        elseif (SelectBoss == "Cake Queen") then
            BossMon = "Cake Queen";
            NameBoss = "Cake Queen";
            NameQuestBoss = "IceCreamIslandQuest";
            QuestLvBoss = 3;
            RewardBoss = "Reward:\n$30,000\n112,500,000 Exp.";
            CFrameQBoss = CFrame.new(- 819.376709, 64.9259796, - 10967.2832, - 0.766061664, 0, 0.642767608, 0, 1, 0, - 0.642767608, 0, - 0.766061664);
            CFrameBoss = CFrame.new(- 678.648804, 381.353943, - 11114.2012, - 0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, - 0.417492568, 0.0167988986, - 0.90852499);
        elseif (SelectBoss == "Longma") then
            BossMon = "Longma";
            NameBoss = "Longma";
            CFrameBoss = CFrame.new(- 10238.875976563, 389.7912902832, - 9549.7939453125);
        elseif (SelectBoss == "Soul Reaper") then
            BossMon = "Soul Reaper";
            NameBoss = "Soul Reaper";
            CFrameBoss = CFrame.new(- 9524.7890625, 315.80429077148, 6655.7192382813);
        elseif (SelectBoss == "rip_indra True Form") then
            BossMon = "rip_indra True Form";
            NameBoss = "rip_indra True Form";
            CFrameBoss = CFrame.new(- 5415.3920898438, 505.74133300781, - 2814.0166015625);
        end
    end
end
function MaterialMon()
    if (SelectMaterial == "Radioactive Material") then
        MMon = "Factory Staff";
        MPos = CFrame.new(295, 73, - 56);
        SP = "Default";
    elseif (SelectMaterial == "Mystic Droplet") then
        MMon = "Water Fighter";
        MPos = CFrame.new(- 3385, 239, - 10542);
        SP = "Default";
    elseif (SelectMaterial == "Magma Ore") then
        if Sea1 then
            MMon = "Military Spy";
            MPos = CFrame.new(- 5815, 84, 8820);
            SP = "Default";
        elseif Sea2 then
            MMon = "Magma Ninja";
            MPos = CFrame.new(- 5428, 78, - 5959);
            SP = "Default";
        end
    elseif (SelectMaterial == "Angel Wings") then
        MMon = "God's Guard";
        MPos = CFrame.new(- 4698, 845, - 1912);
        SP = "Default";
        if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 7859.09814, 5544.19043, - 381.476196)).Magnitude >= 5000) then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7859.09814, 5544.19043, - 381.476196));
        end
    elseif (SelectMaterial == "Leather") then
        if Sea1 then
            MMon = "Brute";
            MPos = CFrame.new(- 1145, 15, 4350);
            SP = "Default";
        elseif Sea2 then
            MMon = "Marine Captain";
            MPos = CFrame.new(- 2010.5059814453125, 73.00115966796875, - 3326.620849609375);
            SP = "Default";
        elseif Sea3 then
            MMon = "Jungle Pirate";
            MPos = CFrame.new(- 11975.78515625, 331.7734069824219, - 10620.0302734375);
            SP = "Default";
        end
    elseif (SelectMaterial == "Scrap Metal") then
        if Sea1 then
            MMon = "Brute";
            MPos = CFrame.new(- 1145, 15, 4350);
            SP = "Default";
        elseif Sea2 then
            MMon = "Swan Pirate";
            MPos = CFrame.new(878, 122, 1235);
            SP = "Default";
        elseif Sea3 then
            MMon = "Jungle Pirate";
            MPos = CFrame.new(- 12107, 332, - 10549);
            SP = "Default";
        end
    elseif (SelectMaterial == "Fish Tail") then
        if Sea3 then
            MMon = "Fishman Raider";
            MPos = CFrame.new(- 10993, 332, - 8940);
            SP = "Default";
        elseif Sea1 then
            MMon = "Fishman Warrior";
            MPos = CFrame.new(61123, 19, 1569);
            SP = "Default";
            if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875));
            end
        end
    elseif (SelectMaterial == "Demonic Wisp") then
        MMon = "Demonic Soul";
        MPos = CFrame.new(- 9507, 172, 6158);
        SP = "Default";
    elseif (SelectMaterial == "Vampire Fang") then
        MMon = "Vampire";
        MPos = CFrame.new(- 6033, 7, - 1317);
        SP = "Default";
    elseif (SelectMaterial == "Conjured Cocoa") then
        MMon = "Chocolate Bar Battler";
        MPos = CFrame.new(620.6344604492188, 78.93644714355469, - 12581.369140625);
        SP = "Default";
    elseif (SelectMaterial == "Dragon Scale") then
        MMon = "Dragon Crew Archer";
        MPos = CFrame.new(6827.91455078125, 609.4127197265625, 252.3538055419922);
        SP = "Default";
    elseif (SelectMaterial == "Gunpowder") then
        MMon = "Pistol Billionaire";
        MPos = CFrame.new(- 469, 74, 5904);
        SP = "Default";
    elseif (SelectMaterial == "Hydra Enforcer") then
        MMon = "Hydra Enforcer";
        MPos = CFrame.new(4581.517578125, 1001.55908203125, 704.9378662109375);
        SP = "Default";
    elseif (SelectMaterial == "Venomous Assailant") then
        MMon = "Venomous Assailant";
        MPos = CFrame.new(4879.92041015625, 1089.46142578125, 1104.00830078125);
        SP = "Default";
    elseif (SelectMaterial == "Mini Tusk") then
        MMon = "Mythological Pirate";
        MPos = CFrame.new();
        SP = "Default";
    end
end
function UpdateIslandESP()
    for v425, v426 in pairs(game:GetService("Workspace")['_WorldOrigin'].Locations:GetChildren()) do
        pcall(function()
            if _G.IslandESP then
                if (v426.Name ~= "Sea") then
                    if not v426:FindFirstChild("NameEsp") then
                        local v1130 = Instance.new("BillboardGui", v426);
                        v1130.Name = "NameEsp";
                        v1130.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1130.Size = UDim2.new(1, 200, 1, 30);
                        v1130.Adornee = v426;
                        v1130.AlwaysOnTop = true;
                        local v1136 = Instance.new("TextLabel", v1130);
                        v1136.Font = "GothamBold";
                        v1136.FontSize = "Size14";
                        v1136.TextWrapped = true;
                        v1136.Size = UDim2.new(1, 0, 1, 0);
                        v1136.TextYAlignment = "Top";
                        v1136.BackgroundTransparency = 1;
                        v1136.TextStrokeTransparency = 0.5;
                        v1136.TextColor3 = Color3.fromRGB(8, 0, 0);
                    else
                        v426['NameEsp'].TextLabel.Text = v426.Name .. "   \n" .. round((game:GetService("Players").LocalPlayer.Character.Head.Position - v426.Position).Magnitude / 3) .. " Distance" ;
                    end
                end
            elseif v426:FindFirstChild("NameEsp") then
                v426:FindFirstChild("NameEsp"):Destroy();
            end
        end);
    end
end
function isnil(v198)
    return v198 == nil ;
end
local function v20(v199)
    return math.floor(tonumber(v199) + 0.5);
end
Number = math.random(1, 1000000);
function UpdatePlayerChams()
    for v427, v428 in pairs(game:GetService("Players"):GetChildren()) do
        pcall(function()
            if not isnil(v428.Character) then
                if _G.ESPPlayer then
                    if (not isnil(v428.Character.Head) and not v428.Character.Head:FindFirstChild("NameEsp" .. Number)) then
                        local v1146 = Instance.new("BillboardGui", v428.Character.Head);
                        v1146.Name = "NameEsp" .. Number ;
                        v1146.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1146.Size = UDim2.new(1, 200, 1, 30);
                        v1146.Adornee = v428.Character.Head;
                        v1146.AlwaysOnTop = true;
                        local v1153 = Instance.new("TextLabel", v1146);
                        v1153.Font = Enum.Font.GothamSemibold;
                        v1153.FontSize = "Size10";
                        v1153.TextWrapped = true;
                        v1153.Text = v428.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v428.Character.Head.Position).Magnitude / 3) .. " Distance" ;
                        v1153.Size = UDim2.new(1, 0, 1, 0);
                        v1153.TextYAlignment = "Top";
                        v1153.BackgroundTransparency = 1;
                        v1153.TextStrokeTransparency = 0.5;
                        if (v428.Team == game.Players.LocalPlayer.Team) then
                            v1153.TextColor3 = Color3.new(0, 0, 254);
                        else
                            v1153.TextColor3 = Color3.new(255, 0, 0);
                        end
                    else
                        v428.Character.Head["NameEsp" .. Number ].TextLabel.Text = v428.Name .. " | " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v428.Character.Head.Position).Magnitude / 3) .. " Distance\nHealth : " .. v20((v428.Character.Humanoid.Health * 100) / v428.Character.Humanoid.MaxHealth) .. "%" ;
                    end
                elseif v428.Character.Head:FindFirstChild("NameEsp" .. Number) then
                    v428.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy();
                end
            end
        end);
    end
end
function UpdateChestChams()
    for v429, v430 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if string.find(v430.Name, "Chest") then
                if _G.ChestESP then
                    if string.find(v430.Name, "Chest") then
                        if not v430:FindFirstChild("NameEsp" .. Number) then
                            local v1475 = Instance.new("BillboardGui", v430);
                            v1475.Name = "NameEsp" .. Number ;
                            v1475.ExtentsOffset = Vector3.new(0, 1, 0);
                            v1475.Size = UDim2.new(1, 200, 1, 30);
                            v1475.Adornee = v430;
                            v1475.AlwaysOnTop = true;
                            local v1481 = Instance.new("TextLabel", v1475);
                            v1481.Font = Enum.Font.GothamSemibold;
                            v1481.FontSize = "Size14";
                            v1481.TextWrapped = true;
                            v1481.Size = UDim2.new(1, 0, 1, 0);
                            v1481.TextYAlignment = "Top";
                            v1481.BackgroundTransparency = 1;
                            v1481.TextStrokeTransparency = 0.5;
                            if (v430.Name == "Chest1") then
                                v1481.TextColor3 = Color3.fromRGB(109, 109, 109);
                                v1481.Text = "Chest 1" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v430.Position).Magnitude / 3) .. " Distance" ;
                            end
                            if (v430.Name == "Chest2") then
                                v1481.TextColor3 = Color3.fromRGB(173, 158, 21);
                                v1481.Text = "Chest 2" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v430.Position).Magnitude / 3) .. " Distance" ;
                            end
                            if (v430.Name == "Chest3") then
                                v1481.TextColor3 = Color3.fromRGB(85, 255, 255);
                                v1481.Text = "Chest 3" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v430.Position).Magnitude / 3) .. " Distance" ;
                            end
                        else
                            v430["NameEsp" .. Number ].TextLabel.Text = v430.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v430.Position).Magnitude / 3) .. " Distance" ;
                        end
                    end
                elseif v430:FindFirstChild("NameEsp" .. Number) then
                    v430:FindFirstChild("NameEsp" .. Number):Destroy();
                end
            end
        end);
    end
end
function UpdateDevilChams()
    for v431, v432 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if _G.DevilFruitESP then
                if string.find(v432.Name, "Fruit") then
                    if not v432.Handle:FindFirstChild("NameEsp" .. Number) then
                        local v1164 = Instance.new("BillboardGui", v432.Handle);
                        v1164.Name = "NameEsp" .. Number ;
                        v1164.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1164.Size = UDim2.new(1, 200, 1, 30);
                        v1164.Adornee = v432.Handle;
                        v1164.AlwaysOnTop = true;
                        local v1171 = Instance.new("TextLabel", v1164);
                        v1171.Font = Enum.Font.GothamSemibold;
                        v1171.FontSize = "Size14";
                        v1171.TextWrapped = true;
                        v1171.Size = UDim2.new(1, 0, 1, 0);
                        v1171.TextYAlignment = "Top";
                        v1171.BackgroundTransparency = 1;
                        v1171.TextStrokeTransparency = 0.5;
                        v1171.TextColor3 = Color3.fromRGB(255, 255, 255);
                        v1171.Text = v432.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v432.Handle.Position).Magnitude / 3) .. " Distance" ;
                    else
                        v432.Handle["NameEsp" .. Number ].TextLabel.Text = v432.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v432.Handle.Position).Magnitude / 3) .. " Distance" ;
                    end
                end
            elseif v432.Handle:FindFirstChild("NameEsp" .. Number) then
                v432.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end);
    end
end
function UpdateFlowerChams()
    for v433, v434 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if ((v434.Name == "Flower2") or (v434.Name == "Flower1")) then
                if _G.FlowerESP then
                    if not v434:FindFirstChild("NameEsp" .. Number) then
                        local v1183 = Instance.new("BillboardGui", v434);
                        v1183.Name = "NameEsp" .. Number ;
                        v1183.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1183.Size = UDim2.new(1, 200, 1, 30);
                        v1183.Adornee = v434;
                        v1183.AlwaysOnTop = true;
                        local v1189 = Instance.new("TextLabel", v1183);
                        v1189.Font = Enum.Font.GothamSemibold;
                        v1189.FontSize = "Size14";
                        v1189.TextWrapped = true;
                        v1189.Size = UDim2.new(1, 0, 1, 0);
                        v1189.TextYAlignment = "Top";
                        v1189.BackgroundTransparency = 1;
                        v1189.TextStrokeTransparency = 0.5;
                        v1189.TextColor3 = Color3.fromRGB(255, 0, 0);
                        if (v434.Name == "Flower1") then
                            v1189.Text = "Blue Flower" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v434.Position).Magnitude / 3) .. " Distance" ;
                            v1189.TextColor3 = Color3.fromRGB(0, 0, 255);
                        end
                        if (v434.Name == "Flower2") then
                            v1189.Text = "Red Flower" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v434.Position).Magnitude / 3) .. " Distance" ;
                            v1189.TextColor3 = Color3.fromRGB(255, 0, 0);
                        end
                    else
                        v434["NameEsp" .. Number ].TextLabel.Text = v434.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v434.Position).Magnitude / 3) .. " Distance" ;
                    end
                elseif v434:FindFirstChild("NameEsp" .. Number) then
                    v434:FindFirstChild("NameEsp" .. Number):Destroy();
                end
            end
        end);
    end
end
function UpdateRealFruitChams()
    for v435, v436 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
        if v436:IsA("Tool") then
            if _G.RealFruitESP then
                if not v436.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v907 = Instance.new("BillboardGui", v436.Handle);
                    v907.Name = "NameEsp" .. Number ;
                    v907.ExtentsOffset = Vector3.new(0, 1, 0);
                    v907.Size = UDim2.new(1, 200, 1, 30);
                    v907.Adornee = v436.Handle;
                    v907.AlwaysOnTop = true;
                    local v914 = Instance.new("TextLabel", v907);
                    v914.Font = Enum.Font.GothamSemibold;
                    v914.FontSize = "Size14";
                    v914.TextWrapped = true;
                    v914.Size = UDim2.new(1, 0, 1, 0);
                    v914.TextYAlignment = "Top";
                    v914.BackgroundTransparency = 1;
                    v914.TextStrokeTransparency = 0.5;
                    v914.TextColor3 = Color3.fromRGB(255, 0, 0);
                    v914.Text = v436.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v436.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v436.Handle["NameEsp" .. Number ].TextLabel.Text = v436.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v436.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v436.Handle:FindFirstChild("NameEsp" .. Number) then
                v436.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
    for v437, v438 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
        if v438:IsA("Tool") then
            if _G.RealFruitESP then
                if not v438.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v926 = Instance.new("BillboardGui", v438.Handle);
                    v926.Name = "NameEsp" .. Number ;
                    v926.ExtentsOffset = Vector3.new(0, 1, 0);
                    v926.Size = UDim2.new(1, 200, 1, 30);
                    v926.Adornee = v438.Handle;
                    v926.AlwaysOnTop = true;
                    local v933 = Instance.new("TextLabel", v926);
                    v933.Font = Enum.Font.GothamSemibold;
                    v933.FontSize = "Size14";
                    v933.TextWrapped = true;
                    v933.Size = UDim2.new(1, 0, 1, 0);
                    v933.TextYAlignment = "Top";
                    v933.BackgroundTransparency = 1;
                    v933.TextStrokeTransparency = 0.5;
                    v933.TextColor3 = Color3.fromRGB(255, 174, 0);
                    v933.Text = v438.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v438.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v438.Handle["NameEsp" .. Number ].TextLabel.Text = v438.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v438.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v438.Handle:FindFirstChild("NameEsp" .. Number) then
                v438.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
    for v439, v440 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
        if v440:IsA("Tool") then
            if _G.RealFruitESP then
                if not v440.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v945 = Instance.new("BillboardGui", v440.Handle);
                    v945.Name = "NameEsp" .. Number ;
                    v945.ExtentsOffset = Vector3.new(0, 1, 0);
                    v945.Size = UDim2.new(1, 200, 1, 30);
                    v945.Adornee = v440.Handle;
                    v945.AlwaysOnTop = true;
                    local v952 = Instance.new("TextLabel", v945);
                    v952.Font = Enum.Font.GothamSemibold;
                    v952.FontSize = "Size14";
                    v952.TextWrapped = true;
                    v952.Size = UDim2.new(1, 0, 1, 0);
                    v952.TextYAlignment = "Top";
                    v952.BackgroundTransparency = 1;
                    v952.TextStrokeTransparency = 0.5;
                    v952.TextColor3 = Color3.fromRGB(251, 255, 0);
                    v952.Text = v440.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v440.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v440.Handle["NameEsp" .. Number ].TextLabel.Text = v440.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v440.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v440.Handle:FindFirstChild("NameEsp" .. Number) then
                v440.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
end
function UpdateIslandESP()
    for v441, v442 in pairs(game:GetService("Workspace")['_WorldOrigin'].Locations:GetChildren()) do
        pcall(function()
            if _G.IslandESP then
                if (v442.Name ~= "Sea") then
                    if not v442:FindFirstChild("NameEsp") then
                        local v1200 = Instance.new("BillboardGui", v442);
                        v1200.Name = "NameEsp";
                        v1200.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1200.Size = UDim2.new(1, 200, 1, 30);
                        v1200.Adornee = v442;
                        v1200.AlwaysOnTop = true;
                        local v1206 = Instance.new("TextLabel", v1200);
                        v1206.Font = "GothamBold";
                        v1206.FontSize = "Size14";
                        v1206.TextWrapped = true;
                        v1206.Size = UDim2.new(1, 0, 1, 0);
                        v1206.TextYAlignment = "Top";
                        v1206.BackgroundTransparency = 1;
                        v1206.TextStrokeTransparency = 0.5;
                        v1206.TextColor3 = Color3.fromRGB(7, 236, 240);
                    else
                        v442['NameEsp'].TextLabel.Text = v442.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v442.Position).Magnitude / 3) .. " Distance" ;
                    end
                end
            elseif v442:FindFirstChild("NameEsp") then
                v442:FindFirstChild("NameEsp"):Destroy();
            end
        end);
    end
end
function isnil(v200)
    return v200 == nil ;
end
local function v20(v201)
    return math.floor(tonumber(v201) + 0.5);
end
Number = math.random(1, 1000000);
function UpdatePlayerChams()
    for v443, v444 in pairs(game:GetService("Players"):GetChildren()) do
        pcall(function()
            if not isnil(v444.Character) then
                if _G.ESPPlayer then
                    if (not isnil(v444.Character.Head) and not v444.Character.Head:FindFirstChild("NameEsp" .. Number)) then
                        local v1216 = Instance.new("BillboardGui", v444.Character.Head);
                        v1216.Name = "NameEsp" .. Number ;
                        v1216.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1216.Size = UDim2.new(1, 200, 1, 30);
                        v1216.Adornee = v444.Character.Head;
                        v1216.AlwaysOnTop = true;
                        local v1223 = Instance.new("TextLabel", v1216);
                        v1223.Font = Enum.Font.GothamSemibold;
                        v1223.FontSize = "Size14";
                        v1223.TextWrapped = true;
                        v1223.Text = v444.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v444.Character.Head.Position).Magnitude / 3) .. " Distance" ;
                        v1223.Size = UDim2.new(1, 0, 1, 0);
                        v1223.TextYAlignment = "Top";
                        v1223.BackgroundTransparency = 1;
                        v1223.TextStrokeTransparency = 0.5;
                        if (v444.Team == game.Players.LocalPlayer.Team) then
                            v1223.TextColor3 = Color3.new(0, 255, 0);
                        else
                            v1223.TextColor3 = Color3.new(255, 0, 0);
                        end
                    else
                        v444.Character.Head["NameEsp" .. Number ].TextLabel.Text = v444.Name .. " | " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v444.Character.Head.Position).Magnitude / 3) .. " Distance\nHealth : " .. v20((v444.Character.Humanoid.Health * 100) / v444.Character.Humanoid.MaxHealth) .. "%" ;
                    end
                elseif v444.Character.Head:FindFirstChild("NameEsp" .. Number) then
                    v444.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy();
                end
            end
        end);
    end
end
function UpdateChestChams()
    for v445, v446 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if string.find(v446.Name, "Chest") then
                if _G.ChestESP then
                    if string.find(v446.Name, "Chest") then
                        if not v446:FindFirstChild("NameEsp" .. Number) then
                            local v1497 = Instance.new("BillboardGui", v446);
                            v1497.Name = "NameEsp" .. Number ;
                            v1497.ExtentsOffset = Vector3.new(0, 1, 0);
                            v1497.Size = UDim2.new(1, 200, 1, 30);
                            v1497.Adornee = v446;
                            v1497.AlwaysOnTop = true;
                            local v1503 = Instance.new("TextLabel", v1497);
                            v1503.Font = Enum.Font.GothamSemibold;
                            v1503.FontSize = "Size14";
                            v1503.TextWrapped = true;
                            v1503.Size = UDim2.new(1, 0, 1, 0);
                            v1503.TextYAlignment = "Top";
                            v1503.BackgroundTransparency = 1;
                            v1503.TextStrokeTransparency = 0.5;
                            if (v446.Name == "Chest1") then
                                v1503.TextColor3 = Color3.fromRGB(109, 109, 109);
                                v1503.Text = "Chest 1" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v446.Position).Magnitude / 3) .. " Distance" ;
                            end
                            if (v446.Name == "Chest2") then
                                v1503.TextColor3 = Color3.fromRGB(173, 158, 21);
                                v1503.Text = "Chest 2" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v446.Position).Magnitude / 3) .. " Distance" ;
                            end
                            if (v446.Name == "Chest3") then
                                v1503.TextColor3 = Color3.fromRGB(85, 255, 255);
                                v1503.Text = "Chest 3" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v446.Position).Magnitude / 3) .. " Distance" ;
                            end
                        else
                            v446["NameEsp" .. Number ].TextLabel.Text = v446.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v446.Position).Magnitude / 3) .. " Distance" ;
                        end
                    end
                elseif v446:FindFirstChild("NameEsp" .. Number) then
                    v446:FindFirstChild("NameEsp" .. Number):Destroy();
                end
            end
        end);
    end
end
function UpdateDevilChams()
    for v447, v448 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if _G.DevilFruitESP then
                if string.find(v448.Name, "Fruit") then
                    if not v448.Handle:FindFirstChild("NameEsp" .. Number) then
                        local v1234 = Instance.new("BillboardGui", v448.Handle);
                        v1234.Name = "NameEsp" .. Number ;
                        v1234.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1234.Size = UDim2.new(1, 200, 1, 30);
                        v1234.Adornee = v448.Handle;
                        v1234.AlwaysOnTop = true;
                        local v1241 = Instance.new("TextLabel", v1234);
                        v1241.Font = Enum.Font.GothamSemibold;
                        v1241.FontSize = "Size14";
                        v1241.TextWrapped = true;
                        v1241.Size = UDim2.new(1, 0, 1, 0);
                        v1241.TextYAlignment = "Top";
                        v1241.BackgroundTransparency = 1;
                        v1241.TextStrokeTransparency = 0.5;
                        v1241.TextColor3 = Color3.fromRGB(255, 255, 255);
                        v1241.Text = v448.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v448.Handle.Position).Magnitude / 3) .. " Distance" ;
                    else
                        v448.Handle["NameEsp" .. Number ].TextLabel.Text = v448.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v448.Handle.Position).Magnitude / 3) .. " Distance" ;
                    end
                end
            elseif v448.Handle:FindFirstChild("NameEsp" .. Number) then
                v448.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end);
    end
end
function UpdateFlowerChams()
    for v449, v450 in pairs(game.Workspace:GetChildren()) do
        pcall(function()
            if ((v450.Name == "Flower2") or (v450.Name == "Flower1")) then
                if _G.FlowerESP then
                    if not v450:FindFirstChild("NameEsp" .. Number) then
                        local v1253 = Instance.new("BillboardGui", v450);
                        v1253.Name = "NameEsp" .. Number ;
                        v1253.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1253.Size = UDim2.new(1, 200, 1, 30);
                        v1253.Adornee = v450;
                        v1253.AlwaysOnTop = true;
                        local v1259 = Instance.new("TextLabel", v1253);
                        v1259.Font = Enum.Font.GothamSemibold;
                        v1259.FontSize = "Size14";
                        v1259.TextWrapped = true;
                        v1259.Size = UDim2.new(1, 0, 1, 0);
                        v1259.TextYAlignment = "Top";
                        v1259.BackgroundTransparency = 1;
                        v1259.TextStrokeTransparency = 0.5;
                        v1259.TextColor3 = Color3.fromRGB(255, 0, 0);
                        if (v450.Name == "Flower1") then
                            v1259.Text = "Blue Flower" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v450.Position).Magnitude / 3) .. " Distance" ;
                            v1259.TextColor3 = Color3.fromRGB(0, 0, 255);
                        end
                        if (v450.Name == "Flower2") then
                            v1259.Text = "Red Flower" .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v450.Position).Magnitude / 3) .. " Distance" ;
                            v1259.TextColor3 = Color3.fromRGB(255, 0, 0);
                        end
                    else
                        v450["NameEsp" .. Number ].TextLabel.Text = v450.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v450.Position).Magnitude / 3) .. " Distance" ;
                    end
                elseif v450:FindFirstChild("NameEsp" .. Number) then
                    v450:FindFirstChild("NameEsp" .. Number):Destroy();
                end
            end
        end);
    end
end
function UpdateRealFruitChams()
    for v451, v452 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
        if v452:IsA("Tool") then
            if _G.RealFruitESP then
                if not v452.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v964 = Instance.new("BillboardGui", v452.Handle);
                    v964.Name = "NameEsp" .. Number ;
                    v964.ExtentsOffset = Vector3.new(0, 1, 0);
                    v964.Size = UDim2.new(1, 200, 1, 30);
                    v964.Adornee = v452.Handle;
                    v964.AlwaysOnTop = true;
                    local v971 = Instance.new("TextLabel", v964);
                    v971.Font = Enum.Font.GothamSemibold;
                    v971.FontSize = "Size14";
                    v971.TextWrapped = true;
                    v971.Size = UDim2.new(1, 0, 1, 0);
                    v971.TextYAlignment = "Top";
                    v971.BackgroundTransparency = 1;
                    v971.TextStrokeTransparency = 0.5;
                    v971.TextColor3 = Color3.fromRGB(255, 0, 0);
                    v971.Text = v452.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v452.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v452.Handle["NameEsp" .. Number ].TextLabel.Text = v452.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v452.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v452.Handle:FindFirstChild("NameEsp" .. Number) then
                v452.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
    for v453, v454 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
        if v454:IsA("Tool") then
            if _G.RealFruitESP then
                if not v454.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v983 = Instance.new("BillboardGui", v454.Handle);
                    v983.Name = "NameEsp" .. Number ;
                    v983.ExtentsOffset = Vector3.new(0, 1, 0);
                    v983.Size = UDim2.new(1, 200, 1, 30);
                    v983.Adornee = v454.Handle;
                    v983.AlwaysOnTop = true;
                    local v990 = Instance.new("TextLabel", v983);
                    v990.Font = Enum.Font.GothamSemibold;
                    v990.FontSize = "Size14";
                    v990.TextWrapped = true;
                    v990.Size = UDim2.new(1, 0, 1, 0);
                    v990.TextYAlignment = "Top";
                    v990.BackgroundTransparency = 1;
                    v990.TextStrokeTransparency = 0.5;
                    v990.TextColor3 = Color3.fromRGB(255, 174, 0);
                    v990.Text = v454.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v454.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v454.Handle["NameEsp" .. Number ].TextLabel.Text = v454.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v454.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v454.Handle:FindFirstChild("NameEsp" .. Number) then
                v454.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
    for v455, v456 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
        if v456:IsA("Tool") then
            if _G.RealFruitESP then
                if not v456.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v1002 = Instance.new("BillboardGui", v456.Handle);
                    v1002.Name = "NameEsp" .. Number ;
                    v1002.ExtentsOffset = Vector3.new(0, 1, 0);
                    v1002.Size = UDim2.new(1, 200, 1, 30);
                    v1002.Adornee = v456.Handle;
                    v1002.AlwaysOnTop = true;
                    local v1009 = Instance.new("TextLabel", v1002);
                    v1009.Font = Enum.Font.GothamSemibold;
                    v1009.FontSize = "Size14";
                    v1009.TextWrapped = true;
                    v1009.Size = UDim2.new(1, 0, 1, 0);
                    v1009.TextYAlignment = "Top";
                    v1009.BackgroundTransparency = 1;
                    v1009.TextStrokeTransparency = 0.5;
                    v1009.TextColor3 = Color3.fromRGB(251, 255, 0);
                    v1009.Text = v456.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v456.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v456.Handle["NameEsp" .. Number ].TextLabel.Text = v456.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v456.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v456.Handle:FindFirstChild("NameEsp" .. Number) then
                v456.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
end
spawn(function()
    while wait(0.05) do
        pcall(function()
            if MobESP then
                for v822, v823 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v823:FindFirstChild("HumanoidRootPart") then
                        if not v823:FindFirstChild("MobEap") then
                            local v1372 = Instance.new("BillboardGui");
                            local v1373 = Instance.new("TextLabel");
                            v1372.Parent = v823;
                            v1372.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
                            v1372.Active = true;
                            v1372.Name = "MobEap";
                            v1372.AlwaysOnTop = true;
                            v1372.LightInfluence = 1;
                            v1372.Size = UDim2.new(0, 200, 0, 50);
                            v1372.StudsOffset = Vector3.new(0, 2.5, 0);
                            v1373.Parent = v1372;
                            v1373.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                            v1373.BackgroundTransparency = 1;
                            v1373.Size = UDim2.new(0, 200, 0, 50);
                            v1373.Font = Enum.Font.GothamBold;
                            v1373.TextColor3 = Color3.fromRGB(7, 236, 240);
                            v1373.Text.Size = 35;
                        end
                        local v1021 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v823.HumanoidRootPart.Position).Magnitude);
                        v823.MobEap.TextLabel.Text = v823.Name .. "-" .. v1021 .. " Distance" ;
                    end
                end
            else
                for v824, v825 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v825:FindFirstChild("MobEap") then
                        v825.MobEap:Destroy();
                    end
                end
            end
        end);
    end
end);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if SeaESP then
                for v826, v827 in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                    if v827:FindFirstChild("HumanoidRootPart") then
                        if not v827:FindFirstChild("Seaesps") then
                            local v1391 = Instance.new("BillboardGui");
                            local v1392 = Instance.new("TextLabel");
                            v1391.Parent = v827;
                            v1391.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
                            v1391.Active = true;
                            v1391.Name = "Seaesps";
                            v1391.AlwaysOnTop = true;
                            v1391.LightInfluence = 1;
                            v1391.Size = UDim2.new(0, 200, 0, 50);
                            v1391.StudsOffset = Vector3.new(0, 2.5, 0);
                            v1392.Parent = v1391;
                            v1392.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                            v1392.BackgroundTransparency = 1;
                            v1392.Size = UDim2.new(0, 200, 0, 50);
                            v1392.Font = Enum.Font.GothamBold;
                            v1392.TextColor3 = Color3.fromRGB(7, 236, 240);
                            v1392.Text.Size = 35;
                        end
                        local v1023 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v827.HumanoidRootPart.Position).Magnitude);
                        v827.Seaesps.TextLabel.Text = v827.Name .. "-" .. v1023 .. " Distance" ;
                    end
                end
            else
                for v828, v829 in pairs(game:GetService("Workspace").SeaBeasts:GetChildren()) do
                    if v829:FindFirstChild("Seaesps") then
                        v829.Seaesps:Destroy();
                    end
                end
            end
        end);
    end
end);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if NpcESP then
                for v830, v831 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                    if v831:FindFirstChild("HumanoidRootPart") then
                        if not v831:FindFirstChild("NpcEspes") then
                            local v1410 = Instance.new("BillboardGui");
                            local v1411 = Instance.new("TextLabel");
                            v1410.Parent = v831;
                            v1410.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
                            v1410.Active = true;
                            v1410.Name = "NpcEspes";
                            v1410.AlwaysOnTop = true;
                            v1410.LightInfluence = 1;
                            v1410.Size = UDim2.new(0, 200, 0, 50);
                            v1410.StudsOffset = Vector3.new(0, 2.5, 0);
                            v1411.Parent = v1410;
                            v1411.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                            v1411.BackgroundTransparency = 1;
                            v1411.Size = UDim2.new(0, 200, 0, 50);
                            v1411.Font = Enum.Font.GothamBold;
                            v1411.TextColor3 = Color3.fromRGB(7, 236, 240);
                            v1411.Text.Size = 35;
                        end
                        local v1025 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v831.HumanoidRootPart.Position).Magnitude);
                        v831.NpcEspes.TextLabel.Text = v831.Name .. "-" .. v1025 .. " Distance" ;
                    end
                end
            else
                for v832, v833 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
                    if v833:FindFirstChild("NpcEspes") then
                        v833.NpcEspes:Destroy();
                    end
                end
            end
        end);
    end
end);
function isnil(v202)
    return v202 == nil ;
end
local function v20(v203)
    return math.floor(tonumber(v203) + 0.5);
end
Number = math.random(1, 1000000);
function UpdateIslandMirageESP()
    for v457, v458 in pairs(game:GetService("Workspace")['_WorldOrigin'].Locations:GetChildren()) do
        pcall(function()
            if MirageIslandESP then
                if (v458.Name == "Mirage Island") then
                    if not v458:FindFirstChild("NameEsp") then
                        local v1270 = Instance.new("BillboardGui", v458);
                        v1270.Name = "NameEsp";
                        v1270.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1270.Size = UDim2.new(1, 200, 1, 30);
                        v1270.Adornee = v458;
                        v1270.AlwaysOnTop = true;
                        local v1276 = Instance.new("TextLabel", v1270);
                        v1276.Font = "Code";
                        v1276.FontSize = "Size14";
                        v1276.TextWrapped = true;
                        v1276.Size = UDim2.new(1, 0, 1, 0);
                        v1276.TextYAlignment = "Top";
                        v1276.BackgroundTransparency = 1;
                        v1276.TextStrokeTransparency = 0.5;
                        v1276.TextColor3 = Color3.fromRGB(80, 245, 245);
                    else
                        v458['NameEsp'].TextLabel.Text = v458.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v458.Position).Magnitude / 3) .. " M" ;
                    end
                end
            elseif v458:FindFirstChild("NameEsp") then
                v458:FindFirstChild("NameEsp"):Destroy();
            end
        end);
    end
end
function UpdateAuraESP()
    for v459, v460 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        pcall(function()
            if AuraESP then
                if (v460.Name == "Master of Enhancement") then
                    if not v460:FindFirstChild("NameEsp") then
                        local v1286 = Instance.new("BillboardGui", v460);
                        v1286.Name = "NameEsp";
                        v1286.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1286.Size = UDim2.new(1, 200, 1, 30);
                        v1286.Adornee = v460;
                        v1286.AlwaysOnTop = true;
                        local v1292 = Instance.new("TextLabel", v1286);
                        v1292.Font = "Code";
                        v1292.FontSize = "Size14";
                        v1292.TextWrapped = true;
                        v1292.Size = UDim2.new(1, 0, 1, 0);
                        v1292.TextYAlignment = "Top";
                        v1292.BackgroundTransparency = 1;
                        v1292.TextStrokeTransparency = 0.5;
                        v1292.TextColor3 = Color3.fromRGB(80, 245, 245);
                    else
                        v460['NameEsp'].TextLabel.Text = v460.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v460.Position).Magnitude / 3) .. " M" ;
                    end
                end
            elseif v460:FindFirstChild("NameEsp") then
                v460:FindFirstChild("NameEsp"):Destroy();
            end
        end);
    end
end
function UpdateLSDESP()
    for v461, v462 in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
        pcall(function()
            if LADESP then
                if (v462.Name == "Legendary Sword Dealer") then
                    if not v462:FindFirstChild("NameEsp") then
                        local v1302 = Instance.new("BillboardGui", v462);
                        v1302.Name = "NameEsp";
                        v1302.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1302.Size = UDim2.new(1, 200, 1, 30);
                        v1302.Adornee = v462;
                        v1302.AlwaysOnTop = true;
                        local v1308 = Instance.new("TextLabel", v1302);
                        v1308.Font = "Code";
                        v1308.FontSize = "Size14";
                        v1308.TextWrapped = true;
                        v1308.Size = UDim2.new(1, 0, 1, 0);
                        v1308.TextYAlignment = "Top";
                        v1308.BackgroundTransparency = 1;
                        v1308.TextStrokeTransparency = 0.5;
                        v1308.TextColor3 = Color3.fromRGB(80, 245, 245);
                    else
                        v462['NameEsp'].TextLabel.Text = v462.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v462.Position).Magnitude / 3) .. " M" ;
                    end
                end
            elseif v462:FindFirstChild("NameEsp") then
                v462:FindFirstChild("NameEsp"):Destroy();
            end
        end);
    end
end
function UpdateGeaESP()
    for v463, v464 in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
        pcall(function()
            if GearESP then
                if (v464.Name == "MeshPart") then
                    if not v464:FindFirstChild("NameEsp") then
                        local v1318 = Instance.new("BillboardGui", v464);
                        v1318.Name = "NameEsp";
                        v1318.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1318.Size = UDim2.new(1, 200, 1, 30);
                        v1318.Adornee = v464;
                        v1318.AlwaysOnTop = true;
                        local v1324 = Instance.new("TextLabel", v1318);
                        v1324.Font = "Code";
                        v1324.FontSize = "Size14";
                        v1324.TextWrapped = true;
                        v1324.Size = UDim2.new(1, 0, 1, 0);
                        v1324.TextYAlignment = "Top";
                        v1324.BackgroundTransparency = 1;
                        v1324.TextStrokeTransparency = 0.5;
                        v1324.TextColor3 = Color3.fromRGB(80, 245, 245);
                    else
                        v464['NameEsp'].TextLabel.Text = v464.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v464.Position).Magnitude / 3) .. " M" ;
                    end
                end
            elseif v464:FindFirstChild("NameEsp") then
                v464:FindFirstChild("NameEsp"):Destroy();
            end
        end);
    end
end
function Tween2(v204)
    local v205 = (v204.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
    local v206 = 350;
    if (v205 >= 350) then
        v206 = 350;
    end
    local v207 = TweenInfo.new(v205 / v206, Enum.EasingStyle.Linear);
    local v208 = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v207, {
        CFrame = v204
    });
    v208:Play();
    if _G.CancelTween2 then
        v208:Cancel();
    end
    _G.Clip2 = true;
    wait(v205 / v206);
    _G.Clip2 = false;
end
function BTPZ(v209)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v209;
    task.wait(0.05);
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v209;
end
TweenSpeed = 350;
local TweenService = game:GetService("TweenService")
local CurrentTween

function Tween(v211)
    local char = game.Players.LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local dist = (v211.Position - hrp.Position).Magnitude

    local baseSpeed = TweenSpeed or 350
    local speed = dist < 210 and 500 or baseSpeed

    local info = TweenInfo.new(dist / speed, Enum.EasingStyle.Linear)

    if CurrentTween then
        CurrentTween:Cancel()
        CurrentTween = nil
    end

    CurrentTween = TweenService:Create(hrp, info, {
        CFrame = v211
    })

    CurrentTween:Play()

    if _G.StopTween then    
        CurrentTween:Cancel()
        CurrentTween = nil
    end
end


function CancelTween(v216)
    if not v216 then
        _G.StopTween = true;
        wait(0.05);
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
        wait(0.05);
        _G.StopTween = false;
    end
end
function EquipTool(v217)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(v217) then
        local v570 = game.Players.LocalPlayer.Backpack:FindFirstChild(v217);
        wait(0.05);
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v570);
    end
end
task.spawn(function()
    local mt = getrawmetatable(game)
    local oldNamecall = mt.__namecall

    setreadonly(mt, false)

    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}

        if method == "FireServer" then
            if tostring(self) == "RemoteEvent" then
                if _G.UseSkill then
                    if typeof(args[1]) == "Vector3" then
                        args[1] = PositionSkillMasteryDevilFruit
                    elseif typeof(args[1]) == "CFrame" then
                        args[1] = CFrame.new(PositionSkillMasteryDevilFruit)
                    end
                    return oldNamecall(self, unpack(args))
                end
            end
        end

        return oldNamecall(self, ...)
    end)

    setreadonly(mt, true)
end)
spawn(function()
    while task.wait(0.05) do
        pcall(function()
            if (_G.AutoEvoRace or _G.CastleRaid or _G.CollectAzure or _G.TweenToKitsune or _G.GhostShip or _G.Ship or _G.Auto_Holy_Torch or _G.TeleportPly or _G.Auto_Sea3 or _G.Auto_Sea2 or _G.Tweenfruit or _G.AutoFishCrew or _G.Auto_Saber or _G.AutoShark or _G.Auto_Warden or _G.Auto_RainbowHaki or AutoFarmRace or _G.AutoQuestRace or _G.Auto_Law or _G.AutoTushita or _G.AutoHolyTorch or _G.AutoTerrorshark or _G.farmpiranya or _G.Auto_MusketeerHat or _G.Auto_ObservationV2 or _G.AutoNear or _G.Auto_PoleV1 or _G.Auto_Buddy or _G.Ectoplasm or AutoEvoRace or AutoBartilo or _G.Auto_Canvander or _G.AutoLevel or _G.Auto_DualKatana or Auto_Quest_Yama_3 or Auto_Quest_Yama_2 or Auto_Quest_Yama_1 or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or _G.Clip2 or _G.Auto_Regoku or _G.AutoBone or _G.AutoBoneNoQuest or _G.AutoBoss or _G.AutoFarmMasDevilFruit or _G.AutoHallowSycthe or _G.AutoTushita or _G.CakePrince or _G.Auto_SkullGuitar or _G.AutoFarmSwan or _G.DoughKing or _G.AutoElite or _G.AutoNextIsland or Musketeer or _G.AutoMaterial or AutoFarmRaceQuest or _G.Factory or _G.Auto_Saw or _G.AutoFrozenDimension or _G.AutoKillTrial or _G.AutoUpgrade or _G.TweenToFrozenDimension) then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local v887 = Instance.new("BodyVelocity");
                    v887.Name = "BodyClip";
                    v887.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;
                    v887.MaxForce = Vector3.new(100000, 100000, 100000);
                    v887.Velocity = Vector3.new(0, 0, 0);
                end
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy();
            end
        end);
    end
end);
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if (_G.AutoEvoRace or _G.Auto_RainbowHaki or _G.Auto_SkullGuitar or _G.CastleRaid or _G.CollectAzure or _G.TweenToKitsune or _G.Auto_Sea3 or _G.Auto_Sea2 or _G.GhostShip or _G.Ship or _G.Auto_Holy_Torch or _G.TeleportPly or _G.Tweenfruit or _G.Auto_Saber or _G.Auto_PoleV1 or _G.Auto_MusketeerHat or _G.AutoFishCrew or _G.AutoShark or AutoFarmRace or _G.AutoQuestRace or _G.Auto_Warden or _G.Auto_Law or _G.Auto_DualKatana or Auto_Quest_Tushita_1 or Auto_Quest_Tushita_2 or Auto_Quest_Tushita_3 or _G.AutoTushita or _G.AutoHolyTorch or _G.Auto_Buddy or _G.AutoTerrorshark or _G.farmpiranya or Auto_Quest_Yama_3 or _G.Auto_ObservationV2 or Auto_Quest_Yama_2 or Auto_Quest_Yama_1 or _G.AutoNear or _G.Ectoplasm or AutoEvoRace or _G.AutoKillTrial or AutoBartilo or _G.Auto_Regoku or _G.AutoLevel or _G.Clip2 or _G.AutoBone or _G.Auto_Canvander or _G.AutoBoneNoQuest or _G.AutoBoss or _G.Auto_Saw or _G.AutoFarmMasDevilFruit or _G.AutoHallowSycthe or _G.AutoTushita or _G.CakePrince or _G.DoughKing or _G.AutoFarmSwan or _G.AutoElite or _G.AutoNextIsland or Musketeer or _G.AutoMaterial or _G.Factory or _G.AutoFrozenDimension or AutoFarmRaceQuest or _G.AutoUpgrade or _G.TweenToFrozenDimension) then
                for v834, v835 in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v835:IsA("BasePart") then
                        v835.CanCollide = false;
                    end
                end
            end
        end);
    end);
end);
task.spawn(function()
    if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
        game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
            pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
                    game.Players.LocalPlayer.Character.Stun.Value = 0;
                end
            end);
        end);
    end
end);
function CheckMaterial(v221)
    for v467, v468 in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
        if (type(v468) == "table") then
            if (v468.Type == "Material") then
                if (v468.Name == v221) then
                    return v468.Count;
                end
            end
        end
    end
    return 0;
end
function GetWeaponInventory(v222)
    for v469, v470 in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
        if (type(v470) == "table") then
            if (v470.Type == "Sword") then
                if (v470.Name == v222) then
                    return true;
                end
            end
        end
    end
    return false;
end
local v21 = game.Players.LocalPlayer;
function FindEnemiesInRange(Hits, Enemies, AttackPlayers)
    local Character = v21.Character or v21.CharacterAdded:wait(0.05)
    local Pos = Character:GetPivot().Position
    local ClosestPart = nil
    local ClosestDist = math.huge
    for _, Mob in ipairs(Enemies) do
        local Humanoid = Mob:FindFirstChildOfClass("Humanoid")
        if Humanoid and Humanoid.Health > 0 and not Mob:GetAttribute("IsBoat") then
            local Root = Mob:FindFirstChild("HumanoidRootPart") or Mob.PrimaryPart or Mob:FindFirstChild("Head")
            if Root then
                local Dist = (Pos - Root.Position).Magnitude
                table.insert(Hits, { Mob, Root })
                if Dist < ClosestDist then
                    ClosestDist = Dist
                    ClosestPart = Root
                end
            end
        end
    end
    for _, Plr in ipairs(game.Players:GetPlayers()) do
        if Plr ~= v21 and Plr.Character then
            local Root = Plr.Character:FindFirstChild("HumanoidRootPart")
            if Root then
                local Dist = (Pos - Root.Position).Magnitude
                table.insert(Hits, { Plr.Character, Root })
                if Dist < ClosestDist then
                    ClosestDist = Dist
                    ClosestPart = Root
                end
            end
        end
    end

    return ClosestPart
end

function GetEquippedTool()
    local Char = v21.Character
    if not Char then return end
    return Char:FindFirstChildOfClass("Tool")
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
    while wait(0.05) do
        if (Type == 1) then
            Pos = CFrame.new(0, 40, 0);
        elseif (Type == 2) then
            Pos = CFrame.new(- 40, 40, 0);
        elseif (Type == 3) then
            Pos = CFrame.new(40, 40, 0);
        elseif (Type == 4) then
            Pos = CFrame.new(0, 40, 40);
        elseif (Type == 5) then
            Pos = CFrame.new(0, 40, - 40);
        end
    end
end);
spawn(function()
    while wait(0.05) do
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
function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso");
    end
end
function to(v232)
    repeat
        wait(_G.Fast_Delay);
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15);
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v232;
        task.wait(0.05);
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v232;
    until (v232.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
end
function to(v233)
    pcall(function()
        if (((v233.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000) and not Auto_Raid and (game.Players.LocalPlayer.Character.Humanoid.Health > 0)) then
            if (NameMon == "FishmanQuest") then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame);
                wait(0.05);
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
            elseif (Mon == "God's Guard") then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame);
                wait(0.05);
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.82275, 872.54248, - 1667.55688));
            elseif (NameMon == "SkyExp1Quest") then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame);
                wait(0.05);
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047));
            elseif (NameMon == "ShipQuest1") then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame);
                wait(0.05);
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
            elseif (NameMon == "ShipQuest2") then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame);
                wait(0.05);
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
            elseif (NameMon == "FrostQuest") then
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame);
                wait(0.05);
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422));
            else
                repeat
                    wait(_G.Fast_Delay);
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v233;
                    wait(0.05);
                    game.Players.LocalPlayer.Character.Head:Destroy();
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v233;
                until ((v233.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2500) and (game.Players.LocalPlayer.Character.Humanoid.Health > 0)
                wait(0.05);
            end
        end
    end);
end
local v22 = Instance.new("ScreenGui");
local v23 = Instance.new("ImageButton");
local v24 = Instance.new("UICorner");
local v25 = Instance.new("ParticleEmitter");
local v26 = game:GetService("TweenService");
v22.Parent = game.CoreGui;
v22.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
v23.Parent = v22;
v23.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
v23.BorderSizePixel = 0;
v23.Position = UDim2.new(0.120833337 - 0.1, 0, 0.0952890813 + 0.01, 0);
v23.Size = UDim2.new(0, 50, 0, 50);
v23.Draggable = true;
v23.Image = "http://www.roblox.com/asset/?id=106092527796600";
v24.Parent = v23;
v24.CornerRadius = UDim.new(0, 12);
v25.Parent = v23;
v25.LightEmission = 1;
v25.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.1),
    NumberSequenceKeypoint.new(1, 0)
});
v25.Lifetime = NumberRange.new(0.5, 1);
v25.Rate = 0;
v25.Speed = NumberRange.new(5, 10);
v25.Color = ColorSequence.new(Color3.fromRGB(255, 85, 255), Color3.fromRGB(85, 255, 255));
local v47 = v26:Create(v23, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Rotation = 360
});
v23.MouseButton1Down:Connect(function()
    v25.Rate = 100;
    task.delay(1, function()
        v25.Rate = 0;
    end);
    v47:Play();
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game);
    v47.Completed:Connect(function()
        v23.Rotation = 0;
    end);
    local v235 = v26:Create(v23, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 60, 0, 60)
    });
    v235:Play();
    v235.Completed:Connect(function()
        local v483 = v26:Create(v23, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 50, 0, 50)
        });
        v483:Play();
    end);
end);
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
    game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy();
end
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
    game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy();
end
v16.Home:AddButton({
    Title = "Creator",
    Description = "lumakd",
    Callback = function()
        setclipboard("https://zyo.lol/lumakd");
    end
});
_G.FastAttackStrix_Mode = "Super Fast Attack";
spawn(function()
    while wait(0.05) do
        if _G.FastAttackStrix_Mode then
            pcall(function()
                if (_G.FastAttackStrix_Mode == "Super Fast Attack") then
                    _G.Fast_Delay = 1e-9;
                end
            end);
        end
    end
end);
local v48 = v16.Main:AddDropdown("DropdownWeapon", {
    Title = "Vũ Khí",
    Description = "",
    Values = {
        "Melee",
        "Sword",
        "Blox Fruit"
    },
    Multi = false,
    Default = 1
});
v48:SetValue("Melee");
v48:OnChanged(function(v236)
    SaveConfig(Config)
    ChooseWeapon = v236;
end);
task.spawn(function()
    while wait(0.05) do
        pcall(function()
            if (ChooseWeapon == "Melee") then
                for v836, v837 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if (v837.ToolTip == "Melee") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v837.Name)) then
                            _G.SelectWeapon = v837.Name;
                        end
                    end
                end
            elseif (ChooseWeapon == "Sword") then
                for v1028, v1029 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if (v1029.ToolTip == "Sword") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v1029.Name)) then
                            _G.SelectWeapon = v1029.Name;
                        end
                    end
                end
            elseif (ChooseWeapon == "Blox Fruit") then
                for v1430, v1431 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if (v1431.ToolTip == "Blox Fruit") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v1431.Name)) then
                            _G.SelectWeapon = v1431.Name;
                        end
                    end
                end
            end
        end);
    end
end);

local v49 = v16.Main:AddToggle("ToggleLevel", {
    Title = "Cày Cấp",
    Description = "",
    Default = Config.AutoLevel
});
local AutoLevelThread = nil
_G.AutoLevel = Config.AutoLevel
v49:OnChanged(function(v)
    _G.AutoLevel = v
    Config.AutoLevel = v
    SaveConfig(Config)
    if not v then
        wait(0.05);
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
        wait(0.05);
    end
end)

local v50 = v16.Main:AddToggle("ToggleMobAura", {
    Title = "Đấm Quái Gần",
    Description = "",
    Default = Config.AutoNear
});
v50:OnChanged(function(v238)
    _G.AutoNear = v238;
    Config.AutoNear = v238;
    SaveConfig(Config)
    if not v238 then
        wait(0.05);
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
        wait(0.05);
    end
end);
local PirateModels = {
    ["Bandit"] = true,
    ["Monkey"] = true,
    ["Gorilla"] = true,
    ["Pirate"] = true,
    ["Brute"] = true,
    ["Desert Bandit"] = true,
    ["Desert Officer"] = true,
    ["Snow Bandit"] = true,
    ["Snowman"] = true,
    ["Chief Petty Officer"] = true,
    ["Sky Bandit"] = true,
    ["Dark Master"] = true,
    ["Prisoner"] = true,
    ["Dangerous Prisoner"] = true,
    ["Toga Warrior"] = true,
    ["Gladiator"] = true,
    ["Military Soldier"] = true,
    ["Military Spy"] = true,
    ["Fishman Warrior"] = true,
    ["Fishman Commando"] = true,
    ["God's Guard"] = true,
    ["Shanda"] = true,
    ["Royal Squad"] = true,
    ["Royal Soldier"] = true,
    ["Galley Pirate"] = true,
    ["Galley Captain"] = true,
    ["Raider"] = true,
    ["Mercenary"] = true,
    ["Swan Pirate"] = true,
    ["Factory Staff"] = true,
    ["Marine Lieutenant"] = true,
    ["Marine Captain"] = true,
    ["Zombie"] = true,
    ["Vampire"] = true,
    ["Snow Trooper"] = true,
    ["Winter Warrior"] = true,
    ["Lab Subordinate"] = true,
    ["Horned Warrior"] = true,
    ["Magma Ninja"] = true,
    ["Lava Pirate"] = true,
    ["Ship Deckhand"] = true,
    ["Ship Engineer"] = true,
    ["Ship Steward"] = true,
    ["Ship Officer"] = true,
    ["Arctic Warrior"] = true,
    ["Snow Lurker"] = true,
    ["Sea Soldier"] = true,
    ["Water Fighter"] = true,
}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer

local function GetNotification()
    return lp:WaitForChild("PlayerGui"):WaitForChild("Notification")
end

local function StripRichText(text)
    return text:gsub("<.->", "")
end

local function HasNotifyText(findText)
    local Notification = GetNotification()
    for _, v in ipairs(Notification:GetChildren()) do
        if v:IsA("TextLabel") then
            local clean = StripRichText(v.Text)
            if clean:find(findText, 1, true) then
                return true
            end
        end
    end
    return false
end

local function CheckPirateRaid()
    if not _G.CastleRaid then
        return false
    end

    for _, v in ipairs(ReplicatedStorage:GetChildren()) do
        if v:IsA("Model") and PirateModels[v.Name] then
            return true
        end
    end

    for _, v in ipairs(workspace.Enemies:GetChildren()) do
        if v:IsA("Model") and PirateModels[v.Name] then
            return true
        end
    end
    return false
end

task.spawn(function()
    if Sea3 then
        _G.PirateRaiding = false
        while task.wait(0.5) do
            _G.PirateRaiding = CheckPirateRaid()
        end
    end
end)
local v51 = v16.Main:AddToggle("ToggleCastleRaid", {
    Title = "Đấm Hải Tặc",
    Description = "",
    Default = Config.CastleRaid
});
v51:OnChanged(function(v239)
    _G.CastleRaid = v239;
    Config.CastleRaid = v239;
    SaveConfig(Config)
end);
v17.ToggleCastleRaid:SetValue(Config.CastleRaid);
spawn(function()
    while wait(0.05) do
        if _G.CastleRaid and _G.PirateRaiding then
            pcall(function()
                local v764 = CFrame.new(- 5496.17432, 313.768921, - 2841.53027, 0.924894512, 7.37058e-9, 0.380223751, 3.588102e-8, 1, - 1.06665446e-7, - 0.380223751, 1.1229711e-7, 0.924894512);
                if ((CFrame.new(- 5539.3115234375, 313.800537109375, - 2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500) then
                    for v1030, v1031 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (_G.CastleRaid and _G.PirateRaiding and v1031:FindFirstChild("HumanoidRootPart") and v1031:FindFirstChild("Humanoid") and (v1031.Humanoid.Health > 0)) then
                            if ((v1031.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000) then
                                repeat
                                    wait(_G.Fast_Delay);
                                    AttackNoCoolDown();
                                    AutoHaki();
                                    EquipTool(_G.SelectWeapon);
                                    v1031.HumanoidRootPart.CanCollide = false;
                                    v1031.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    Tween(v1031.HumanoidRootPart.CFrame * Pos);
                                until (v1031.Humanoid.Health <= 0) or not v1031.Parent or not _G.CastleRaid or not _G.PirateRaiding 
                            end
                        end
                    end
                else
                    if ((CFrame.new(- 5539.3115234375, 313.800537109375, - 2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1000) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375))
                    end
                    Tween(v764);
                end
            end);
        end
    end
end);
local v52 = v16.Main:AddToggle("ToggleHakiFortress", {
    Title = "Bật Haki Màu Pháo Đài",
    Description = "",
    Default = Config.EnableHakiFortress
});
v52:OnChanged(function(v240)
    _G.EnableHakiFortress = v240;
    Config.EnableHakiFortress = v240;
    SaveConfig(Config)
end);
v17.ToggleHakiFortress:SetValue(Config.EnableHakiFortress);
local function v53(v241, v242)
    local v243 = {
        [1] = {
            StorageName = v241,
            Type = "AuraSkin",
            Context = "Equip"
        }
    };
    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/FruitCustomizerRF"):InvokeServer(unpack(v243));
    Tween2(v242);
end
local function v54(v244, v245)
    local v246 = game.Players.LocalPlayer.Character;
    if (not v246 or not v246:FindFirstChild("HumanoidRootPart")) then
        return false;
    end
    local v247 = v246.HumanoidRootPart.Position;
    return (v247 - v244).Magnitude < v245 ;
end
spawn(function()
    while true do
        if _G.EnableHakiFortress then
            v53("Snow White", Vector3.new(- 4971.71826171875, 335.9582214355469, - 3720.0595703125));
            while not v54(Vector3.new(- 4971.71826171875, 335.9582214355469, - 3720.0595703125), 1) do
                wait(0.1);
            end
            wait(0.5);
            v53("Pure Red", Vector3.new(- 5414.92041015625, 314.2582092285156, - 2212.20166015625));
            while not v54(Vector3.new(- 5414.92041015625, 314.2582092285156, - 2212.20166015625), 1) do
                wait(0.1);
            end
            wait(0.5);
            v53("Winter Sky", Vector3.new(- 5420.26318359375, 1089.3582763671875, - 2666.8193359375));
            while not v54(Vector3.new(- 5420.26318359375, 1089.3582763671875, - 2666.8193359375), 1) do
                wait(0.1);
            end
            wait(0.5);
            _G.EnableHakiFortress = false;
        end
        wait(0.5);
    end
end);
local v55 = v16.Main:AddToggle("ToggleCollectChest", {
    Title = "Lụm Rương",
    Description = "",
    Default = Config.AutoCollectChest
});
v55:OnChanged(function(v248)
    _G.AutoCollectChest = v248;
    Config.AutoCollectChest = v248;
    SaveConfig(Config)
end);
spawn(function()
    while wait(0.05) do
        if _G.AutoCollectChest and not _G.PirateRaiding and not _G.Elite then
            local v673 = game:GetService("Players");
            local v674 = v673.LocalPlayer;
            local v675 = v674.Character or v674.CharacterAdded:wait(0.05) ;
            local v676 = v675:GetPivot().Position;
            local v677 = game:GetService("CollectionService");
            local v678 = v677:GetTagged("_ChestTagged");
            local v679, v680 = math.huge;
            for v765 = 1, # v678 do
                local v766 = v678[v765];
                local v767 = (v766:GetPivot().Position - v676).Magnitude;
                if (not v766:GetAttribute("IsDisabled") and (v767 < v679)) then
                    v679, v680 = v767, v766;
                end
            end
            if v680 then
                local v840 = v680:GetPivot().Position;
                local v841 = CFrame.new(v840);
                Tween2(v841);
            end
        end
    end
end);
local v56 = v16.Main:AddSection("Thông Thạo");
local v57 = v16.Main:AddDropdown("DropdownMastery", {
    Title = "Cày Thông Thạo",
    Description = "",
    Values = {
        "Near Mobs"
    },
    Multi = false,
    Default = 1
});
v57:SetValue(TypeMastery);
v57:OnChanged(function(v249)
    TypeMastery = v249;
    SaveConfig(Config)
end);
local v58 = v16.Main:AddToggle("ToggleMasteryFruit", {
    Title = "Cày Trái",
    Description = "",
    Default = Config.AutoFarmMasDevilFruit
});
v58:OnChanged(function(v250)
    _G.AutoFarmMasDevilFruit = v250;
    Config.AutoFarmMasDevilFruit = v250;
    SaveConfig(Config)
end);
v17.ToggleMasteryFruit:SetValue(Config.AutoFarmMasDevilFruit);
local v59 = v16.Main:AddSlider("SliderHealt", {
    Title = "Máu Quái",
    Description = "",
    Default = 20,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Callback = function(v251)
        KillPercent = v251;
    end
});
v59:OnChanged(function(v252)
    KillPercent = v252;
    SaveConfig(Config)
end);
v59:SetValue(20);
spawn(function()
    while task.wait(0.05) do
        if _G.UseSkill and not _G.PirateRaiding and not _G.Elite then
            pcall(function()
                if _G.UseSkill then
                    for v1032, v1033 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if ((v1033.Name == MonFarm) and v1033:FindFirstChild("Humanoid") and v1033:FindFirstChild("HumanoidRootPart") and (v1033.Humanoid.Health <= ((v1033.Humanoid.MaxHealth * KillPercent) / 100))) then
                            repeat
                                game:GetService("RunService").Heartbeat:wait(0.05);
                                EquipTool(game.Players.LocalPlayer.Data.DevilFruit.Value);
                                Tween(v1033.HumanoidRootPart.CFrame * Pos);
                                PositionSkillMasteryDevilFruit = v1033.HumanoidRootPart.Position;
                                if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = PositionSkillMasteryDevilFruit;
                                    local v1606 = game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value;
                                    if (_G.SkillZ and (v1606 >= 1)) then
                                        game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game);
                                        wait(0.05);
                                        game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game);
                                    end
                                    if (_G.SkillX and (v1606 >= 2)) then
                                        game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game);
                                        wait(0.05);
                                        game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game);
                                    end
                                    if (_G.SkillC and (v1606 >= 3)) then
                                        game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game);
                                        wait(0.05);
                                        game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game);
                                    end
                                    if (_G.SkillV and (v1606 >= 4)) then
                                        game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game);
                                        wait(0.05);
                                        game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game);
                                    end
                                    if (_G.SkillF and (v1606 >= 5)) then
                                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game);
                                        wait(0.05);
                                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game);
                                    end
                                end
                            until not _G.AutoFarmMasDevilFruit or not _G.UseSkill or (v1033.Humanoid.Health == 0)
                        end
                    end
                end
            end);
        end
    end
end);
spawn(function()
    while task.wait(0.1) do
        if (_G.AutoFarmMasDevilFruit and (TypeMastery == "Near Mobs")) and not _G.PirateRaiding and not _G.Elite then
            pcall(function()
                for v842, v843 in pairs(game.Workspace.Enemies:GetChildren()) do
                    if (v843.Name and v843:FindFirstChild("Humanoid") and v843:FindFirstChild("HumanoidRootPart")) then
                        if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v843:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000) then
                            repeat
                                wait(_G.Fast_Delay);
                                if (v843.Humanoid.Health <= ((v843.Humanoid.MaxHealth * KillPercent) / 100)) then
                                    _G.UseSkill = true;
                                else
                                    _G.UseSkill = false;
                                    AutoHaki();
                                    bringmob = true;
                                    EquipTool(_G.SelectWeapon);
                                    Tween(v843.HumanoidRootPart.CFrame * Pos);
                                    v843.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    v843.HumanoidRootPart.Transparency = 1;
                                    v843.Humanoid.JumpPower = 0;
                                    v843.Humanoid.WalkSpeed = 0;
                                    v843.HumanoidRootPart.CanCollide = false;
                                    FarmPos = v843.HumanoidRootPart.CFrame;
                                    MonFarm = v843.Name;
                                    AttackNoCoolDown();
                                end
                            until not _G.AutoFarmMasDevilFruit or (not MasteryType == "Near Mobs") or not v843.Parent or (v843.Humanoid.Health == 0) or _G.PirateRaiding or _G.Elite
                            bringmob = false;
                            _G.UseSkill = false;
                        end
                    end
                end
            end);
        end
    end
end);
if Sea3 then
    local v484 = v16.Main:AddSection("Xương");
    local v485 = v16.Main:AddParagraph({
        Title = "Xương Trạng Thái",
        Content = ""
    });
    spawn(function()
        pcall(function()
            while wait(0.05) do
                local v768 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check");
                v485:SetDesc("Mày Có: " .. tostring(v768) .. " Xương");
            end
        end);
    end);
    local v486 = v16.Main:AddToggle("ToggleBone", {
        Title = "Cày Xương",
        Description = "",
        Default = Config.AutoBone
    });
    v486:OnChanged(function(v571)
        _G.AutoBone = v571;
        Config.AutoBone = v571;
        SaveConfig(Config)
        if (v571 == false) then
            wait(0.05);
            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
            wait(0.05);
        end
    end);
    v17.ToggleBone:SetValue(Config.AutoBone);
    local v487 = CFrame.new(- 9515.75, 174.8521728515625, 6079.40625);
    spawn(function()
        while wait(0.05) do
            if _G.AutoBone and not _G.PirateRaiding and not _G.Elite then
                pcall(function()
                    local v894 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text;
                    if not string.find(v894, "Demonic Soul") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
                    end
                    if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false) then
                        Tween(v487);
                        if ((v487.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1);
                        end
                    elseif (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
                        if (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy")) then
                            for v1661, v1662 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v1662:FindFirstChild("HumanoidRootPart") and v1662:FindFirstChild("Humanoid") and (v1662.Humanoid.Health > 0)) then
                                    if ((v1662.Name == "Reborn Skeleton") or (v1662.Name == "Living Zombie") or (v1662.Name == "Demonic Soul") or (v1662.Name == "Posessed Mummy")) then
                                        if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                                            repeat
                                                wait(_G.Fast_Delay);
                                                AttackNoCoolDown();
                                                AutoHaki();
                                                bringmob = true;
                                                EquipTool(_G.SelectWeapon);
                                                Tween(v1662.HumanoidRootPart.CFrame * Pos);
                                                v1662.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                                v1662.HumanoidRootPart.Transparency = 1;
                                                v1662.Humanoid.JumpPower = 0;
                                                v1662.Humanoid.WalkSpeed = 0;
                                                v1662.HumanoidRootPart.CanCollide = false;
                                                FarmPos = v1662.HumanoidRootPart.CFrame;
                                                MonFarm = v1662.Name;
                                            until not _G.AutoBone or (v1662.Humanoid.Health <= 0) or not v1662.Parent or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
                                        else
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest");
                                            bringmob = false;
                                        end
                                    end
                                end
                            end
                        else
                        end
                    end
                end);
            end
        end
    end);
    local v488 = CFrame.new(- 9515.75, 174.8521728515625, 6079.40625);
    spawn(function()
        while wait(0.05) do
            if _G.AutoBoneNoQuest and not _G.PirateRaiding and not _G.Elite then
                pcall(function()
                    Tween(v488);
                    if ((v488.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) then
                    end
                    if (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy")) then
                        for v1436, v1437 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1437:FindFirstChild("HumanoidRootPart") and v1437:FindFirstChild("Humanoid") and (v1437.Humanoid.Health > 0)) then
                                if ((v1437.Name == "Reborn Skeleton") or (v1437.Name == "Living Zombie") or (v1437.Name == "Demonic Soul") or (v1437.Name == "Posessed Mummy")) then
                                    repeat
                                        wait(_G.Fast_Delay);
                                        AttackNoCoolDown();
                                        AutoHaki();
                                        bringmob = true;
                                        EquipTool(_G.SelectWeapon);
                                        Tween(v1437.HumanoidRootPart.CFrame * Pos);
                                        v1437.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        v1437.HumanoidRootPart.Transparency = 1;
                                        v1437.Humanoid.JumpPower = 0;
                                        v1437.Humanoid.WalkSpeed = 0;
                                        v1437.HumanoidRootPart.CanCollide = false;
                                        FarmPos = v1437.HumanoidRootPart.CFrame;
                                        MonFarm = v1437.Name;
                                    until not _G.AutoBoneNoQuest or (v1437.Humanoid.Health <= 0) or not v1437.Parent
                                end
                            end
                        end
                    end
                end);
            end
        end
    end);
    v16.Main:AddButton({
        Title = "Cầu Nguyện",
        Description = "",
        Callback = function()
            local v572 = {
                [1] = "gravestoneEvent",
                [2] = 1
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v572));
        end
    });
    v16.Main:AddButton({
        Title = "Thử Vận May",
        Description = "",
        Callback = function()
            local v573 = {
                [1] = "gravestoneEvent",
                [2] = 2
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v573));
        end
    });
    local v489 = v16.Main:AddToggle("ToggleRandomBone", {
        Title = "Random Xương",
        Description = "",
        Default = Config.AutoRandomBone
    });
    v489:OnChanged(function(v574)
        _G.AutoRandomBone = v574;
        Config.AutoRandomBone = v574;
        SaveConfig(Config)
    end);
    v17.ToggleRandomBone:SetValue(Config.AutoRandomBone);
    spawn(function()
        while wait(0.05) do
            if _G.AutoRandomBone then
                local v844 = {
                    [1] = "Bones",
                    [2] = "Buy",
                    [3] = 1,
                    [4] = 1
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v844));
            end
        end
    end);
end
if Sea3 then
    local v490 = v16.Main:AddSection("Tư Lệnh Bánh");
    local v491 = v16.Main:AddParagraph({
        Title = "Trạng Thái Nó Ra",
        Content = ""
    });
    spawn(function()
        while wait(0.05) do
            pcall(function()
                if (string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 88) then
                    v491:SetDesc("Còn: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 41) .. "");
                elseif (string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 87) then
                    v491:SetDesc("Còn: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 40) .. "");
                elseif (string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) == 86) then
                    v491:SetDesc("Còn: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 39) .. " ");
                else
                    v491:SetDesc("Tư Lệnh Bánh : ✅️");
                end
            end);
        end
    end);
    local v492 = v16.Main:AddToggle("ToggleCake", {
        Title = "Cày Tư Lệnh Bánh",
        Description = "",
        Default = Config.CakePrince
    });
    local v493 = true;
    v492:OnChanged(function(v575)
        _G.CakePrince = v575;
        Config.CakePrince = v575;
        SaveConfig(Config)
        if v575 then
            if v493 then
                v493 = false;
                local v895 = CFrame.new(- 2003.932861328125, 380.4824523925781, - 12561.0185546875);
                Tween(v895);
            end
        else
            v493 = true;
            wait(0.05);
            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
            wait(0.05);
        end
    end);
    v17.ToggleCake:SetValue(Config.CakePrince);
    spawn(function()
        while wait(0.05) do
            if _G.CakePrince and not _G.PirateRaiding and not _G.Elite then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                        for v1438, v1439 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1439.Name == "Cake Prince") then
                                if (v1439:FindFirstChild("Humanoid") and v1439:FindFirstChild("HumanoidRootPart") and (v1439.Humanoid.Health > 0)) then
                                    repeat
                                        task.wait(_G.Fast_Delay);
                                        AutoHaki();
                                        EquipTool(_G.SelectWeapon);
                                        v1439.HumanoidRootPart.CanCollide = false;
                                        v1439.Humanoid.WalkSpeed = 0;
                                        v1439.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        Tween(v1439.HumanoidRootPart.CFrame * Pos);
                                        AttackNoCoolDown();
                                    until not _G.CakePrince or not v1439.Parent or (v1439.Humanoid.Health <= 0) or _G.PirateRaiding or _G.Elite
                                end
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                    elseif (game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1) then
                        if (game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker")) then
                            for v1754, v1755 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if ((v1755.Name == "Cookie Crafter") or (v1755.Name == "Cake Guard") or (v1755.Name == "Baking Staff") or (v1755.Name == "Head Baker")) then
                                    if (v1755:FindFirstChild("Humanoid") and v1755:FindFirstChild("HumanoidRootPart") and (v1755.Humanoid.Health > 0)) then
                                        repeat
                                            task.wait(_G.Fast_Delay);
                                            AutoHaki();
                                            bringmob = true;
                                            EquipTool(_G.SelectWeapon);
                                            v1755.HumanoidRootPart.CanCollide = false;
                                            v1755.Humanoid.WalkSpeed = 0;
                                            v1755.Head.CanCollide = false;
                                            v1755.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                            FarmPos = v1755.HumanoidRootPart.CFrame;
                                            MonFarm = v1755.Name;
                                            Tween(v1755.HumanoidRootPart.CFrame * Pos);
                                            AttackNoCoolDown();
                                        until not _G.CakePrince or _G.PirateRaiding or _G.Elite or not v1755.Parent or (v1755.Humanoid.Health <= 0) or (game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0) or game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]")
                                        bringmob = false;
                                    end
                                end
                            end
                        end
                    end
                end);
            end
        end
    end);
    local v494 = v16.Main:AddToggle("ToggleDoughKing", {
        Title = "Đấm Vua Bột",
        Description = "",
        Default = Config.DoughKing
    });
    v494:OnChanged(function(v576)
        _G.DoughKing = v576;
        Config.DoughKing = v576;
        SaveConfig(Config)
        if (v576 == false) then
            wait(0.05);
            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
            wait(0.05);
        end
    end);
    v17.ToggleDoughKing:SetValue(Config.DoughKing);
    spawn(function()
        while wait(0.05) do
            if _G.DoughKing and not _G.PirateRaiding and not _G.Elite then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                        for v1440, v1441 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1441.Name == "Dough King") then
                                if (v1441:FindFirstChild("Humanoid") and v1441:FindFirstChild("HumanoidRootPart") and (v1441.Humanoid.Health > 0)) then
                                    repeat
                                        task.wait(_G.Fast_Delay);
                                        AutoHaki();
                                        EquipTool(_G.SelectWeapon);
                                        v1441.HumanoidRootPart.CanCollide = false;
                                        v1441.Humanoid.WalkSpeed = 0;
                                        v1441.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        Tween(v1441.HumanoidRootPart.CFrame * Pos);
                                        AttackNoCoolDown();
                                    until not _G.DoughKing or not v1441.Parent or (v1441.Humanoid.Health <= 0)
                                end
                            end
                        end
                    end
                end);
            end
        end
    end);
    local v495 = v16.Main:AddToggle("ToggleSpawnCake", {
        Title = "Triệu Hồi Tư Lệnh Bánh",
        Description = "",
        Default = Config.SpawnCakePrince
    });
    v495:OnChanged(function(v577)
        _G.SpawnCakePrince = v577;
        Config.SpawnCakePrince = v577;
        SaveConfig(Config)
    end);
    v17.ToggleSpawnCake:SetValue(Config.SpawnCakePrince);
end
spawn(function()
    while wait(0.05) do
        if _G.SpawnCakePrince then
            local v681 = {
                [1] = "CakePrinceSpawner",
                [2] = true
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v681));
            local v681 = {
                [1] = "CakePrinceSpawner"
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v681));
        end
    end
end);
if Sea2 then
    local v496 = v16.Main:AddSection("Ectoplasm Farm");
    local v497 = v16.Main:AddToggle("ToggleVatChatKiDi", {
        Title = "Auto Farm Ectoplasm",
        Description = "",
        Default = Config.Ectoplasm
    });
    v497:OnChanged(function(v578)
        _G.Ectoplasm = v578;
        Config.Ectoplasm = v578;
        SaveConfig(Config)
    end);
    v17.ToggleVatChatKiDi:SetValue(Config.Ectoplasm);
    spawn(function()
        while wait(0.05) do
            pcall(function()
                if _G.Ectoplasm then
                    if (game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer")) then
                        for v1442, v1443 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if ((v1443.Name == "Ship Steward") or (v1443.Name == "Ship Engineer") or (v1443.Name == "Ship Deckhand") or ((v1443.Name == "Ship Officer") and v1443:FindFirstChild("Humanoid"))) then
                                if (v1443.Humanoid.Health > 0) then
                                    repeat
                                        wait(_G.Fast_Delay);
                                        AttackNoCoolDown();
                                        AutoHaki();
                                        bringmob = true;
                                        EquipTool(_G.SelectWeapon);
                                        Tween(v1443.HumanoidRootPart.CFrame * Pos);
                                        v1443.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        v1443.HumanoidRootPart.Transparency = 1;
                                        v1443.Humanoid.JumpPower = 0;
                                        v1443.Humanoid.WalkSpeed = 0;
                                        v1443.HumanoidRootPart.CanCollide = false;
                                        FarmPos = v1443.HumanoidRootPart.CFrame;
                                        MonFarm = v1443.Name;
                                    until (_G.Ectoplasm == false) or not v1443.Parent or (v1443.Humanoid.Health == 0) or not game:GetService("Workspace").Enemies:FindFirstChild(v1443.Name)
                                    bringmob = false;
                                end
                            end
                        end
                    else
                        local v1334 = (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
                        if (v1334 > 20000) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125));
                        end
                        Tween(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875));
                    end
                end
            end);
        end
    end);
end
local v60 = v16.Main:AddSection("Trùm");
if Sea1 then
    tableBoss = {
        "The Gorilla King",
        "Bobby",
        "Yeti",
        "Mob Leader",
        "Vice Admiral",
        "Warden",
        "Chief Warden",
        "Swan",
        "Magma Admiral",
        "Fishman Lord",
        "Wysper",
        "Thunder God",
        "Cyborg",
        "Saber Expert"
    };
elseif Sea2 then
    tableBoss = {
        "Diamond",
        "Jeremy",
        "Fajita",
        "Don Swan",
        "Smoke Admiral",
        "Cursed Captain",
        "Darkbeard",
        "Order",
        "Awakened Ice Admiral",
        "Tide Keeper"
    };
elseif Sea3 then
    tableBoss = {
        "Stone",
        "Hydra Leader",
        "Kilo Admiral",
        "Captain Elephant",
        "Beautiful Pirate",
        "rip_indra True Form",
        "Longma",
        "Soul Reaper",
        "Cake Queen"
    };
end
local v61 = v16.Main:AddDropdown("DropdownBoss", {
    Title = "Chọn Trùm",
    Description = "",
    Values = tableBoss,
    Multi = false,
    Default = Config.SelectBoss
});
v61:SetValue(Config.SelectBoss);
v61:OnChanged(function(v253)
    _G.SelectBoss = v253;
    Config.SelectBoss = v253;
    SaveConfig(Config)
end);
local v62 = v16.Main:AddToggle("ToggleAutoFarmBoss", {
    Title = "Đấm Trùm",
    Description = "",
    Default = Config.AutoBoss
});
v62:OnChanged(function(v254)
    _G.AutoBoss = v254;
    Config.AutoBoss = v254;
    SaveConfig(Config)
end);
v17.ToggleAutoFarmBoss:SetValue(Config.AutoBoss);
spawn(function()
    while wait(0.05) do
        if _G.AutoBoss then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                    for v1034, v1035 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1035.Name == _G.SelectBoss) then
                            if (v1035:FindFirstChild("Humanoid") and v1035:FindFirstChild("HumanoidRootPart") and (v1035.Humanoid.Health > 0)) then
                                repeat
                                    wait(_G.Fast_Delay);
                                    AttackNoCoolDown();
                                    AutoHaki();
                                    EquipTool(_G.SelectWeapon);
                                    v1035.HumanoidRootPart.CanCollide = false;
                                    v1035.Humanoid.WalkSpeed = 0;
                                    v1035.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    Tween(v1035.HumanoidRootPart.CFrame * Pos);
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
                                until not _G.AutoBoss or not v1035.Parent or (v1035.Humanoid.Health <= 0)
                            end
                        end
                    end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5, 10, 7));
                end
            end);
        end
    end
end);
local v63 = v16.Main:AddSection("Nguyên Liệu");
if Sea1 then
    MaterialList = {
        "Scrap Metal",
        "Leather",
        "Angel Wings",
        "Magma Ore",
        "Fish Tail"
    };
elseif Sea2 then
    MaterialList = {
        "Scrap Metal",
        "Leather",
        "Radioactive Material",
        "Mystic Droplet",
        "Magma Ore",
        "Vampire Fang"
    };
elseif Sea3 then
    MaterialList = {
        "Scrap Metal",
        "Leather",
        "Demonic Wisp",
        "Conjured Cocoa",
        "Dragon Scale",
        "Gunpowder",
        "Fish Tail",
        "Mini Tusk",
        "Hydra Enforcer",
        "Venomous Assailant"
    };
end
local v64 = v16.Main:AddDropdown("DropdownMaterial", {
    Title = "Chọn Nguyên Liệu",
    Description = "",
    Values = MaterialList,
    Multi = false,
    Default = 1
});
v64:SetValue(SelectMaterial);
v64:OnChanged(function(v255)
    SelectMaterial = v255;
    SaveConfig(Config)
end);
local v65 = v16.Main:AddToggle("ToggleMaterial", {
    Title = "Cày Nguyên Liệu",
    Description = "",
    Default = Config.AutoMaterial
});
v65:OnChanged(function(v256)
    _G.AutoMaterial = v256;
    Config.AutoMaterial = v256;
    SaveConfig(Config)
    if (v256 == false) then
        wait(0.05);
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
        wait(0.05);
    end
end);
v17.ToggleMaterial:SetValue(Config.AutoMaterial);
spawn(function()
    while task.wait(0.05) do
        if _G.AutoMaterial then
            pcall(function()
                MaterialMon(SelectMaterial);
                Tween(MPos);
                if game:GetService("Workspace").Enemies:FindFirstChild(MMon) then
                    for v1036, v1037 in pairs(game.Workspace.Enemies:GetChildren()) do
                        if (v1037:FindFirstChild("Humanoid") and v1037:FindFirstChild("HumanoidRootPart") and (v1037.Humanoid.Health > 0)) then
                            if (v1037.Name == MMon) then
                                repeat
                                    wait(_G.Fast_Delay);
                                    AttackNoCoolDown();
                                    AutoHaki();
                                    bringmob = true;
                                    EquipTool(_G.SelectWeapon);
                                    Tween(v1037.HumanoidRootPart.CFrame * Pos);
                                    v1037.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    v1037.HumanoidRootPart.Transparency = 1;
                                    v1037.Humanoid.JumpPower = 0;
                                    v1037.Humanoid.WalkSpeed = 0;
                                    v1037.HumanoidRootPart.CanCollide = false;
                                    FarmPos = v1037.HumanoidRootPart.CFrame;
                                    MonFarm = v1037.Name;
                                until not _G.AutoMaterial or not v1037.Parent or (v1037.Humanoid.Health <= 0)
                                bringmob = false;
                            end
                        end
                    end
                else
                    for v1038, v1039 in pairs(game:GetService("Workspace")['_WorldOrigin'].EnemySpawns:GetChildren()) do
                        if string.find(v1039.Name, Mon) then
                            if ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v1039.Position).Magnitude >= 10) then
                                Tween(v1039.HumanoidRootPart.CFrame * Pos);
                            end
                        end
                    end
                end
            end);
        end
    end
end);
if Sea3 then
    local v498 = v16.Sea:AddSection("Đảo Cáo");
    local v499 = v16.Sea:AddParagraph({
        Title = "Trạng Thái Đảo Cáo",
        Content = ""
    });
    function UpdateKitsune()
        if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
            v499:SetDesc("Đảo Cáo : ✅️");
        else
            v499:SetDesc("Đảo Cáo : ❌️");
        end
    end
    spawn(function()
        pcall(function()
            while wait(0.05) do
                UpdateKitsune();
            end
        end);
    end);
    local v500 = v16.Sea:AddToggle("ToggleEspKitsune", {
        Title = "Định Vị Đảo Cáo",
        Description = "",
        Default = Config.KitsuneIslandEsp
    });
    v500:OnChanged(function(v579)
        _G.KitsuneIslandEsp = v579;
        Config.KitsuneIslandEsp = v579;
        SaveConfig(Config)
        while _G.KitsuneIslandEsp do
            wait(0.05);
            UpdateIslandKisuneESP();
        end
    end);
    v17.ToggleEspKitsune:SetValue(Config.KitsuneIslandEsp);
    function UpdateIslandKisuneESP()
        for v682, v683 in pairs(game:GetService("Workspace")['_WorldOrigin'].Locations:GetChildren()) do
            pcall(function()
                if _G.KitsuneIslandEsp then
                    if (v683.Name == "Kitsune Island") then
                        if not v683:FindFirstChild("NameEsp") then
                            local v1518 = Instance.new("BillboardGui", v683);
                            v1518.Name = "NameEsp";
                            v1518.ExtentsOffset = Vector3.new(0, 1, 0);
                            v1518.Size = UDim2.new(1, 200, 1, 30);
                            v1518.Adornee = v683;
                            v1518.AlwaysOnTop = true;
                            local v1524 = Instance.new("TextLabel", v1518);
                            v1524.Font = "Code";
                            v1524.FontSize = "Size14";
                            v1524.TextWrapped = true;
                            v1524.Size = UDim2.new(1, 0, 1, 0);
                            v1524.TextYAlignment = "Top";
                            v1524.BackgroundTransparency = 1;
                            v1524.TextStrokeTransparency = 0.5;
                            v1524.TextColor3 = Color3.fromRGB(80, 245, 245);
                        else
                            v683['NameEsp'].TextLabel.Text = v683.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v683.Position).Magnitude / 3) .. " M" ;
                        end
                    end
                elseif v683:FindFirstChild("NameEsp") then
                    v683:FindFirstChild("NameEsp"):Destroy();
                end
            end);
        end
    end
    local v501 = v16.Sea:AddToggle("ToggleTPKitsune", {
        Title = "Bay Vô Đảo Cáo",
        Description = "",
        Default = Config.TweenToKitsune
    });
    v501:OnChanged(function(v580)
        _G.TweenToKitsune = v580;
        Config.TweenToKitsune = v580;
        SaveConfig(Config)
    end);
    v17.ToggleTPKitsune:SetValue(Config.TweenToKitsune);
    spawn(function()
        local v581;
        while not v581 do
            v581 = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland");
            wait(0.05);
        end
        while wait(0.05) do
            if _G.TweenToKitsune then
                local v845 = v581:FindFirstChild("ShrineActive");
                if v845 then
                    for v1335, v1336 in pairs(v845:GetDescendants()) do
                        if (v1336:IsA("BasePart") and v1336.Name:find("NeonShrinePart")) then
                            Tween(v1336.CFrame);
                        end
                    end
                end
            end
        end
    end);
    local v502 = v16.Sea:AddToggle("ToggleCollectAzure", {
        Title = "Lụm Linh Hồn Xanh",
        Description = "",
        Default = Config.CollectAzure
    });
    v502:OnChanged(function(v582)
        _G.CollectAzure = v582;
        Config.CollectAzure = v582;
        SaveConfig(Config)
    end);
    v17.ToggleCollectAzure:SetValue(Config.CollectAzure);
    spawn(function()
        while wait(0.05) do
            if _G.CollectAzure then
                pcall(function()
                    if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                        Tween(game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame);
                    end
                end);
            end
        end
    end);
end
v16.Sea:AddButton({
    Title = "Đổi Linh Hồn Xanh",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/KitsuneStatuePray"):InvokeServer();
    end
});
if Sea3 then
    local v503 = v16.Sea:AddSection("Biển");
    local v504 = game:GetService("Players");
    local v505 = game:GetService("RunService");
    local v506 = game:GetService("VirtualInputManager");
    local v507 = game:GetService("Workspace");
    local v508 = 350;
    local v509 = v16.Sea:AddSlider("SliderSpeedBoat", {
        Title = "Tốc Độ Thuyền",
        Description = "",
        Default = v508,
        Min = 0,
        Max = 350,
        Rounding = 1,
        Callback = function(v583)
            v508 = v583;
        end
    });
    v509:SetValue(v508);
    local v510 = v16.Sea:AddToggle("AutoFindPrehistoric", {
        Title = "Tìm Đảo Dung Nham",
        Description = "",
        Default = Config.AutoFindPrehistoric
    });
    v17.AutoFindPrehistoric:SetValue(Config.AutoFindPrehistoric);
    v510:OnChanged(function(v584)
        _G.AutoFindPrehistoric = v584;
        Config.AutoFindPrehistoric = v584;
        SaveConfig(Config)
    end);
    local v511 = {};
    local v512 = false;
    local v513 = false;
    v505.RenderStepped:Connect(function()
        if not _G.AutoFindPrehistoric then
            v513 = false;
            return;
        end
        local v585 = v504.LocalPlayer;
        local v586 = v585.Character;
        if (not v586 or not v586:FindFirstChild("Humanoid")) then
            return;
        end
        local function v587()
            if v512 then
                return;
            end
            v512 = true;
            for v769, v770 in pairs(v511) do
                if (v770 and v770.Parent and (v770.Name == "VehicleSeat") and not v770.Occupant) then
                    Tween2(v770.CFrame);
                    break;
                end
            end
            v512 = false;
        end
        local v588 = v586.Humanoid;
        local v589 = false;
        local v590 = nil;
        for v684, v685 in pairs(v507.Boats:GetChildren()) do
            local v686 = v685:FindFirstChild("VehicleSeat");
            if (v686 and (v686.Occupant == v588)) then
                v589 = true;
                v590 = v686;
                v511[v685.Name] = v686;
            elseif (v686 and (v686.Occupant == nil)) then
                v587();
            end
        end
        if not v589 then
            return;
        end
        v590.MaxSpeed = v508;
        v590.CFrame = CFrame.new(Vector3.new(v590.Position.X, v590.Position.Y, v590.Position.Z)) * v590.CFrame.Rotation ;
        v506:SendKeyEvent(true, "W", false, game);
        for v687, v688 in pairs(v507.Boats:GetDescendants()) do
            if v688:IsA("BasePart") then
                v688.CanCollide = false;
            end
        end
        for v689, v690 in pairs(v586:GetDescendants()) do
            if v690:IsA("BasePart") then
                v690.CanCollide = false;
            end
        end
        local v593 = {
            "ShipwreckIsland",
            "SandIsland",
            "TreeIsland",
            "TinyIsland",
            "MysticIsland",
            "KitsuneIsland",
            "FrozenDimension"
        };
        for v691, v692 in ipairs(v593) do
            local v693 = v507.Map:FindFirstChild(v692);
            if (v693 and v693:IsA("Model")) then
                v693:Destroy();
            end
        end
        local v594 = v507.Map:FindFirstChild("PrehistoricIsland");
        if v594 then
            v506:SendKeyEvent(false, "W", false, game);
            _G.AutoFindPrehistoric = false;
            if not v513 then
                v14:Notify({
                    Title = "Maru Hub",
                    Content = "Đảo Dung Nham Tìm Thấy",
                    Duration = 10
                });
                v513 = true;
            end
            return;
        end
    end);
    local v514 = v16.Sea:AddToggle("AutoFindMirage", {
        Title = "Tìm Đảo Bí Ẩn",
        Description = "",
        Default = Config.AutoFindMirage
    });
    v17.AutoFindMirage:SetValue(Config.AutoFindMirage);
    v514:OnChanged(function(v595)
        _G.AutoFindMirage = v595;
        Config.AutoFindMirage = v595;
        SaveConfig(Config)
    end);
    local v511 = {};
    local v512 = false;
    local v513 = false;
    v505.RenderStepped:Connect(function()
        if not _G.AutoFindMirage then
            v513 = false;
            return;
        end
        local v596 = v504.LocalPlayer;
        local v597 = v596.Character;
        if (not v597 or not v597:FindFirstChild("Humanoid")) then
            return;
        end
        local function v598()
            if v512 then
                return;
            end
            v512 = true;
            for v771, v772 in pairs(v511) do
                if (v772 and v772.Parent and (v772.Name == "VehicleSeat") and not v772.Occupant) then
                    Tween2(v772.CFrame);
                    break;
                end
            end
            v512 = false;
        end
        local v599 = v597.Humanoid;
        local v600 = false;
        local v601 = nil;
        for v694, v695 in pairs(v507.Boats:GetChildren()) do
            local v696 = v695:FindFirstChild("VehicleSeat");
            if (v696 and (v696.Occupant == v599)) then
                v600 = true;
                v601 = v696;
                v511[v695.Name] = v696;
            elseif (v696 and (v696.Occupant == nil)) then
                v598();
            end
        end
        if not v600 then
            return;
        end
        v601.MaxSpeed = v508;
        v601.CFrame = CFrame.new(Vector3.new(v601.Position.X, v601.Position.Y, v601.Position.Z)) * v601.CFrame.Rotation ;
        v506:SendKeyEvent(true, "W", false, game);
        for v697, v698 in pairs(v507.Boats:GetDescendants()) do
            if v698:IsA("BasePart") then
                v698.CanCollide = false;
            end
        end
        for v699, v700 in pairs(v597:GetDescendants()) do
            if v700:IsA("BasePart") then
                v700.CanCollide = false;
            end
        end
        local v604 = {
            "ShipwreckIsland",
            "SandIsland",
            "TreeIsland",
            "TinyIsland",
            "PrehistoricIsland",
            "KitsuneIsland",
            "FrozenDimension"
        };
        for v701, v702 in ipairs(v604) do
            local v703 = v507.Map:FindFirstChild(v702);
            if (v703 and v703:IsA("Model")) then
                v703:Destroy();
            end
        end
        local v605 = v507.Map:FindFirstChild("MysticIsland");
        if v605 then
            v506:SendKeyEvent(false, "W", false, game);
            _G.AutoFindMirage = false;
            if not v513 then
                v14:Notify({
                    Title = "Maru Hub",
                    Content = "Đảo Bí Ẩn Tìm Thấy",
                    Duration = 10
                });
                v513 = true;
            end
            return;
        end
    end);
    local v515 = v16.Sea:AddToggle("AutoFindFrozen", {
        Title = "Tìm Đảo Leviathan",
        Description = "Cần 5 Người Không Idk",
        Default = Config.AutoFindFrozen
    });
    v17.AutoFindFrozen:SetValue(Config.AutoFindFrozen);
    v515:OnChanged(function(v606)
        _G.AutoFindFrozen = v606;
        Config.AutoFindFrozen = v606;
        SaveConfig(Config)
    end);
    local v511 = {};
    local v512 = false;
    local v513 = false;
    v505.RenderStepped:Connect(function()
        if not _G.AutoFindFrozen then
            v513 = false;
            return;
        end
        local v607 = v504.LocalPlayer;
        local v608 = v607.Character;
        if (not v608 or not v608:FindFirstChild("Humanoid")) then
            return;
        end
        local function v609()
            if v512 then
                return;
            end
            v512 = true;
            for v773, v774 in pairs(v511) do
                if (v774 and v774.Parent and (v774.Name == "VehicleSeat") and not v774.Occupant) then
                    Tween2(v774.CFrame);
                    break;
                end
            end
            v512 = false;
        end
        local v610 = v608.Humanoid;
        local v611 = false;
        local v612 = nil;
        for v704, v705 in pairs(v507.Boats:GetChildren()) do
            local v706 = v705:FindFirstChild("VehicleSeat");
            if (v706 and (v706.Occupant == v610)) then
                v611 = true;
                v612 = v706;
                v511[v705.Name] = v706;
            elseif (v706 and (v706.Occupant == nil)) then
                v609();
            end
        end
        if not v611 then
            return;
        end
        v612.MaxSpeed = v508;
        v612.CFrame = CFrame.new(Vector3.new(v612.Position.X, v612.Position.Y, v612.Position.Z)) * v612.CFrame.Rotation ;
        v506:SendKeyEvent(true, "W", false, game);
        for v707, v708 in pairs(v507.Boats:GetDescendants()) do
            if v708:IsA("BasePart") then
                v708.CanCollide = false;
            end
        end
        for v709, v710 in pairs(v608:GetDescendants()) do
            if v710:IsA("BasePart") then
                v710.CanCollide = false;
            end
        end
        local v615 = {
            "ShipwreckIsland",
            "SandIsland",
            "TreeIsland",
            "TinyIsland",
            "MysticIsland",
            "KitsuneIsland",
            "PrehistoricIsland"
        };
        for v711, v712 in ipairs(v615) do
            local v713 = v507.Map:FindFirstChild(v712);
            if (v713 and v713:IsA("Model")) then
                v713:Destroy();
            end
        end
        local v616 = v507.Map:FindFirstChild("FrozenDimension");
        if v616 then
            v506:SendKeyEvent(false, "W", false, game);
            _G.AutoFindFrozen = false;
            if not v513 then
                v14:Notify({
                    Title = "Maru Hub",
                    Content = "Đảo Leviathan Tìm Thấy",
                    Duration = 10
                });
                v513 = true;
            end
            return;
        end
    end);
    local v516 = v16.Sea:AddToggle("AutoComeTiki", {
        Title = "Lái Thuyền Về Đảo Tiki",
        Description = "",
        Default = Config.AutoComeTiki
    });
    v516:OnChanged(function(v617)
        _G.AutoComeTiki = v617;
        Config.AutoComeTiki = v617;
        SaveConfig(Config)
    end);
    v505.RenderStepped:Connect(function()
        if not _G.AutoComeTiki then
            return;
        end
        local v618 = v504.LocalPlayer;
        local v619 = v618.Character;
        if (not v619 or not v619:FindFirstChild("Humanoid")) then
            return;
        end
        local v620 = v619.Humanoid;
        local v621 = nil;
        for v714, v715 in pairs(v507.Boats:GetChildren()) do
            local v716 = v715:FindFirstChild("VehicleSeat");
            if (v716 and (v716.Occupant == v620)) then
                v621 = v716;
                break;
            end
        end
        if v621 then
            v621.MaxSpeed = v508;
            local v776 = CFrame.new(- 16217.7568359375, 9.126761436462402, 446.06536865234375);
            local v777 = v621.Position;
            local v778 = v776.Position;
            local v779 = (v778 - v777).unit;
            local v780 = v779 * v621.MaxSpeed * v505.RenderStepped:wait(0.05) ;
            v621.CFrame = v621.CFrame + v780 ;
            local v782 = CFrame.new(v777, v778);
            v621.CFrame = CFrame.new(v621.Position, v778);
            if ((v621.Position - v778).magnitude < 120) then
                _G.AutoComeTiki = false;
                v506:SendKeyEvent(false, "W", false, game);
            end
        end
    end);
    local v517 = v16.Sea:AddToggle("AutoComeHydra", {
        Title = "Lái Thuyền Về Đảo Hydra",
        Description = "",
        Default = Config.AutoComeHydra
    });
    v517:OnChanged(function(v622)
        _G.AutoComeHydra = v622;
        Config.AutoComeHydra = v622;
        SaveConfig(Config)
    end);
    v505.RenderStepped:Connect(function()
        if not _G.AutoComeHydra then
            return;
        end
        local v623 = v504.LocalPlayer;
        local v624 = v623.Character;
        if (not v624 or not v624:FindFirstChild("Humanoid")) then
            return;
        end
        local v625 = v624.Humanoid;
        local v626 = nil;
        for v717, v718 in pairs(v507.Boats:GetChildren()) do
            local v719 = v718:FindFirstChild("VehicleSeat");
            if (v719 and (v719.Occupant == v625)) then
                v626 = v719;
                break;
            end
        end
        if v626 then
            v626.MaxSpeed = v508;
            local v784 = CFrame.new(5193.9375, - 0.04690289497375488, 1631.578369140625);
            local v785 = v626.Position;
            local v786 = v784.Position;
            local v787 = (v786 - v785).unit;
            local v788 = v787 * v626.MaxSpeed * v505.RenderStepped:wait(0.05) ;
            v626.CFrame = v626.CFrame + v788 ;
            local v790 = CFrame.new(v785, v786);
            v626.CFrame = CFrame.new(v626.Position, v786);
            if ((v626.Position - v786).magnitude < 120) then
                _G.AutoComeHydra = false;
                v506:SendKeyEvent(false, "W", false, game);
            end
        end
    end);
    v16.Sea:AddButton({
        Title = "Bay Đến Khu Vực Săn",
        Description = "",
        Callback = function()
            Tween2(CFrame.new(- 16917.154296875, 7.757596015930176, 511.8203125));
        end
    });
    local v511 = {};
    local v518 = {
        "Beast Hunter",
        "Sleigh",
        "Miracle",
        "The Sentinel",
        "Guardian",
        "Lantern",
        "Dinghy",
        "PirateSloop",
        "PirateBrigade",
        "PirateGrandBrigade",
        "MarineGrandBrigade",
        "MarineBrigade",
        "MarineSloop"
    };
    local v519 = v16.Sea:AddDropdown("DropdownBoat", {
        Title = "Chọn Thuyền",
        Description = "",
        Values = v518,
        Multi = false,
        Default = 1
    });
    v519:SetValue(selectedBoat);
    v519:OnChanged(function(v627)
        selectedBoat = v627;
        SaveConfig(Config)
    end);
    local function v520(v628)
        local v629 = {
            [1] = "BuyBoat",
            [2] = v628
        };
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v629));
        task.delay(2, function()
            for v791, v792 in pairs(v507.Boats:GetChildren()) do
                if (v792:IsA("Model") and (v792.Name == v628)) then
                    local v896 = v792:FindFirstChild("VehicleSeat");
                    if (v896 and not v896.Occupant) then
                        v511[v628] = v896;
                    end
                end
            end
        end);
    end
    local function v521()
        for v720, v721 in pairs(v511) do
            if (v721 and v721.Parent and (v721.Name == "VehicleSeat") and not v721.Occupant) then
                Tween2(v721.CFrame);
            end
        end
    end
    game:GetService("RunService").RenderStepped:Connect(function()
        for v722, v723 in pairs(v511) do
            if (v723 and v723.Parent and (v723.Name == "VehicleSeat") and not v723.Occupant) then
                v511[v722] = v723;
            end
        end
    end);
    v16.Sea:AddButton({
        Title = "Mua Thuyền",
        Description = "",
        Callback = function()
            v520(selectedBoat);
        end
    });
    v16.Sea:AddButton({
        Title = "Bay Đến Thuyền",
        Description = "Duy Nhất Thuyền Bạn Mua Ở Chỗ Chọn",
        Callback = function()
            v521();
        end
    });
    local v522 = v16.Sea:AddToggle("ToggleTerrorshark", {
        Title = "Đấm Cá Mập",
        Description = "",
        Default = Config.AutoTerrorshark
    });
    v522:OnChanged(function(v630)
        _G.AutoTerrorshark = v630;
        Config.AutoTerrorshark = v630;
        SaveConfig(Config)
    end);
    v17.ToggleTerrorshark:SetValue(Config.AutoTerrorshark);
    spawn(function()
        while wait(0.05) do
            if _G.AutoTerrorshark then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                        for v1444, v1445 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1445.Name == "Terrorshark") then
                                if (v1445:FindFirstChild("Humanoid") and v1445:FindFirstChild("HumanoidRootPart") and (v1445.Humanoid.Health > 0)) then
                                    repeat
                                        wait(_G.Fast_Delay);
                                        AttackNoCoolDown();
                                        AutoHaki();
                                        EquipTool(_G.SelectWeapon);
                                        v1445.HumanoidRootPart.CanCollide = false;
                                        v1445.Humanoid.WalkSpeed = 0;
                                        v1445.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        Tween(v1445.HumanoidRootPart.CFrame * Pos);
                                    until not _G.AutoTerrorshark or not v1445.Parent or (v1445.Humanoid.Health <= 0)
                                end
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                    else
                    end
                end);
            end
        end
    end);
    local v523 = v16.Sea:AddToggle("TogglePiranha", {
        Title = "Đấm Piranha",
        Description = "",
        Default = Config.farmpiranya
    });
    v523:OnChanged(function(v631)
        _G.farmpiranya = v631;
        Config.farmpiranya = v631;
        SaveConfig(Config)
    end);
    v17.TogglePiranha:SetValue(Config.farmpiranya);
    spawn(function()
        while wait(0.05) do
            if _G.farmpiranya then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Piranha") then
                        for v1446, v1447 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1447.Name == "Piranha") then
                                if (v1447:FindFirstChild("Humanoid") and v1447:FindFirstChild("HumanoidRootPart") and (v1447.Humanoid.Health > 0)) then
                                    repeat
                                        wait(_G.Fast_Delay);
                                        AttackNoCoolDown();
                                        AutoHaki();
                                        EquipTool(_G.SelectWeapon);
                                        v1447.HumanoidRootPart.CanCollide = false;
                                        v1447.Humanoid.WalkSpeed = 0;
                                        v1447.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        Tween(v1447.HumanoidRootPart.CFrame * Pos);
                                    until not _G.farmpiranya or not v1447.Parent or (v1447.Humanoid.Health <= 0)
                                end
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Piranha") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Piranha").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                    else
                    end
                end);
            end
        end
    end);
    local v524 = v16.Sea:AddToggle("ToggleShark", {
        Title = "Đấm Cá Con",
        Description = "",
        Default = Config.AutoShark
    });
    v524:OnChanged(function(v632)
        _G.AutoShark = v632;
        Config.AutoShark = v632;
        SaveConfig(Config)
    end);
    v17.ToggleShark:SetValue(Config.AutoShark);
    spawn(function()
        while wait(0.05) do
            if _G.AutoShark then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
                        for v1448, v1449 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1449.Name == "Shark") then
                                if (v1449:FindFirstChild("Humanoid") and v1449:FindFirstChild("HumanoidRootPart") and (v1449.Humanoid.Health > 0)) then
                                    repeat
                                        wait(_G.Fast_Delay);
                                        AttackNoCoolDown();
                                        AutoHaki();
                                        EquipTool(_G.SelectWeapon);
                                        v1449.HumanoidRootPart.CanCollide = false;
                                        v1449.Humanoid.WalkSpeed = 0;
                                        v1449.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        Tween(v1449.HumanoidRootPart.CFrame * Pos);
                                        game.Players.LocalPlayer.Character.Humanoid.Sit = false;
                                    until not _G.AutoShark or not v1449.Parent or (v1449.Humanoid.Health <= 0)
                                end
                            end
                        end
                    else
                        Tween(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0));
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                        else
                        end
                    end
                end);
            end
        end
    end);
    local v525 = v16.Sea:AddToggle("ToggleFishCrew", {
        Title = "Đấm Tàu Cá",
        Description = "",
        Default = Config.AutoFishCrew
    });
    v525:OnChanged(function(v633)
        _G.AutoFishCrew = v633;
        Config.AutoFishCrew = v633;
        SaveConfig(Config)
    end);
    v17.ToggleFishCrew:SetValue(Config.AutoFishCrew);
    spawn(function()
        while wait(0.05) do
            if _G.AutoFishCrew then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                        for v1450, v1451 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1451.Name == "Fish Crew Member") then
                                if (v1451:FindFirstChild("Humanoid") and v1451:FindFirstChild("HumanoidRootPart") and (v1451.Humanoid.Health > 0)) then
                                    repeat
                                        wait(_G.Fast_Delay);
                                        AttackNoCoolDown();
                                        AutoHaki();
                                        EquipTool(_G.SelectWeapon);
                                        v1451.HumanoidRootPart.CanCollide = false;
                                        v1451.Humanoid.WalkSpeed = 0;
                                        v1451.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        Tween(v1451.HumanoidRootPart.CFrame * Pos);
                                        game.Players.LocalPlayer.Character.Humanoid.Sit = false;
                                    until not _G.AutoFishCrew or not v1451.Parent or (v1451.Humanoid.Health <= 0)
                                end
                            end
                        end
                    else
                        Tween(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0));
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member") then
                            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                        else
                        end
                    end
                end);
            end
        end
    end);
    local v526 = v16.Sea:AddToggle("ToggleShip", {
        Title = "Đấm Tàu",
        Description = "",
        Default = Config.Ship
    });
    v526:OnChanged(function(v634)
        _G.Ship = v634;
        Config.Ship = v634;
        SaveConfig(Config)
    end);
    v17.ToggleShip:SetValue(Config.Ship);
    function CheckPirateBoat()
        local v635 = {
            "PirateGrandBrigade",
            "PirateBrigade"
        };
        for v724, v725 in next, game:GetService("Workspace").Enemies:GetChildren() do
            if (table.find(v635, v725.Name) and v725:FindFirstChild("Health") and (v725.Health.Value > 0)) then
                return v725;
            end
        end
    end
    spawn(function()
        while wait(0.05) do
            if _G.Ship then
                pcall(function()
                    if CheckPirateBoat() then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game);
                        wait(0.5);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game);
                        local v1338 = CheckPirateBoat();
                        repeat
                            wait(0.05);
                            spawn(Tween(v1338.Engine.CFrame * CFrame.new(0, - 20, 0)), 1);
                            AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, - 5, 0) ;
                            Skillaimbot = true;
                            AutoSkill = false;
                        until not v1338 or not v1338.Parent or (v1338.Health.Value <= 0) or not CheckPirateBoat()
                        Skillaimbot = true;
                        AutoSkill = false;
                    end
                end);
            end
        end
    end);
    local v527 = v16.Sea:AddToggle("ToggleGhostShip", {
        Title = "Đấm Tàu Ma",
        Description = "",
        Default = Config.GhostShip
    });
    v527:OnChanged(function(v636)
        _G.GhostShip = v636;
        Config.GhostShip = v636;
        SaveConfig(Config)
    end);
    v17.ToggleGhostShip:SetValue(Config.GhostShip);
    function CheckPirateBoat()
        local v637 = {
            "FishBoat"
        };
        for v726, v727 in next, game:GetService("Workspace").Enemies:GetChildren() do
            if (table.find(v637, v727.Name) and v727:FindFirstChild("Health") and (v727.Health.Value > 0)) then
                return v727;
            end
        end
    end
    spawn(function()
        while wait(0.05) do
            pcall(function()
                if _G.bjirFishBoat then
                    if CheckPirateBoat() then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game);
                        wait(0.05);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game);
                        local v1339 = CheckPirateBoat();
                        repeat
                            wait(0.05);
                            spawn(Tween(v1339.Engine.CFrame * CFrame.new(0, - 20, 0), 1));
                            AutoSkill = true;
                            Skillaimbot = true;
                            AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, - 5, 0) ;
                        until v1339.Parent or (v1339.Health.Value <= 0) or not CheckPirateBoat()
                        AutoSkill = false;
                        Skillaimbot = false;
                    end
                end
            end);
        end
    end);
    spawn(function()
        while wait(0.05) do
            if _G.bjirFishBoat then
                pcall(function()
                    if CheckPirateBoat() then
                        AutoHaki();
                        game:GetService("VirtualUser"):CaptureController();
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672));
                        for v1452, v1453 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v1453:IsA("Tool") then
                                if (v1453.ToolTip == "Melee") then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1453);
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        for v1454, v1455 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v1455:IsA("Tool") then
                                if (v1455.ToolTip == "Blox Fruit") then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1455);
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.05);
                        for v1456, v1457 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v1457:IsA("Tool") then
                                if (v1457.ToolTip == "Sword") then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1457);
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.05);
                        for v1458, v1459 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v1459:IsA("Tool") then
                                if (v1459.ToolTip == "Gun") then
                                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1459);
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        wait(0.2);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                    end
                end);
            end
        end
    end);
    local v528 = v16.Main:AddSection("Elite");
    local v529 = v16.Main:AddParagraph({
        Title = "Trạng Thái Elite",
        Content = ""
    });
    _G.Elite = false
    spawn(function()
        while wait(0.05) do
            pcall(function()
                if (game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban")) then
                    v529:SetDesc("Elite Boss: ✅️ | Killed:  " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"));
                    _G.Elite = _G.AutoElite
                else
                    v529:SetDesc("Elite Boss: ❌️ | Killed: " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"));
                    _G.Elite = _G.AutoElite and false
                end
            end);
        end
    end);
    local v530 = v16.Main:AddToggle("ToggleElite", {
        Title = "Đấm Elite",
        Description = "",
        Default = Config.AutoElite
    });
    v530:OnChanged(function(v638)
        _G.AutoElite = v638;
        Config.AutoElite = v638;
        SaveConfig(Config)
    end);
    v17.ToggleElite:SetValue(Config.AutoElite);
    spawn(function()
        while task.wait(0.05) do
            if _G.AutoElite and not _G.PirateRaiding and _G.Elite then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter");
                    if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
                        if (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban")) then
                            if (game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban")) then
                                for v1663, v1664 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if (v1664:FindFirstChild("Humanoid") and v1664:FindFirstChild("HumanoidRootPart") and (v1664.Humanoid.Health > 0)) then
                                        if ((v1664.Name == "Diablo") or (v1664.Name == "Deandre") or (v1664.Name == "Urban")) then
                                            repeat
                                                wait(_G.Fast_Delay);
                                                AttackNoCoolDown();
                                                EquipTool(_G.SelectWeapon);
                                                AutoHaki();
                                                Tween2(v1664.HumanoidRootPart.CFrame * Pos);
                                                v1664.Humanoid.WalkSpeed = 0;
                                                v1664.HumanoidRootPart.CanCollide = false;
                                                v1664.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                            until (_G.AutoElite == false) or (v1664.Humanoid.Health <= 0) or not v1664.Parent
                                        end
                                    end
                                end
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                                Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                                Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                                Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                            end
                        end
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter");
                    end
                end);
            end
        end
    end);
end
if Sea3 then
    local v531 = v16.Sea:AddSection("Đảo Bí Ẩn");
    local v532 = v16.Sea:AddParagraph({
        Title = "Trạng Thái",
        Content = ""
    });
    task.spawn(function()
        while task.wait(0.05) do
            pcall(function()
                local v793 = game:GetService("Lighting").Sky.MoonTextureId;
                if (v793 == "http://www.roblox.com/asset/?id=9709149431") then
                    FullMoonStatus = "100%";
                elseif (v793 == "http://www.roblox.com/asset/?id=9709149052") then
                    FullMoonStatus = "75%";
                elseif (v793 == "http://www.roblox.com/asset/?id=9709143733") then
                    FullMoonStatus = "50%";
                elseif (v793 == "http://www.roblox.com/asset/?id=9709150401") then
                    FullMoonStatus = "25%";
                elseif (v793 == "http://www.roblox.com/asset/?id=9709149680") then
                    FullMoonStatus = "15%";
                else
                    FullMoonStatus = "0%";
                end
            end);
        end
    end);
    task.spawn(function()
        while task.wait(0.05) do
            pcall(function()
                if game.Workspace.Map:FindFirstChild("MysticIsland") then
                    MirageStatus = "✅️";
                else
                    MirageStatus = "❌️";
                end
            end);
        end
    end);
    spawn(function()
        pcall(function()
            while wait(0.05) do
                v532:SetDesc("Đảo Bí Ẩn: " .. MirageStatus .. " | Trăng Tròn: " .. FullMoonStatus);
            end
        end);
    end);
    v16.Sea:AddButton({
        Title = "Bay Đến Chỗ Cao",
        Description = "",
        Callback = function()
            TweenToHighestPoint();
        end
    });
    function TweenToHighestPoint()
        local v639 = getHighestPoint();
        if v639 then
            Tween2(v639.CFrame * CFrame.new(0, 211.88, 0));
        end
    end
    function getHighestPoint()
        if not game.Workspace.Map:FindFirstChild("MysticIsland") then
            return nil;
        end
        for v728, v729 in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
            if v729:IsA("MeshPart") then
                if (v729.MeshId == "rbxassetid://83190276951914") then
                    return v729;
                end
            end
        end
    end
end
local v66 = v16.Sea:AddToggle("ToggleTpAdvanced", {
    Title = "Bay Đến Advanced Fruit Dealer",
    Description = "",
    Default = Config.AutoTpAdvanced
});
v66:OnChanged(function(v257)
    _G.AutoTpAdvanced = v257;
    Config.AutoTpAdvanced = v257;
    SaveConfig(Config)
end);
spawn(function()
    while wait(0.05) do
        if _G.AutoTpAdvanced then
            local v730 = game.ReplicatedStorage.NPCs:FindFirstChild("Advanced Fruit Dealer");
            if (v730 and v730:IsA("Model")) then
                local v856 = v730.PrimaryPart and v730.PrimaryPart.Position ;
                if v856 then
                    Tween2(CFrame.new(v856));
                end
            end
        end
    end
end);
local v67 = v16.Sea:AddToggle("ToggleTweenGear", {
    Title = "Bay Đến Bánh Răng",
    Description = "",
    Default = Config.TweenToGear
});
v67:OnChanged(function(v258)
    _G.TweenToGear = v258;
    Config.TweenToGear = v258;
    SaveConfig(Config)
end);
v17.ToggleTweenGear:SetValue(Config.TweenToGear);
spawn(function()
    pcall(function()
        while wait(0.05) do
            if _G.TweenToGear then
                if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    for v1040, v1041 in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
                        if v1041:IsA("MeshPart") then
                            if (v1041.Material == Enum.Material.Neon) then
                                Tween2(v1041.CFrame);
                            end
                        end
                    end
                end
            end
        end
    end);
end);
local v68 = v16.Sea:AddToggle("Togglelockmoon", {
    Title = "Nhìn Trăng Và Dùng Tộc",
    Description = "",
    Default = Config.AutoLockMoon
});
v68:OnChanged(function(v259)
    _G.AutoLockMoon = v259;
    Config.AutoLockMoon = v259;
    SaveConfig(Config)
end);
v17.Togglelockmoon:SetValue(Config.AutoLockMoon);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if _G.AutoLockMoon then
                local v794 = game.Lighting:GetMoonDirection();
                local v795 = game.Workspace.CurrentCamera.CFrame.p + (v794 * 100) ;
                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, v795);
            end
        end);
    end
end);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if _G.AutoLockMoon then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility");
            end
        end);
    end
end);
local v69 = v16.ITM:AddToggle("ToggleAutoSaber", {
    Title = "Saber",
    Description = "",
    Default = Config.Auto_Saber
});
v69:OnChanged(function(v260)
    _G.Auto_Saber = v260;
    Config.Auto_Saber = v260;
    SaveConfig(Config)
end);
v17.ToggleAutoSaber:SetValue(Config.Auto_Saber);
spawn(function()
    while task.wait(0.05) do
        if (_G.Auto_Saber and (game.Players.LocalPlayer.Data.Level.Value >= 200)) then
            pcall(function()
                if (game:GetService("Workspace").Map.Jungle.Final.Part.Transparency == 0) then
                    if (game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency == 0) then
                        if ((CFrame.new(- 1612.55884, 36.9774132, 148.719543, 0.37091279, 3.071715e-9, - 0.928667724, 3.970995e-8, 1, 1.9167935e-8, 0.928667724, - 4.398698e-8, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100) then
                            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
                            wait(1);
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame;
                            wait(1);
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame;
                            wait(1);
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame;
                            wait(1);
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame;
                            wait(1);
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame;
                            wait(1);
                        else
                            Tween(CFrame.new(- 1612.55884, 36.9774132, 148.719543, 0.37091279, 3.071715e-9, - 0.928667724, 3.970995e-8, 1, 1.9167935e-8, 0.928667724, - 4.398698e-8, 0.37091279));
                        end
                    elseif (game:GetService("Workspace").Map.Desert.Burn.Part.Transparency == 0) then
                        if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch")) then
                            EquipTool("Torch");
                            Tween(CFrame.new(1114.61475, 5.04679728, 4350.22803, - 0.648466587, - 1.2879909e-9, 0.761243105, - 5.706529e-10, 1, 1.2058454e-9, - 0.761243105, 3.4754488e-10, - 0.648466587));
                        else
                            Tween(CFrame.new(- 1610.00757, 11.5049858, 164.001587, 0.984807551, - 0.167722285, - 0.0449818149, 0.17364943, 0.951244235, 0.254912198, 0.00003423728, - 0.258850515, 0.965917408));
                        end
                    elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") ~= 0) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup");
                        wait(0.5);
                        EquipTool("Cup");
                        wait(0.5);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", game:GetService("Players").LocalPlayer.Character.Cup);
                        wait(0);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan");
                    elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon");
                    elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0) then
                        if (game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader")) then
                            Tween(CFrame.new(- 2967.59521, - 4.91089821, 5328.70703, 0.342208564, - 0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, - 0.939287126, 0.0184739735, 0.342634559));
                            for v1799, v1800 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v1800.Name == "Mob Leader") then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
                                        if (v1800:FindFirstChild("Humanoid") and v1800:FindFirstChild("HumanoidRootPart") and (v1800.Humanoid.Health > 0)) then
                                            repeat
                                                task.wait(_G.Fast_Delay);
                                                AutoHaki();
                                                EquipTool(_G.SelectWeapon);
                                                v1800.HumanoidRootPart.CanCollide = false;
                                                v1800.Humanoid.WalkSpeed = 0;
                                                v1800.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                                Tween(v1800.HumanoidRootPart.CFrame * Pos);
                                                AttackNoCoolDown();
                                            until (v1800.Humanoid.Health <= 0) or not _G.Auto_Saber
                                        end
                                    end
                                    if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                                    end
                                end
                            end
                        end
                    elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon");
                        wait(0.5);
                        EquipTool("Relic");
                        wait(0.5);
                        Tween(CFrame.new(- 1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.6690688e-9, 0.481375456, 2.53852e-8, 1, - 5.799956e-8, - 0.481375456, 6.3057264e-8, 0.876514494));
                    end
                elseif (game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert")) then
                    for v1460, v1461 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1461:FindFirstChild("Humanoid") and v1461:FindFirstChild("HumanoidRootPart") and (v1461.Humanoid.Health > 0)) then
                            if (v1461.Name == "Saber Expert") then
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    EquipTool(_G.SelectWeapon);
                                    Tween(v1461.HumanoidRootPart.CFrame * Pos);
                                    v1461.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    v1461.HumanoidRootPart.Transparency = 1;
                                    v1461.Humanoid.JumpPower = 0;
                                    v1461.Humanoid.WalkSpeed = 0;
                                    v1461.HumanoidRootPart.CanCollide = false;
                                    bringmob = true;
                                    FarmPos = v1461.HumanoidRootPart.CFrame;
                                    MonFarm = v1461.Name;
                                    AttackNoCoolDown();
                                until (v1461.Humanoid.Health <= 0) or not _G.Auto_Saber
                                bringmob = true;
                                if (v1461.Humanoid.Health <= 0) then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic");
                                end
                            end
                        end
                    end
                end
            end);
        end
    end
end);
local v70 = v16.ITM:AddToggle("ToggleAutoPoleV1", {
    Title = "Pole V1",
    Description = "",
    Default = Config.Auto_PoleV1
});
v70:OnChanged(function(v261)
    _G.Auto_PoleV1 = v261;
    Config.Auto_PoleV1 = v261;
    SaveConfig(Config)
end);
v17.ToggleAutoPoleV1:SetValue(Config.Auto_PoleV1);
local v71 = CFrame.new(- 7748.0185546875, 5606.80615234375, - 2305.898681640625);
spawn(function()
    while wait(0.05) do
        if _G.Auto_PoleV1 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
                    for v1042, v1043 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1043.Name == "Thunder God") then
                            if (v1043:FindFirstChild("Humanoid") and v1043:FindFirstChild("HumanoidRootPart") and (v1043.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    AutoHaki();
                                    EquipTool(_G.SelectWeapon);
                                    v1043.HumanoidRootPart.CanCollide = false;
                                    v1043.Humanoid.WalkSpeed = 0;
                                    v1043.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    Tween(v1043.HumanoidRootPart.CFrame * Pos);
                                    AttackNoCoolDown();
                                until not _G.Auto_PoleV1 or not v1043.Parent or (v1043.Humanoid.Health <= 0)
                            end
                        end
                    end
                elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v71.Position).Magnitude < 1500) then
                    Tween(v71);
                end
                Tween(CFrame.new(- 7748.0185546875, 5606.80615234375, - 2305.898681640625));
                if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                end
            end);
        end
    end
end);
local v72 = v16.ITM:AddToggle("ToggleAutoSaw", {
    Title = "Cưa Cá Mập",
    Description = "",
    Default = Config.Auto_Saw
});
v72:OnChanged(function(v262)
    _G.Auto_Saw = v262;
    Config.Auto_Saw = v262;
    SaveConfig(Config)
end);
v17.ToggleAutoSaw:SetValue(Config.Auto_Saw);
local v71 = CFrame.new(- 690.33081054688, 15.09425163269, 1582.2380371094);
spawn(function()
    while wait(0.05) do
        if _G.Auto_Saw then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("The Saw") then
                    for v1044, v1045 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1045.Name == "The Saw") then
                            if (v1045:FindFirstChild("Humanoid") and v1045:FindFirstChild("HumanoidRootPart") and (v1045.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    AutoHaki();
                                    EquipTool(_G.SelectWeapon);
                                    v1045.HumanoidRootPart.CanCollide = false;
                                    v1045.Humanoid.WalkSpeed = 0;
                                    v1045.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    Tween(v1045.HumanoidRootPart.CFrame * Pos);
                                    AttackNoCoolDown();
                                until not _G.Auto_Saw or not v1045.Parent or (v1045.Humanoid.Health <= 0)
                            end
                        end
                    end
                elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v71.Position).Magnitude < 1500) then
                    Tween(v71);
                end
                Tween(CFrame.new(- 690.33081054688, 15.09425163269, 1582.2380371094));
                if game:GetService("ReplicatedStorage"):FindFirstChild("The Saw") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("The Saw").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                end
            end);
        end
    end
end);
local v73 = v16.ITM:AddToggle("ToggleAutoWarden", {
    Title = "Kiếm Quản Ngục",
    Description = "",
    Default = Config.Auto_Warden
});
v73:OnChanged(function(v263)
    _G.Auto_Warden = v263;
    Config.Auto_Warden = v263;
    SaveConfig(Config)
end);
v17.ToggleAutoWarden:SetValue(Config.Auto_Warden);
local v74 = CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562);
spawn(function()
    while wait(0.05) do
        if _G.Auto_Warden then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden") then
                    for v1046, v1047 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1047.Name == "Chief Warden") then
                            if (v1047:FindFirstChild("Humanoid") and v1047:FindFirstChild("HumanoidRootPart") and (v1047.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    AutoHaki();
                                    EquipTool(_G.SelectWeapon);
                                    v1047.HumanoidRootPart.CanCollide = false;
                                    v1047.Humanoid.WalkSpeed = 0;
                                    v1047.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    Tween(v1047.HumanoidRootPart.CFrame * Pos);
                                    AttackNoCoolDown();
                                until not _G.Auto_Warden or not v1047.Parent or (v1047.Humanoid.Health <= 0)
                            end
                        end
                    end
                elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v74.Position).Magnitude < 1500) then
                    Tween(v74);
                end
                Tween(CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562));
                if game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                end
            end);
        end
    end
end);
if Sea3 then
    local v533 = v16.ITM:AddToggle("ToggleHallow", {
        Title = "Lưỡi Hái",
        Description = "",
        Default = Config.AutoHallowSycthe
    });
    v533:OnChanged(function(v640)
        _G.AutoHallowSycthe = v640;
        Config.AutoHallowSycthe = v640;
    SaveConfig(Config)
    end);
    v17.ToggleHallow:SetValue(Config.AutoHallowSycthe);
    spawn(function()
        while wait(0.05) do
            if _G.AutoHallowSycthe then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                        for v1462, v1463 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if string.find(v1463.Name, "Soul Reaper") then
                                repeat
                                    wait(_G.Fast_Delay);
                                    AttackNoCoolDown();
                                    AutoHaki();
                                    EquipTool(_G.SelectWeapon);
                                    v1463.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    Tween(v1463.HumanoidRootPart.CFrame * Pos);
                                    v1463.HumanoidRootPart.Transparency = 1;
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
                                until (v1463.Humanoid.Health <= 0) or (_G.AutoHallowSycthe == false)
                            end
                        end
                    elseif (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence")) then
                        repeat
                            Tween(CFrame.new(- 8932.322265625, 146.83154296875, 6062.55078125));
                            wait(0.05);
                        until (CFrame.new(- 8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
                        wait(0.05);
                        EquipTool("Hallow Essence");
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                    else
                    end
                end);
            end
        end
    end);
    spawn(function()
        while wait(0.05) do
            if _G.AutoHallowSycthe then
                local v857 = {
                    [1] = "Bones",
                    [2] = "Buy",
                    [3] = 1,
                    [4] = 1
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v857));
            end
        end
    end);
    local v534 = v16.ITM:AddToggle("ToggleYama", {
        Title = "Yama",
        Description = "",
        Default = Config.AutoYama
    });
    v534:OnChanged(function(v641)
        _G.AutoYama = v641;
        Config.AutoYama = v641;
        SaveConfig(Config)
    end);
    v17.ToggleYama:SetValue(Config.AutoYama);
    spawn(function()
        while wait(0.05) do
            if _G.AutoYama then
                if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30) then
                    repeat
                        wait(0.05);
                        fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector);
                    until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoYama
                end
            end
        end
    end);
    local v535 = v16.ITM:AddToggle("ToggleTushita", {
        Title = "Tushita",
        Description = "",
        Default = Config.AutoTushita
    });
    v535:OnChanged(function(v642)
        _G.AutoTushita = v642;
        Config.AutoTushita = v642;
        SaveConfig(Config)
    end);
    v17.ToggleTushita:SetValue(Config.AutoTushita);
    spawn(function()
        while wait(0.05) do
            if _G.AutoTushita then
                if game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
                    for v1340, v1341 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if ((v1341.Name == ("Longma" or (v1341.Name == "Longma"))) and (v1341.Humanoid.Health > 0) and v1341:IsA("Model") and v1341:FindFirstChild("Humanoid") and v1341:FindFirstChild("HumanoidRootPart")) then
                            repeat
                                wait(_G.Fast_Delay);
                                AttackNoCoolDown();
                                AutoHaki();
                                if not game.Players.LocalPlayer.Character:FindFirstChild(_G.SelectWeapon) then
                                    wait(0.05);
                                    EquipTool(_G.SelectWeapon);
                                end
                                FarmPos = v1341.HumanoidRootPart.CFrame;
                                v1341.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                v1341.Humanoid.JumpPower = 0;
                                v1341.Humanoid.WalkSpeed = 0;
                                v1341.HumanoidRootPart.CanCollide = false;
                                v1341.Humanoid:ChangeState(11);
                                Tween(v1341.HumanoidRootPart.CFrame * Pos);
                            until not _G.AutoTushita or not v1341.Parent or (v1341.Humanoid.Health <= 0)
                        end
                    end
                else
                    Tween(CFrame.new(- 10238.875976563, 389.7912902832, - 9549.7939453125));
                end
            end
        end
    end);
    local v536 = v16.ITM:AddToggle("ToggleHoly", {
        Title = "Đốt Đuốc",
        Description = "",
        Default = Config.Auto_Holy_Torch
    });
    v536:OnChanged(function(v643)
        _G.Auto_Holy_Torch = v643;
        Config.Auto_Holy_Torch = v643;
        SaveConfig(Config)
    end);
    v17.ToggleHoly:SetValue(Config.Auto_Holy_Torch);
    spawn(function()
        while wait(0.05) do
            if _G.Auto_Holy_Torch then
                pcall(function()
                    wait(0.05);
                    repeat
                        Tween(CFrame.new(- 10752, 417, - 9366));
                        wait(0.05);
                    until not _G.Auto_Holy_Torch or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 10752, 417, - 9366)).Magnitude <= 10)
                    wait(0.05);
                    repeat
                        Tween(CFrame.new(- 11672, 334, - 9474));
                        wait(0.05);
                    until not _G.Auto_Holy_Torch or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 11672, 334, - 9474)).Magnitude <= 10)
                    wait(0.05);
                    repeat
                        Tween(CFrame.new(- 12132, 521, - 10655));
                        wait(0.05);
                    until not _G.Auto_Holy_Torch or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 12132, 521, - 10655)).Magnitude <= 10)
                    wait(0.05);
                    repeat
                        Tween(CFrame.new(- 13336, 486, - 6985));
                        wait(0.05);
                    until not _G.Auto_Holy_Torch or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 13336, 486, - 6985)).Magnitude <= 10)
                    wait(0.05);
                    repeat
                        Tween(CFrame.new(- 13489, 332, - 7925));
                        wait(0.05);
                    until not _G.Auto_Holy_Torch or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 13489, 332, - 7925)).Magnitude <= 10)
                end);
            end
        end
    end);
end
local v75 = v16.ITM:AddToggle("ToggleAutoCanvander", {
    Title = "Canvander",
    Description = "",
    Default = Config.Auto_Canvander
});
v75:OnChanged(function(v264)
    _G.Auto_Canvander = v264;
    Config.Auto_Canvander = v264;
    SaveConfig(Config)
end);
v17.ToggleAutoCanvander:SetValue(Config.Auto_Canvander);
local v71 = CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875);
spawn(function()
    while wait(0.05) do
        if _G.Auto_Canvander then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                    for v1048, v1049 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1049.Name == "Beautiful Pirate") then
                            if (v1049:FindFirstChild("Humanoid") and v1049:FindFirstChild("HumanoidRootPart") and (v1049.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    AutoHaki();
                                    EquipTool(_G.SelectWeapon);
                                    v1049.HumanoidRootPart.CanCollide = false;
                                    v1049.Humanoid.WalkSpeed = 0;
                                    v1049.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    Tween(v1049.HumanoidRootPart.CFrame * Pos);
                                    AttackNoCoolDown();
                                until not _G.Auto_Canvander or not v1049.Parent or (v1049.Humanoid.Health <= 0)
                            end
                        end
                    end
                elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v71.Position).Magnitude < 1500) then
                    Tween(v71);
                end
                Tween(CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875));
                if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                end
            end);
        end
    end
end);
local v76 = v16.ITM:AddToggle("ToggleAutoMusketeerHat", {
    Title = "Mũ Lính Ngự Lâm",
    Description = "",
    Default = Config.Auto_MusketeerHat
});
v76:OnChanged(function(v265)
    _G.Auto_MusketeerHat = v265;
    Config.Auto_MusketeerHat = v265;
    SaveConfig(Config)
end);
v17.ToggleAutoMusketeerHat:SetValue(Config.Auto_MusketeerHat);
spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.Auto_MusketeerHat then
                if ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800) and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false)) then
                    if (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true)) then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
                            for v1559, v1560 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v1560.Name == "Forest Pirate") then
                                    repeat
                                        task.wait(_G.Fast_Delay);
                                        pcall(function()
                                            EquipTool(_G.SelectWeapon);
                                            AutoHaki();
                                            v1560.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                            Tween(v1560.HumanoidRootPart.CFrame * Pos);
                                            v1560.HumanoidRootPart.CanCollide = false;
                                            AttackNoCoolDown();
                                            PosMon = v1560.HumanoidRootPart.CFrame;
                                            MonFarm = v1560.Name;
                                            bringmob = true;
                                        end);
                                    until (_G.Auto_MusketeerHat == false) or not v1560.Parent or (v1560.Humanoid.Health <= 0) or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
                                    bringmob = false;
                                end
                            end
                        else
                            bringmob = false;
                            Tween(CFrame.new(- 13206.452148438, 425.89199829102, - 7964.5537109375));
                        end
                    else
                        Tween(CFrame.new(- 12443.8671875, 332.40396118164, - 7675.4892578125));
                        if ((Vector3.new(- 12443.8671875, 332.40396118164, - 7675.4892578125) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30) then
                            wait(1.5);
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1);
                        end
                    end
                elseif ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800) and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false)) then
                    if (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true)) then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                            for v1665, v1666 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v1666.Name == "Captain Elephant") then
                                    OldCFrameElephant = v1666.HumanoidRootPart.CFrame;
                                    repeat
                                        task.wait(_G.Fast_Delay);
                                        pcall(function()
                                            EquipTool(_G.SelectWeapon);
                                            AutoHaki();
                                            v1666.HumanoidRootPart.CanCollide = false;
                                            v1666.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                            Tween(v1666.HumanoidRootPart.CFrame * Pos);
                                            v1666.HumanoidRootPart.CanCollide = false;
                                            v1666.HumanoidRootPart.CFrame = OldCFrameElephant;
                                            AttackNoCoolDown();
                                        end);
                                    until (_G.Auto_MusketeerHat == false) or (v1666.Humanoid.Health <= 0) or not v1666.Parent or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false)
                                end
                            end
                        else
                            Tween(CFrame.new(- 13374.889648438, 421.27752685547, - 8225.208984375));
                        end
                    else
                        Tween(CFrame.new(- 12443.8671875, 332.40396118164, - 7675.4892578125));
                        if ((CFrame.new(- 12443.8671875, 332.40396118164, - 7675.4892578125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4) then
                            wait(1.5);
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen");
                        end
                    end
                elseif ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800) and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2)) then
                    Tween(CFrame.new(- 12512.138671875, 340.39279174805, - 9872.8203125));
                end
            end
        end
    end);
end);
local v77 = v16.ITM:AddToggle("ToggleAutoObservationV2", {
    Title = "Haki Quan Sát V2",
    Description = "",
    Default = Config.Auto_ObservationV2
});
v77:OnChanged(function(v266)
    _G.Auto_ObservationV2 = v266;
    Config.Auto_ObservationV2 = v266;
    SaveConfig(Config)
end);
v17.ToggleAutoObservationV2:SetValue(Config.Auto_ObservationV2);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if _G.Auto_ObservationV2 then
                if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 3) then
                    _G.Auto_MusketeerHat = false;
                    if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple")) then
                        repeat
                            Tween(CFrame.new(- 12444.78515625, 332.40396118164, - 7673.1806640625));
                            wait(0.05);
                        until not _G.Auto_ObservationV2 or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 12444.78515625, 332.40396118164, - 7673.1806640625)).Magnitude <= 10)
                        wait(0.5);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen");
                    elseif (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl")) then
                        repeat
                            Tween(CFrame.new(- 10920.125, 624.20275878906, - 10266.995117188));
                            wait(0.05);
                        until not _G.Auto_ObservationV2 or ((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 10920.125, 624.20275878906, - 10266.995117188)).Magnitude <= 10)
                        wait(0.5);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Start");
                        wait(1);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Buy");
                    else
                        for v1561, v1562 in pairs(game:GetService("Workspace"):GetDescendants()) do
                            if ((v1562.Name == "Apple") or (v1562.Name == "Banana") or (v1562.Name == "Pineapple")) then
                                v1562.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10) ;
                                wait(0.05);
                                firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, v1562.Handle, 0);
                                wait(0.05);
                            end
                        end
                    end
                else
                    _G.Auto_MusketeerHat = true;
                end
            end
        end);
    end
end);
local v78 = v16.ITM:AddToggle("ToggleAutoRainbowHaki", {
    Title = "Haki 7 Màu",
    Description = "",
    Default = Config.Auto_RainbowHaki
});
v78:OnChanged(function(v267)
    _G.Auto_RainbowHaki = v267;
    Config.Auto_RainbowHaki = v267;
    SaveConfig(Config)
end);
v17.ToggleAutoRainbowHaki:SetValue(Config.Auto_RainbowHaki);
spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.Auto_RainbowHaki then
                if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
                    Tween(CFrame.new(- 11892.0703125, 930.57672119141, - 8760.1591796875));
                    if ((Vector3.new(- 11892.0703125, 930.57672119141, - 8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30) then
                        wait(1.5);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet");
                    end
                elseif (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone")) then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Stone") then
                        for v1563, v1564 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1564.Name == "Stone") then
                                OldCFrameRainbow = v1564.HumanoidRootPart.CFrame;
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    EquipTool(_G.SelectWeapon);
                                    Tween(v1564.HumanoidRootPart.CFrame * Pos);
                                    v1564.HumanoidRootPart.CanCollide = false;
                                    v1564.HumanoidRootPart.CFrame = OldCFrameRainbow;
                                    v1564.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    AttackNoCoolDown();
                                until not _G.Auto_RainbowHaki or (v1564.Humanoid.Health <= 0) or not v1564.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    else
                        Tween(CFrame.new(- 1086.11621, 38.8425903, 6768.71436));
                    end
                elseif (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader")) then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Hydra Leader") then
                        for v1669, v1670 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1670.Name == "Hydra Leader") then
                                OldCFrameRainbow = v1670.HumanoidRootPart.CFrame;
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    EquipTool(_G.SelectWeapon);
                                    Tween(v1670.HumanoidRootPart.CFrame * Pos);
                                    v1670.HumanoidRootPart.CanCollide = false;
                                    v1670.HumanoidRootPart.CFrame = OldCFrameRainbow;
                                    v1670.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    AttackNoCoolDown();
                                until not _G.Auto_RainbowHaki or (v1670.Humanoid.Health <= 0) or not v1670.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    else
                        Tween(CFrame.new(5713.98877, 601.922974, 202.751251));
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral") then
                        for v1762, v1763 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1763.Name == "Kilo Admiral") then
                                OldCFrameRainbow = v1763.HumanoidRootPart.CFrame;
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    EquipTool(_G.SelectWeapon);
                                    Tween(v1763.HumanoidRootPart.CFrame * Pos);
                                    v1763.HumanoidRootPart.CanCollide = false;
                                    v1763.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    v1763.HumanoidRootPart.CFrame = OldCFrameRainbow;
                                    AttackNoCoolDown();
                                until not _G.Auto_RainbowHaki or (v1763.Humanoid.Health <= 0) or not v1763.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    else
                        Tween(CFrame.new(2877.61743, 423.558685, - 7207.31006));
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                        for v1774, v1775 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1775.Name == "Captain Elephant") then
                                OldCFrameRainbow = v1775.HumanoidRootPart.CFrame;
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    EquipTool(_G.SelectWeapon);
                                    Tween(v1775.HumanoidRootPart.CFrame * Pos);
                                    v1775.HumanoidRootPart.CanCollide = false;
                                    v1775.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    v1775.HumanoidRootPart.CFrame = OldCFrameRainbow;
                                    AttackNoCoolDown();
                                until not _G.Auto_RainbowHaki or (v1775.Humanoid.Health <= 0) or not v1775.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    else
                        Tween(CFrame.new(- 13485.0283, 331.709259, - 8012.4873));
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                        for v1802, v1803 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1803.Name == "Beautiful Pirate") then
                                OldCFrameRainbow = v1803.HumanoidRootPart.CFrame;
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    EquipTool(_G.SelectWeapon);
                                    Tween(v1803.HumanoidRootPart.CFrame * Pos);
                                    v1803.HumanoidRootPart.CanCollide = false;
                                    v1803.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    v1803.HumanoidRootPart.CFrame = OldCFrameRainbow;
                                    AttackNoCoolDown();
                                until not _G.Auto_RainbowHaki or (v1803.Humanoid.Health <= 0) or not v1803.Parent or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                            end
                        end
                    else
                        Tween(CFrame.new(5312.3598632813, 20.141201019287, - 10.158538818359));
                    end
                else
                    Tween(CFrame.new(- 11892.0703125, 930.57672119141, - 8760.1591796875));
                    if ((Vector3.new(- 11892.0703125, 930.57672119141, - 8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30) then
                        wait(1.5);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet");
                    end
                end
            end
        end
    end);
end);
local v79 = v16.ITM:AddToggle("ToggleAutoSkullGuitar", {
    Title = "Skull Guitar",
    Description = "",
    Default = Config.Auto_SkullGuitar
});
v79:OnChanged(function(v268)
    _G.Auto_SkullGuitar = v268;
    Config.Auto_SkullGuitar = v268;
    SaveConfig(Config)
end);
v17.ToggleAutoSkullGuitar:SetValue(Config.Auto_SkullGuitar);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if _G.Auto_SkullGuitar then
                if (GetWeaponInventory("Skull Guitar") == false) then
                    if ((CFrame.new(- 9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5000) then
                        if game:GetService("Workspace").NPCs:FindFirstChild("Skeleton Machine") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy", true);
                        elseif (game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency == 0) then
                            if (game:GetService("Workspace").Map["Haunted Castle"].Placard1.Left.Part.Transparency == 0) then
                                Quest2 = true;
                                repeat
                                    wait(0.05);
                                    Tween(CFrame.new(- 8762.69140625, 176.84783935546875, 6171.3076171875));
                                until ((CFrame.new(- 8762.69140625, 176.84783935546875, 6171.3076171875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) or not _G.Auto_SkullGuitar
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector);
                                wait(1);
                                fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector);
                                wait(1);
                            elseif game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector") then
                                if game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part1:FindFirstChild("ClickDetector") then
                                    Quest4 = true;
                                    repeat
                                        wait(0.05);
                                        Tween(CFrame.new(- 9553.5986328125, 65.62338256835938, 6041.58837890625));
                                    until ((CFrame.new(- 9553.5986328125, 65.62338256835938, 6041.58837890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) or not _G.Auto_SkullGuitar
                                    wait(1);
                                    Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector);
                                    wait(1);
                                    Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector);
                                    wait(1);
                                    Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector);
                                    wait(1);
                                    Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector);
                                    wait(1);
                                    Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector);
                                    wait(1);
                                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector);
                                else
                                    Quest3 = true;
                                end
                            else
                                if game:GetService("Workspace").NPCs:FindFirstChild("Ghost") then
                                    local v1798 = {
                                        [1] = "GuitarPuzzleProgress",
                                        [2] = "Ghost"
                                    };
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1798));
                                end
                                if game.Workspace.Enemies:FindFirstChild("Living Zombie") then
                                    for v1804, v1805 in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if (v1805:FindFirstChild("HumanoidRootPart") and v1805:FindFirstChild("Humanoid") and (v1805.Humanoid.Health > 0)) then
                                            if (v1805.Name == "Living Zombie") then
                                                EquipTool(_G.SelectWeapon);
                                                v1805.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                                v1805.HumanoidRootPart.Transparency = 1;
                                                v1805.Humanoid.JumpPower = 0;
                                                v1805.Humanoid.WalkSpeed = 0;
                                                v1805.HumanoidRootPart.CanCollide = false;
                                                v1805.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0) ;
                                                Tween(CFrame.new(- 10160.787109375, 138.6616973876953, 5955.03076171875));
                                                game:GetService("VirtualUser"):CaptureController();
                                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672));
                                            end
                                        end
                                    end
                                else
                                    Tween(CFrame.new(- 10160.787109375, 138.6616973876953, 5955.03076171875));
                                end
                            end
                        elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Error") then
                            Tween(CFrame.new(- 8653.2060546875, 140.98487854003906, 6160.033203125));
                        elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Nothing") then
                            Tween("Wait Full Moon");
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true);
                        end
                    else
                        Tween(CFrame.new(- 9681.458984375, 6.139880657196045, 6341.3720703125));
                    end
                end
            end
        end);
    end
end);
local v80 = v16.ITM:AddToggle("ToggleAutoBuddy", {
    Title = "Kiếm Buddy",
    Description = "",
    Default = Config.Auto_Buddy
});
v80:OnChanged(function(v269)
    _G.Auto_Buddy = v269;
    Config.Auto_Buddy = v269;
    SaveConfig(Config)
end);
v17.ToggleAutoBuddy:SetValue(Config.Auto_Buddy);
local v81 = CFrame.new(- 731.2034301757812, 381.5658874511719, - 11198.4951171875);
spawn(function()
    while wait(0.05) do
        if _G.Auto_Buddy then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                    for v1050, v1051 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1051.Name == "Cake Queen") then
                            if (v1051:FindFirstChild("Humanoid") and v1051:FindFirstChild("HumanoidRootPart") and (v1051.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay);
                                    AutoHaki();
                                    EquipTool(_G.SelectWeapon);
                                    v1051.HumanoidRootPart.CanCollide = false;
                                    v1051.Humanoid.WalkSpeed = 0;
                                    v1051.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    Tween(v1051.HumanoidRootPart.CFrame * Pos);
                                    AttackNoCoolDown();
                                until not _G.Auto_Buddy or not v1051.Parent or (v1051.Humanoid.Health <= 0)
                            end
                        end
                    end
                elseif ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v81.Position).Magnitude < 1500) then
                    Tween(v81);
                end
                Tween(CFrame.new(- 731.2034301757812, 381.5658874511719, - 11198.4951171875));
                if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                end
            end);
        end
    end
end);
local v82 = v16.ITM:AddToggle("ToggleAutoDualKatana", {
    Title = "Song Kiếm",
    Description = "",
    Default = Config.Auto_DualKatana
});
v82:OnChanged(function(v270)
    _G.Auto_DualKatana = v270;
    Config.Auto_DualKatana = v270;
    SaveConfig(Config)
end);
v17.ToggleAutoDualKatana:SetValue(Config.Auto_DualKatana);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if _G.Auto_DualKatana then
                if (game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") or game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama")) then
                    if (game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita")) then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
                            EquipTool("Tushita");
                        end
                    elseif (game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama")) then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
                            EquipTool("Yama");
                        end
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem", "Tushita");
                end
            end
        end);
    end
end);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if _G.Auto_DualKatana then
                if (GetMaterial("Alucard Fragment") == 0) then
                    Auto_Quest_Yama_1 = true;
                    Auto_Quest_Yama_2 = false;
                    Auto_Quest_Yama_3 = false;
                    Auto_Quest_Tushita_1 = false;
                    Auto_Quest_Tushita_2 = false;
                    Auto_Quest_Tushita_3 = false;
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil");
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil");
                elseif (GetMaterial("Alucard Fragment") == 1) then
                    Auto_Quest_Yama_1 = false;
                    Auto_Quest_Yama_2 = true;
                    Auto_Quest_Yama_3 = false;
                    Auto_Quest_Tushita_1 = false;
                    Auto_Quest_Tushita_2 = false;
                    Auto_Quest_Tushita_3 = false;
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil");
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil");
                elseif (GetMaterial("Alucard Fragment") == 2) then
                    Auto_Quest_Yama_1 = false;
                    Auto_Quest_Yama_2 = false;
                    Auto_Quest_Yama_3 = true;
                    Auto_Quest_Tushita_1 = false;
                    Auto_Quest_Tushita_2 = false;
                    Auto_Quest_Tushita_3 = false;
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil");
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil");
                elseif (GetMaterial("Alucard Fragment") == 3) then
                    Auto_Quest_Yama_1 = false;
                    Auto_Quest_Yama_2 = false;
                    Auto_Quest_Yama_3 = false;
                    Auto_Quest_Tushita_1 = true;
                    Auto_Quest_Tushita_2 = false;
                    Auto_Quest_Tushita_3 = false;
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good");
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good");
                elseif (GetMaterial("Alucard Fragment") == 4) then
                    Auto_Quest_Yama_1 = false;
                    Auto_Quest_Yama_2 = false;
                    Auto_Quest_Yama_3 = false;
                    Auto_Quest_Tushita_1 = false;
                    Auto_Quest_Tushita_2 = true;
                    Auto_Quest_Tushita_3 = false;
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good");
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good");
                elseif (GetMaterial("Alucard Fragment") == 5) then
                    Auto_Quest_Yama_1 = false;
                    Auto_Quest_Yama_2 = false;
                    Auto_Quest_Yama_3 = false;
                    Auto_Quest_Tushita_1 = false;
                    Auto_Quest_Tushita_2 = false;
                    Auto_Quest_Tushita_3 = true;
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good");
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good");
                elseif (GetMaterial("Alucard Fragment") == 6) then
                    if (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").ReplicatedStorage:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]")) then
                        Auto_Quest_Yama_1 = false;
                        Auto_Quest_Yama_2 = false;
                        Auto_Quest_Yama_3 = false;
                        Auto_Quest_Tushita_1 = false;
                        Auto_Quest_Tushita_2 = false;
                        Auto_Quest_Tushita_3 = false;
                        if (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]")) then
                            for v1842, v1843 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if ((v1843.Name == "Cursed Skeleton Boss") or (v1843.Name == "Cursed Skeleton")) then
                                    if (v1843.Humanoid.Health > 0) then
                                        EquipTool(Sword);
                                        Tween(v1843.HumanoidRootPart.CFrame * pos);
                                        v1843.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        v1843.HumanoidRootPart.Transparency = 1;
                                        v1843.Humanoid.JumpPower = 0;
                                        v1843.Humanoid.WalkSpeed = 0;
                                        v1843.HumanoidRootPart.CanCollide = false;
                                        bringmob = true;
                                        FarmPos = v1843.HumanoidRootPart.CFrame;
                                        MonFarm = v1843.Name;
                                        AttackNoCoolDown();
                                    end
                                end
                            end
                        end
                    elseif ((CFrame.new(- 12361.7060546875, 603.3547973632812, - 6550.5341796875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100) then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good");
                        wait(1);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil");
                        wait(1);
                        Tween(CFrame.new(- 12361.7060546875, 603.3547973632812, - 6550.5341796875));
                        wait(1.5);
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                        wait(1.5);
                        Tween(CFrame.new(- 12253.5419921875, 598.8999633789062, - 6546.8388671875));
                    else
                        Tween(CFrame.new(- 12361.7060546875, 603.3547973632812, - 6550.5341796875));
                    end
                end
            end
        end);
    end
end);
spawn(function()
    while wait(0.05) do
        if Auto_Quest_Yama_1 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate") then
                    for v1052, v1053 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (v1053.Name == "Mythological Pirate") then
                            repeat
                                wait(0.05);
                                Tween(v1053.HumanoidRootPart.CFrame * CFrame.new(0, 0, - 2));
                            until (_G.Auto_DualKatana == false) or (Auto_Quest_Yama_1 == false)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil");
                        end
                    end
                else
                    Tween(CFrame.new(- 13451.46484375, 543.712890625, - 6961.0029296875));
                end
            end);
        end
    end
end);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if Auto_Quest_Yama_2 then
                for v858, v859 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v859:FindFirstChild("HazeESP") then
                        v859.HazeESP.Size = UDim2.new(50, 50, 50, 50);
                        v859.HazeESP.MaxDistance = "inf";
                    end
                end
                for v860, v861 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                    if v861:FindFirstChild("HazeESP") then
                        v861.HazeESP.Size = UDim2.new(50, 50, 50, 50);
                        v861.HazeESP.MaxDistance = "inf";
                    end
                end
            end
        end);
    end
end);
spawn(function()
    while wait(0.05) do
        pcall(function()
            for v731, v732 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if (Auto_Quest_Yama_2 and v732:FindFirstChild("HazeESP") and ((v732.HumanoidRootPart.Position - FarmPossEsp.Position).magnitude <= 300)) then
                    v732.HumanoidRootPart.CFrame = FarmPossEsp;
                    v732.HumanoidRootPart.CanCollide = false;
                    v732.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                    if not v732.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                        local v1058 = Instance.new("BodyVelocity", v732.HumanoidRootPart);
                        v1058.MaxForce = Vector3.new(1, 1, 1) * math.huge ;
                        v1058.Velocity = Vector3.new(0, 0, 0);
                    end
                end
            end
        end);
    end
end);
spawn(function()
    while wait(0.05) do
        if Auto_Quest_Yama_2 then
            pcall(function()
                for v865, v866 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v866:FindFirstChild("HazeESP") then
                        repeat
                            wait(0.05);
                            if ((v866.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000) then
                                Tween(v866.HumanoidRootPart.CFrame * Pos);
                            else
                                EquipTool(Sword);
                                Tween(v866.HumanoidRootPart.CFrame * Pos);
                                v866.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                v866.HumanoidRootPart.Transparency = 1;
                                v866.Humanoid.JumpPower = 0;
                                v866.Humanoid.WalkSpeed = 0;
                                v866.HumanoidRootPart.CanCollide = false;
                                FarmPos = v866.HumanoidRootPart.CFrame;
                                MonFarm = v866.Name;
                                AttackNoCoolDown();
                                if ((v866.Humanoid.Health <= 0) and v866.Humanoid:FindFirstChild("Animator")) then
                                    v866.Humanoid.Animator:Destroy();
                                end
                            end
                        until (_G.Auto_DualKatana == false) or (Auto_Quest_Yama_2 == false) or not v866.Parent or (v866.Humanoid.Health <= 0) or not v866:FindFirstChild("HazeESP")
                    else
                        for v1342, v1343 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                            if v1343:FindFirstChild("HazeESP") then
                                if ((v1343.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 2000) then
                                    Tween(v1343.HumanoidRootPart.CFrameMon * CFrame.new(2, 20, 2));
                                else
                                    Tween(v1343.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2));
                                end
                            end
                        end
                    end
                end
            end);
        end
    end
end);
spawn(function()
    while wait(0.05) do
        if Auto_Quest_Yama_3 then
            pcall(function()
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then
                    Tween(game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame);
                elseif game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                    repeat
                        wait(0.05);
                        if (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Hell's Messenger [Lv. 2200] [Boss]")) then
                            for v1641, v1642 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if ((v1642.Name == "Cursed Skeleton") or (v1642.Name == "Cursed Skeleton") or (v1642.Name == "Hell's Messenger")) then
                                    if (v1642.Humanoid.Health > 0) then
                                        repeat
                                            wait(0.05);
                                            EquipTool(Sword);
                                            Tween(v1642.HumanoidRootPart.CFrame * Pos);
                                            v1642.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                            v1642.HumanoidRootPart.Transparency = 1;
                                            v1642.Humanoid.JumpPower = 0;
                                            v1642.Humanoid.WalkSpeed = 0;
                                            v1642.HumanoidRootPart.CanCollide = false;
                                            FarmPos = v1642.HumanoidRootPart.CFrame;
                                            MonFarm = v1642.Name;
                                            AttackNoCoolDown();
                                            if ((v1642.Humanoid.Health <= 0) and v1642.Humanoid:FindFirstChild("Animator")) then
                                                v1642.Humanoid.Animator:Destroy();
                                            end
                                        until (v1642.Humanoid.Health <= 0) or not v1642.Parent or (Auto_Quest_Yama_3 == false)
                                    end
                                end
                            end
                        else
                            wait(5);
                            Tween(game:GetService("Workspace").Map.HellDimension.Torch1.CFrame);
                            wait(1.5);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                            wait(1.5);
                            Tweem(game:GetService("Workspace").Map.HellDimension.Torch2.CFrame);
                            wait(1.5);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                            wait(1.5);
                            Tween(game:GetService("Workspace").Map.HellDimension.Torch3.CFrame);
                            wait(1.5);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                            wait(1.5);
                            Tween(game:GetService("Workspace").Map.HellDimension.Exit.CFrame);
                        end
                    until (_G.Auto_DualKatana == false) or (Auto_Quest_Yama_3 == false) or (GetMaterial("Alucard Fragment") == 3)
                elseif (game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") or game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]")) then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                        for v1671, v1672 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1672.Name == "Soul Reaper") then
                                if (v1672.Humanoid.Health > 0) then
                                    repeat
                                        wait(0.05);
                                        Tween(v1672.HumanoidRootPart.CFrame * Pos);
                                    until (_G.Auto_DualKatana == false) or (Auto_Quest_Yama_3 == false) or game:GetService("Workspace").Map:FindFirstChild("HellDimension")
                                end
                            end
                        end
                    else
                        Tween(CFrame.new(- 9570.033203125, 315.9346923828125, 6726.89306640625));
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1);
                end
            end);
        end
    end
end);
spawn(function()
    while wait(0.05) do
        if Auto_Quest_Tushita_1 then
            Tween(CFrame.new(- 9546.990234375, 21.139892578125, 4686.1142578125));
            wait(5);
            Tween(CFrame.new(- 6120.0576171875, 16.455780029296875, - 2250.697265625));
            wait(5);
            Tween(CFrame.new(- 9533.2392578125, 7.254445552825928, - 8372.69921875));
        end
    end
end);
spawn(function()
    while wait(0.05) do
        if Auto_Quest_Tushita_2 then
            pcall(function()
                if ((CFrame.new(- 5539.3115234375, 313.800537109375, - 2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 500) then
                    for v1061, v1062 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (Auto_Quest_Tushita_2 and v1062:FindFirstChild("HumanoidRootPart") and v1062:FindFirstChild("Humanoid") and (v1062.Humanoid.Health > 0)) then
                            if ((v1062.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000) then
                                repeat
                                    wait(0.05);
                                    EquipTool(Sword);
                                    Tween(v1062.HumanoidRootPart.CFrame * Pos);
                                    v1062.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                    v1062.HumanoidRootPart.Transparency = 1;
                                    v1062.Humanoid.JumpPower = 0;
                                    v1062.Humanoid.WalkSpeed = 0;
                                    v1062.HumanoidRootPart.CanCollide = false;
                                    FarmPos = v1062.HumanoidRootPart.CFrame;
                                    MonFarm = v1062.Name;
                                    AttackNoCoolDown();
                                    if ((v1062.Humanoid.Health <= 0) and v1062.Humanoid:FindFirstChild("Animator")) then
                                        v1062.Humanoid.Animator:Destroy();
                                    end
                                until (v1062.Humanoid.Health <= 0) or not v1062.Parent or (Auto_Quest_Tushita_2 == false)
                            end
                        end
                    end
                else
                    Tween(CFrame.new(- 5545.1240234375, 313.800537109375, - 2976.616455078125));
                end
            end);
        end
    end
end);
spawn(function()
    while wait(0.05) do
        if Auto_Quest_Tushita_3 then
            pcall(function()
                if (game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") or game.ReplicatedStorage:FindFirstChild("Cake Queen [Lv. 2175] [Boss]")) then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                        for v1464, v1465 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1465.Name == "Cake Queen") then
                                if (v1465.Humanoid.Health > 0) then
                                    repeat
                                        wait(0.05);
                                        EquipTool(Sword);
                                        Tween(v1465.HumanoidRootPart.CFrame * Pos);
                                        v1465.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                        v1465.HumanoidRootPart.Transparency = 1;
                                        v1465.Humanoid.JumpPower = 0;
                                        v1465.Humanoid.WalkSpeed = 0;
                                        v1465.HumanoidRootPart.CanCollide = false;
                                        FarmPos = v1465.HumanoidRootPart.CFrame;
                                        MonFarm = v1465.Name;
                                        AttackNoCoolDown();
                                        if ((v1465.Humanoid.Health <= 0) and v1465.Humanoid:FindFirstChild("Animator")) then
                                            v1465.Humanoid.Animator:Destroy();
                                        end
                                    until (_G.Auto_DualKatana == false) or (Auto_Quest_Tushita_3 == false) or game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension")
                                end
                            end
                        end
                    else
                        Tween(CFrame.new(- 709.3132934570312, 381.6005859375, - 11011.396484375));
                    end
                elseif game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
                    repeat
                        wait(0.05);
                        if (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Heaven's Guardian [Lv. 2200] [Boss]")) then
                            for v1650, v1651 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if ((v1651.Name == "Cursed Skeleton") or (v1651.Name == "Cursed Skeleton") or (v1651.Name == "Heaven's Guardian")) then
                                    if (v1651.Humanoid.Health > 0) then
                                        repeat
                                            wait(0.05);
                                            EquipTool(Sword);
                                            Tween(v1651.HumanoidRootPart.CFrame * Pos);
                                            v1651.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                            v1651.HumanoidRootPart.Transparency = 1;
                                            v1651.Humanoid.JumpPower = 0;
                                            v1651.Humanoid.WalkSpeed = 0;
                                            v1651.HumanoidRootPart.CanCollide = false;
                                            FarmPos = v1651.HumanoidRootPart.CFrame;
                                            MonFarm = v1651.Name;
                                            AttackNoCoolDown();
                                            if ((v1651.Humanoid.Health <= 0) and v1651.Humanoid:FindFirstChild("Animator")) then
                                                v1651.Humanoid.Animator:Destroy();
                                            end
                                        until (v1651.Humanoid.Health <= 0) or not v1651.Parent or (Auto_Quest_Tushita_3 == false)
                                    end
                                end
                            end
                        else
                            wait(5);
                            Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch1.CFrame);
                            wait(1.5);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                            wait(1.5);
                            Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch2.CFrame);
                            wait(1.5);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                            wait(1.5);
                            Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch3.CFrame);
                            wait(1.5);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                            wait(1.5);
                            Tween(game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame);
                        end
                    until not _G.Auto_DualKatana or not Auto_Quest_Tushita_3 or (GetMaterial("Alucard Fragment") == 6)
                end
            end);
        end
    end
end);
if Sea2 then
    local v537 = v16.ITM:AddToggle("ToggleFactory", {
        Title = "Đấm Nhà Máy",
        Description = "",
        Default = Config.Factory
    });
    v537:OnChanged(function(v644)
        _G.Factory = v644;
        Config.Factory = v644;
        SaveConfig(Config)
    end);
    v17.ToggleFactory:SetValue(Config.Factory);
    spawn(function()
        while wait(0.05) do
            if _G.Factory then
                if game.Workspace.Enemies:FindFirstChild("Core") then
                    for v1344, v1345 in pairs(game.Workspace.Enemies:GetChildren()) do
                        if ((v1345.Name == "Core") and (v1345.Humanoid.Health > 0)) then
                            repeat
                                wait(_G.Fast_Delay);
                                AttackNoCoolDown();
                                repeat
                                    Tween(CFrame.new(448.46756, 199.356781, - 441.389252));
                                    wait(0.05);
                                until not _G.Factory or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, - 441.389252)).Magnitude <= 10)
                                EquipTool(_G.SelectWeapon);
                                AutoHaki();
                                Tween(v1345.HumanoidRootPart.CFrame * Pos);
                                v1345.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                v1345.HumanoidRootPart.Transparency = 1;
                                v1345.Humanoid.JumpPower = 0;
                                v1345.Humanoid.WalkSpeed = 0;
                                v1345.HumanoidRootPart.CanCollide = false;
                                FarmPos = v1345.HumanoidRootPart.CFrame;
                                MonFarm = v1345.Name;
                            until not v1345.Parent or (v1345.Humanoid.Health <= 0) or (_G.Factory == false)
                        end
                    end
                elseif game.ReplicatedStorage:FindFirstChild("Core") then
                    repeat
                        Tween(CFrame.new(448.46756, 199.356781, - 441.389252));
                        wait(0.05);
                    until not _G.Factory or ((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, - 441.389252)).Magnitude <= 10)
                end
            end
        end
    end);
end
local v83 = v16.ITM:AddToggle("ToggleAutoFarmSwan", {
    Title = "Đấm Swan",
    Description = "",
    Default = Config.Auto_FarmSwan
});
v83:OnChanged(function(v271)
    _G.Auto_FarmSwan = v271;
    Config.Auto_FarmSwan = v271;
    SaveConfig(Config)
end);
v17.ToggleAutoFarmSwan:SetValue(Config.Auto_FarmSwan);
spawn(function()
    pcall(function()
        while wait(0.05) do
            if _G.AutoFarmSwan then
                if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan") then
                    for v1063, v1064 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if ((v1064.Name == "Don Swan") and (v1064.Humanoid.Health > 0) and v1064:IsA("Model") and v1064:FindFirstChild("Humanoid") and v1064:FindFirstChild("HumanoidRootPart")) then
                            repeat
                                task.wait(0.05);
                                pcall(function()
                                    AutoHaki();
                                    EquipTool(_G.SelectWeapon);
                                    v1064.HumanoidRootPart.CanCollide = false;
                                    v1064.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                    Tween(v1064.HumanoidRootPart.CFrame * Pos);
                                    AttackNoCoolDown();
                                end);
                            until (_G.AutoFarmSwan == false) or (v1064.Humanoid.Health <= 0)
                        end
                    end
                else
                    repeat
                        task.wait(0.05);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.537666320801, 905.48291015625));
                    until ((CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4) or (_G.AutoFarmSwan == false)
                end
            end
        end
    end);
end);
local v84 = v16.ITM:AddToggle("ToggleAutoRengoku", {
    Title = "Rengoku",
    Description = "",
    Default = Config.Auto_Regoku
});
v84:OnChanged(function(v272)
    _G.Auto_Regoku = v272;
    Config.Auto_Regoku = v272;
    SaveConfig(Config)
end);
v17.ToggleAutoRengoku:SetValue(Config.Auto_Regoku);
spawn(function()
    pcall(function()
        while wait(0.05) do
            if _G.Auto_Regoku then
                if (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key")) then
                    EquipTool("Hidden Key");
                    Tween(CFrame.new(6571.1201171875, 299.23028564453, - 6967.841796875));
                elseif (game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior")) then
                    for v1466, v1467 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if (((v1467.Name == "Snow Lurker") or (v1467.Name == "Arctic Warrior")) and (v1467.Humanoid.Health > 0)) then
                            repeat
                                task.wait(_G.Fast_Delay);
                                EquipTool(_G.SelectWeapon);
                                AutoHaki();
                                v1467.HumanoidRootPart.CanCollide = false;
                                v1467.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                FarmPos = v1467.HumanoidRootPart.CFrame;
                                MonFarm = v1467.Name;
                                Tween(v1467.HumanoidRootPart.CFrame * Pos);
                                AttackNoCoolDown();
                                bringmob = true;
                            until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or (_G.Auto_Regoku == false) or not v1467.Parent or (v1467.Humanoid.Health <= 0)
                            bringmob = false;
                        end
                    end
                else
                    bringmob = false;
                    Tween(CFrame.new(5439.716796875, 84.420944213867, - 6715.1635742188));
                end
            end
        end
    end);
end);
if (Sea2 or Sea3) then
    local v538 = v16.ITM:AddToggle("ToggleHakiColor", {
        Title = "Mua Màu Haki",
        Description = "",
        Default = Config.Auto_Buy_Enchancement
    });
    v538:OnChanged(function(v645)
        _G.Auto_Buy_Enchancement = v645;
        Config.Auto_Buy_Enchancement = v645;
        SaveConfig(Config)
    end);
    v17.ToggleHakiColor:SetValue(Config.Auto_Buy_Enchancement);
    spawn(function()
        while wait(0.05) do
            if _G.Auto_Buy_Enchancement then
                local v867 = {
                    [1] = "ColorsDealer",
                    [2] = "2"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v867));
            end
        end
    end);
end
if Sea2 then
    local v539 = v16.Main:AddToggle("ToggleSwordLengend", {
        Title = "Mua Kiếm Huyền Thoại",
        Description = "",
        Default = Config.BuyLengendSword
    });
    v539:OnChanged(function(v646)
        _G.BuyLengendSword = v646;
        Config.BuyLengendSword = v646;
        SaveConfig(Config)
    end);
    v17.ToggleSwordLengend:SetValue(Config.BuyLengendSword);
    spawn(function()
        while wait(0.05) do
            pcall(function()
                if (_G.BuyLengendSword or Triple_A) then
                    local v897 = {
                        [1] = "LegendarySwordDealer",
                        [2] = "2"
                    };
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v897));
                else
                    wait(0.05);
                end
            end);
        end
    end);
end
if Sea2 then
    local v540 = v16.Main:AddToggle("ToggleEvoRace", {
        Title = "Nâng Tộc V2",
        Description = "",
        Default = Config.AutoEvoRace
    });
    v540:OnChanged(function(v647)
        _G.AutoEvoRace = v647;
        Config.AutoEvoRace = v647;
        SaveConfig(Config)
    end);
    v17.ToggleEvoRace:SetValue(Config.AutoEvoRace);
    spawn(function()
        pcall(function()
            while wait(0.1) do
                if _G.AutoEvoRace then
                    if not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                        if (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 0) then
                            Tween(CFrame.new(- 2779.83521, 72.9661407, - 3574.02002, - 0.730484903, 6.390141e-8, - 0.68292886, 3.5996322e-8, 1, 5.5066703e-8, 0.68292886, 1.5642467e-8, - 0.730484903));
                            if ((Vector3.new(- 2779.83521, 72.9661407, - 3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4) then
                                wait(1.3);
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2");
                            end
                        elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 1) then
                            pcall(function()
                                if (not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1")) then
                                    Tween(game:GetService("Workspace").Flower1.CFrame);
                                elseif (not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2")) then
                                    Tween(game:GetService("Workspace").Flower2.CFrame);
                                elseif (not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") and not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3")) then
                                    if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
                                        for v1834, v1835 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                            if (v1835.Name == "Zombie") then
                                                repeat
                                                    task.wait(_G.Fast_Delay);
                                                    AutoHaki();
                                                    EquipTool(_G.SelectWeapon);
                                                    Tween(v1835.HumanoidRootPart.CFrame * Pos);
                                                    v1835.HumanoidRootPart.CanCollide = false;
                                                    v1835.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                                    AttackNoCoolDown();
                                                    FarmPos = v1835.HumanoidRootPart.CFrame;
                                                    MonFarm = v1835.Name;
                                                    bringmob = true;
                                                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or not v1835.Parent or (v1835.Humanoid.Health <= 0) or (_G.AutoEvoRace == false)
                                                bringmob = false;
                                            end
                                        end
                                    else
                                        Tween(CFrame.new(- 5685.9233398438, 48.480125427246, - 853.23724365234));
                                    end
                                end
                            end);
                        elseif (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 2) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3");
                        end
                    end
                end
            end
        end);
    end);
end
local v85 = v16.Setting:AddToggle("ToggleAutoT", {
    Title = "Bật Tộc V3",
    Description = "",
    Default = Config.AutoT
});
v85:OnChanged(function(v273)
    _G.AutoT = v273;
    Config.AutoT = v273;
    SaveConfig(Config)
end);
v17.ToggleAutoT:SetValue(Config.AutoT);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if _G.AutoT then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility");
            end
        end);
    end
end);
local v86 = v16.Setting:AddToggle("ToggleAutoY", {
    Title = "Bật Tộc V4",
    Description = "",
    Default = Config.AutoY
});
v86:OnChanged(function(v274)
    _G.AutoY = v274;
    Config.AutoY = v274;
    SaveConfig(Config)
end);
v17.ToggleAutoY:SetValue(Config.AutoY);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if _G.AutoY then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game);
                wait(0.05);
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game);
            end
        end);
    end
end);
local v87 = v16.Setting:AddToggle("ToggleAutoKen", {
    Title = "Bật Haki Quan Sât",
    Description = "",
    Default = Config.AutoKen
});
v87:OnChanged(function(v275)
    _G.AutoKen = v275;
    Config.AutoKen = v275;
    SaveConfig(Config)
    if v275 then
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true);
    else
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", false);
    end
end);
v17.ToggleAutoKen:SetValue(Config.AutoKen);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if _G.AutoKen then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true);
            end
        end);
    end
end);
local v88 = v16.Setting:AddToggle("ToggleSaveSpawn", {
    Title = "Lưu Điểm Hồi Sinh",
    Description = "",
    Default = Config.SaveSpawn
});
v88:OnChanged(function(v276)
    _G.SaveSpawn = v276;
    Config.SaveSpawn = v276;
    SaveConfig(Config)
    if v276 then
        local v648 = {
            [1] = "SetSpawnPoint"
        };
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v648));
    end
end);
v17.ToggleSaveSpawn:SetValue(Config.SaveSpawn);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if _G.SaveSpawn then
                local v797 = {
                    [1] = "SetSpawnPoint"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v797));
            end
        end);
    end
end);
local v90 = v16.Setting:AddToggle("ToggleBringMob", {
    Title = "Gom Quái",
    Description = "",
    Default = Config.BringMob
});
v90:OnChanged(function(v277)
    _G.BringMob = v277;
    Config.BringMob = v277;
    SaveConfig(Config)
end);
v17.ToggleBringMob:SetValue(Config.BringMob);
spawn(function()
    while wait(0.05) do
        pcall(function()
            for v733, v734 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if (_G.BringMob and bringmob) then
                    if ((v734.Name == MonFarm) and v734:FindFirstChild("Humanoid") and (v734.Humanoid.Health > 0)) then
                        if (v734.Name == "Factory Staff") then
                            if ((v734.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 1000000000) then
                                v734.Head.CanCollide = false;
                                v734.HumanoidRootPart.CanCollide = false;
                                v734.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                v734.HumanoidRootPart.CFrame = FarmPos;
                                if v734.Humanoid:FindFirstChild("Animator") then
                                    v734.Humanoid.Animator:Destroy();
                                end
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
                            end
                        elseif (v734.Name == MonFarm) then
                            if ((v734.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 1000000000) then
                                v734.HumanoidRootPart.CFrame = FarmPos;
                                v734.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                v734.HumanoidRootPart.Transparency = 1;
                                v734.Humanoid.JumpPower = 0;
                                v734.Humanoid.WalkSpeed = 0;
                                if v734.Humanoid:FindFirstChild("Animator") then
                                    v734.Humanoid.Animator:Destroy();
                                end
                                v734.HumanoidRootPart.CanCollide = false;
                                v734.Head.CanCollide = false;
                                v734.Humanoid:ChangeState(11);
                                v734.Humanoid:ChangeState(14);
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
                            end
                        end
                    end
                end
            end
        end);
    end
end);
local v91 = v16.Setting:AddToggle("ToggleRemoveNotify", {
    Title = "Xóa Thông Báo",
    Description = "",
    Default = Config.RemoveNotify
});
v91:OnChanged(function(v278)
    _G.RemoveNotify = v278;
    Config.RemoveNotify = v278;
    SaveConfig(Config)
end);
v17.ToggleRemoveNotify:SetValue(Config.RemoveNotify);
spawn(function()
    while wait(0.05) do
        if _G.RemoveNotify then
            game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false;
        else
            game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true;
        end
    end
end);
local v92 = v16.Setting:AddToggle("ToggleWhite", {
    Title = "Màn Hình Trắng",
    Description = "",
    Default = Config.WhiteScreen
});
v92:OnChanged(function(v279)
    _G.WhiteScreen = v279;
    Config.WhiteScreen = v279;
    SaveConfig(Config)
    if (_G.WhiteScreen == true) then
        game:GetService("RunService"):Set3dRenderingEnabled(false);
    elseif (_G.WhiteScreen == false) then
        game:GetService("RunService"):Set3dRenderingEnabled(true);
    end
end);
v17.ToggleWhite:SetValue(Config.WhiteScreen);
local v93 = v16.Setting:AddSection("Kĩ Năng Thông Thạo");
local v94 = v16.Setting:AddToggle("ToggleZ", {
    Title = "Kĩ Năng Z",
    Description = "",
    Default = Config.SkillZ
});
v94:OnChanged(function(v280)
    _G.SkillZ = v280;
    Config.SkillZ = v280;
    SaveConfig(Config)
end);
v17.ToggleZ:SetValue(Config.SkillZ);
local v95 = v16.Setting:AddToggle("ToggleX", {
    Title = "Kĩ Năng X",
    Description = "",
    Default = Config.SkillX
});
v95:OnChanged(function(v281)
    _G.SkillX = v281;
    Config.SkillX = v281;
    SaveConfig(Config)
end);
v17.ToggleX:SetValue(Config.SkillX);
local v96 = v16.Setting:AddToggle("ToggleC", {
    Title = "Kĩ Năng C",
    Description = "",
    Default = Config.SkillC
});
v96:OnChanged(function(v282)
    _G.SkillC = v282;
    Config.SkillC = v282;
    SaveConfig(Config)
end);
v17.ToggleC:SetValue(Config.SkillC);
local v97 = v16.Setting:AddToggle("ToggleV", {
    Title = "Kĩ Năng V",
    Description = "",
    Default = Config.SkillV
});
v97:OnChanged(function(v283)
    _G.SkillV = v283;
    Config.SkillV = v283;
    SaveConfig(Config)
end);
v17.ToggleV:SetValue(Config.SkillV);
local v98 = v16.Setting:AddToggle("ToggleF", {
    Title = "Kĩ Năng F",
    Description = "",
    Default = Config.SkillF
});
v98:OnChanged(function(v284)
    _G.SkillF = v284;
    Config.SkillF = v284;
    SaveConfig(Config)
end);
v17.ToggleF:SetValue(Config.SkillF);
local v99 = v16.Status:AddParagraph({
    Title = "Thông Tin",
    Content = "━━━━━━━━━━━━━━━━━━━━━\n" .. "Tên : " .. game.Players.LocalPlayer.DisplayName .. " (@" .. game.Players.LocalPlayer.Name .. ")\n" .. "Cấp : " .. game:GetService("Players").LocalPlayer.Data.Level.Value .. "\n" .. "Tiền : " .. game:GetService("Players").LocalPlayer.Data.Beli.Value .. "\n" .. "Điểm F : " .. game:GetService("Players").LocalPlayer.Data.Fragments.Value .. "\n" .. "Tiền Truy Nã : " .. game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value or "None" .. "\n" .. "Máu: " .. game.Players.LocalPlayer.Character.Humanoid.Health .. "/" .. game.Players.LocalPlayer.Character.Humanoid.MaxHealth .. "\n" .. "Năng Lượng : " .. game.Players.LocalPlayer.Character.Energy.Value .. "/" .. game.Players.LocalPlayer.Character.Energy.MaxValue .. "\n" .. "Tộc : " .. game:GetService("Players").LocalPlayer.Data.Race.Value .. "\n" .. "Trái : " .. game:GetService("Players").LocalPlayer.Data.DevilFruit.Value .. "\n" .. "━━━━━━━━━━━━━━━━━━━━━"
});
local v100 = v16.Status:AddParagraph({
    Title = "Thời Gian",
    Content = ""
});
local function v101()
    local v285 = os.date("*t");
    local v286 = v285.hour % 24 ;
    local v287 = ((v286 < 12) and "AM") or "PM" ;
    local v288 = string.format("%02i:%02i:%02i %s", ((v286 - 1) % 12) + 1, v285.min, v285.sec, v287);
    local v289 = string.format("%02d/%02d/%04d", v285.day, v285.month, v285.year);
    local v290 = game:GetService("LocalizationService");
    local v291 = game:GetService("Players");
    local v292 = v291.LocalPlayer;
    local v293 = v292.Name;
    local v294 = "Unknown";
    local v295, v296 = pcall(function()
        return v290:GetCountryRegionForPlayerAsync(v292);
    end);
    if v295 then
        v294 = v296;
    end
    v100:SetDesc(v289 .. "-" .. v288 .. " [ " .. v294 .. " ]");
end
spawn(function()
    while true do
        v101();
        game:GetService("RunService").RenderStepped:wait(0.05);
    end
end);
local v102 = v16.Status:AddParagraph({
    Title = "Thời Gian Máy Chủ",
    Content = ""
});
local function v103()
    local v297 = math.floor(workspace.DistributedGameTime + 0.5);
    local v298 = math.floor(v297 / (60 ^ 2)) % 24 ;
    local v299 = math.floor(v297 / 60) % 60 ;
    local v300 = v297 % 60 ;
    v102:SetDesc(string.format("%02d Tiếng-%02d Phút-%02d Giây", v298, v299, v300));
end
spawn(function()
    while task.wait(0.05) do
        pcall(v103);
    end
end);
local v104 = v16.Status:AddParagraph({
    Title = "Đảo Leviathan",
    Content = ""
});
spawn(function()
    pcall(function()
        while wait(0.05) do
            if game:GetService("Workspace").Map:FindFirstChild("FrozenDimension") then
                v104:SetDesc("✅");
            else
                v104:SetDesc("❌");
            end
        end
    end);
end);
local v105 = v16.Status:AddInput("Input", {
    Title = "Job ID",
    Default = Config.Job or "",
    Placeholder = "Dán Job ID Vào Đây",
    Numeric = false,
    Finished = false,
    Callback = function(v301)
        _G.Job = v301;
        Config.Job = v301;
    end
});
v16.Status:AddButton({
    Title = "Bắt Đầu Tham Gia Job ID",
    Description = "",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer);
    end
});
v16.Status:AddButton({
    Title = "Sao Chép Job ID",
    Description = "",
    Callback = function()
        setclipboard(tostring(game.JobId));
    end
});
local v106 = v16.Status:AddToggle("MyToggle", {
    Title = "Spam Tham Gia Job ID",
    Default = Config.Join
});
v106:OnChanged(function(v302)
    _G.Join = v302;
    Config.Join = v302;
    SaveConfig(Config)
end);
spawn(function()
    while wait(0.05) do
        if _G.Join then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer);
        end
    end
end);
local v107 = v16.Stats:AddToggle("ToggleMelee", {
    Title = "Nâng Đấm",
    Description = "",
    Default = Config.Auto_Stats_Melee
});
v107:OnChanged(function(v303)
    _G.Auto_Stats_Melee = v303;
    Config.Auto_Stats_Melee = v303;
    SaveConfig(Config)
end);
print(Config.Auto_Stats_Melee)
v17.ToggleMelee:SetValue(Config.Auto_Stats_Melee);
local v108 = v16.Stats:AddToggle("ToggleDe", {
    Title = "Nâng Máu",
    Description = "",
    Default = Config.Auto_Stats_Defense
});
v108:OnChanged(function(v304)
    _G.Auto_Stats_Defense = v304;
    Config.Auto_Stats_Defense = v304;
    SaveConfig(Config)
end);
v17.ToggleDe:SetValue(Config.Auto_Stats_Defense);
local v109 = v16.Stats:AddToggle("ToggleSword", {
    Title = "Nâng Kiếm",
    Description = "",
    Default = Config.Auto_Stats_Sword
});
v109:OnChanged(function(v305)
    _G.Auto_Stats_Sword = v305;
    Config.Auto_Stats_Sword = v305;
    SaveConfig(Config)
end);
v17.ToggleSword:SetValue(Config.Auto_Stats_Sword);
local v110 = v16.Stats:AddToggle("ToggleGun", {
    Title = "Nâng Súng",
    Description = "",
    Default = Config.Auto_Stats_Gun
});
v110:OnChanged(function(v306)
    _G.Auto_Stats_Gun = v306;
    Config.Auto_Stats_Gun = v306;
    SaveConfig(Config)
end);
v17.ToggleGun:SetValue(Config.Auto_Stats_Gun);
local v111 = v16.Stats:AddToggle("ToggleFruit", {
    Title = "Nâng Trái",
    Description = "",
    Default = Config.Auto_Stats_Devil_Fruit
});
v111:OnChanged(function(v307)
    _G.Auto_Stats_Devil_Fruit = v307;
    Config.Auto_Stats_Devil_Fruit = v307;
    SaveConfig(Config)
end);
v17.ToggleFruit:SetValue(Config.Auto_Stats_Devil_Fruit);
spawn(function()
    while wait(0.05) do
        if _G.Auto_Stats_Devil_Fruit then
            local v737 = {
                [1] = "AddPoint",
                [2] = "Demon Fruit",
                [3] = 3
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v737));
        end
    end
end);
spawn(function()
    while wait(0.05) do
        if _G.Auto_Stats_Gun then
            local v738 = {
                [1] = "AddPoint",
                [2] = "Gun",
                [3] = 3
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v738));
        end
    end
end);
spawn(function()
    while wait(0.05) do
        if _G.Auto_Stats_Sword then
            local v739 = {
                [1] = "AddPoint",
                [2] = "Sword",
                [3] = 3
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v739));
        end
    end
end);
spawn(function()
    while wait(0.05) do
        if _G.Auto_Stats_Defense then
            local v740 = {
                [1] = "AddPoint",
                [2] = "Defense",
                [3] = 3
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v740));
        end
    end
end);
spawn(function()
    while wait(0.05) do
        if _G.Auto_Stats_Melee then
            local v741 = {
                [1] = "AddPoint",
                [2] = "Melee",
                [3] = 3
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v741));
        end
    end
end);
local v112 = {};
for v308, v309 in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(v112, v309.Name);
end
local v113 = v16.Player:AddDropdown("SelectedPly", {
    Title = "Chọn Người Chơi",
    Description = "",
    Values = v112,
    Multi = false,
    Default = Config.SelectPly
});
v113:SetValue(Config.SelectPly);
v113:OnChanged(function(v310)
    _G.SelectPly = v310;
    Config.SelectPly = v310;
    SaveConfig(Config)
end);
v16.Player:AddButton({
    Title = "Tải Lại Người Chơi",
    Description = "",
    Callback = function()
        table.clear(v112);
        for v541, v542 in pairs(game:GetService("Players"):GetChildren()) do
            table.insert(v112, v542.Name);
        end
    end
});
local v114 = v16.Player:AddToggle("ToggleTeleport", {
    Title = "Bay Đến Người Chơi",
    Description = "",
    Default = Config.TeleportPly
});
v114:OnChanged(function(v311)
    _G.TeleportPly = v311;
    Config.TeleportPly = v311;
    SaveConfig(Config)
    if (v311 == false) then
        wait(0.05);
        AutoHaki();
        Tween2(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame);
        wait(0.05);
    end
end);
v17.ToggleTeleport:SetValue(false);
spawn(function()
    while wait(0.05) do
        if _G.TeleportPly then
            pcall(function()
                if game.Players:FindFirstChild(_G.SelectPly) then
                    Tween2(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame);
                end
            end);
        end
    end
end);
local v56 = v16.Player:AddSection("Khác");
local v115 = v16.Player:AddToggle("ToggleNoClip", {
    Title = "Đi Xuyên Tường",
    Description = "",
    Default = Config.LOf
});
v115:OnChanged(function(v312)
    _G.LOf = v312;
    Config.LOf = v312;
    SaveConfig(Config)
end);
v17.ToggleNoClip:SetValue(Config.LOf);
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.LOf then
                for v868, v869 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v869:IsA("BasePart") then
                        v869.CanCollide = false;
                    end
                end
            end
        end);
    end);
end);
local v116 = v16.Player:AddToggle("ToggleWalkonWater", {
    Title = "Đi Trên Nước",
    Description = "",
    Default = Config.WalkonWater
});
v116:OnChanged(function(v313)
    _G.WalkonWater = v313;
    Config.WalkonWater = v313;
    SaveConfig(Config)
end);
v17.ToggleWalkonWater:SetValue(true);
spawn(function()
    while task.wait(0.05) do
        pcall(function()
            if _G.WalkonWater then
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000);
            else
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000);
            end
        end);
    end
end);
local v117 = v16.Player:AddToggle("ToggleEnablePvp", {
    Title = "Bật PVP",
    Description = "",
    Default = Config.EnabledPvP
});
v117:OnChanged(function(v314)
    _G.EnabledPvP = v314;
    Config.EnabledPvP = v314;
    SaveConfig(Config)
end);
v17.ToggleEnablePvp:SetValue(Config.EnabledPvP);
spawn(function()
    pcall(function()
        while wait(0.05) do
            if _G.EnabledPvP then
                if (game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp");
                end
            end
        end
    end);
end);
local v118 = v16.Teleport:AddSection("Thế Giới");
local v119 = v16.Teleport:AddToggle("ToggleAutoSea2", {
    Title = "Nhiệm Vụ Qua Biển 2",
    Description = "",
    Default = Config.Auto_Sea2
});
v119:OnChanged(function(v315)
    _G.Auto_Sea2 = v315;
    Config.Auto_Sea2 = v315;
    SaveConfig(Config)
end);
v17.ToggleAutoSea2:SetValue(Config.Auto_Sea2);
spawn(function()
    while wait(0.05) do
        if _G.Auto_Sea2 then
            pcall(function()
                local v800 = game:GetService("Players").LocalPlayer.Data.Level.Value;
                if ((v800 >= 700) and World1) then
                    if ((game:GetService("Workspace").Map.Ice.Door.CanCollide == false) and (game:GetService("Workspace").Map.Ice.Door.Transparency == 1)) then
                        local v1346 = CFrame.new(4849.29883, 5.65138149, 719.611877);
                        repeat
                            Tween(v1346);
                            wait(0.05);
                        until ((v1346.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) or (_G.Auto_Sea2 == false)
                        wait(1.1);
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective");
                        wait(0.5);
                        EquipTool("Key");
                        repeat
                            Tween(CFrame.new(1347.7124, 37.3751602, - 1325.6488));
                            wait(0.05);
                        until ((Vector3.new(1347.7124, 37.3751602, - 1325.6488) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3) or (_G.Auto_Sea2 == false)
                        wait(0.5);
                    elseif ((game:GetService("Workspace").Map.Ice.Door.CanCollide == false) and (game:GetService("Workspace").Map.Ice.Door.Transparency == 1)) then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then
                            for v1680, v1681 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v1681.Name == "Ice Admiral") then
                                    if (not v1681.Humanoid.Health <= 0) then
                                        if (v1681:FindFirstChild("Humanoid") and v1681:FindFirstChild("HumanoidRootPart") and (v1681.Humanoid.Health > 0)) then
                                            OldCFrameSecond = v1681.HumanoidRootPart.CFrame;
                                            repeat
                                                task.wait(_G.Fast_Delay);
                                                AutoHaki();
                                                EquipTool(_G.SelectWeapon);
                                                v1681.HumanoidRootPart.CanCollide = false;
                                                v1681.Humanoid.WalkSpeed = 0;
                                                v1681.Head.CanCollide = false;
                                                v1681.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                                v1681.HumanoidRootPart.CFrame = OldCFrameSecond;
                                                Tween(v1681.HumanoidRootPart.CFrame * Pos);
                                                AttackNoCoolDown();
                                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
                                            until not _G.Auto_Sea2 or not v1681.Parent or (v1681.Humanoid.Health <= 0)
                                        end
                                    else
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa");
                                    end
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral") then
                            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral").HumanoidRootPart.CFrame * CFrame.new(5, 10, 7));
                        end
                    end
                end
            end);
        end
    end
end);
local v120 = v16.Teleport:AddToggle("ToggleAutoSea3", {
    Title = "Nhiệm Vụ Qua Biển 3",
    Description = "",
    Default = Config.Auto_Sea3
});
v120:OnChanged(function(v316)
    _G.Auto_Sea3 = v316;
    Config.Auto_Sea3 = v316;
    SaveConfig(Config)
end);
v17.ToggleAutoSea3:SetValue(Config.Auto_Sea3);
spawn(function()
    while wait(0.05) do
        if _G.AutoSea3 then
            pcall(function()
                if ((game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500) and World2) then
                    _G.AutoLevel = false;
                    if (game:GetService("ReplicatedStorage").Remotes['CommF_']:InvokeServer("ZQuestProgress", "General") == 0) then
                        Tween(CFrame.new(- 1926.3221435547, 12.819851875305, 1738.3092041016));
                        if ((CFrame.new(- 1926.3221435547, 12.819851875305, 1738.3092041016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10) then
                            wait(1.5);
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin");
                        end
                        wait(1.8);
                        if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                            for v1578, v1579 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if (v1579.Name == "rip_indra") then
                                    OldCFrameThird = v1579.HumanoidRootPart.CFrame;
                                    repeat
                                        task.wait(_G.Fast_Delay);
                                        AutoHaki();
                                        EquipTool(_G.SelectWeapon);
                                        Tween(v1579.HumanoidRootPart.CFrame * Pos);
                                        v1579.HumanoidRootPart.CFrame = OldCFrameThird;
                                        v1579.HumanoidRootPart.Size = Vector3.new(50, 50, 50);
                                        v1579.HumanoidRootPart.CanCollide = false;
                                        v1579.Humanoid.WalkSpeed = 0;
                                        AttackNoCoolDown();
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou");
                                    until (_G.AutoSea3 == false) or (v1579.Humanoid.Health <= 0) or not v1579.Parent
                                end
                            end
                        elseif (not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") and ((CFrame.new(- 26880.93359375, 22.848554611206, 473.18951416016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000)) then
                            Tween(CFrame.new(- 26880.93359375, 22.848554611206, 473.18951416016));
                        end
                    end
                end
            end);
        end
    end
end);
v16.Teleport:AddButton({
    Title = "Biến 1",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain");
    end
});
v16.Teleport:AddButton({
    Title = "Biến 2",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa");
    end
});
v16.Teleport:AddButton({
    Title = "Biển 3",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou");
    end
});
local v56 = v16.Teleport:AddSection("Đảo");
if Sea1 then
    IslandList = {
        "WindMill",
        "Marine",
        "Middle Town",
        "Jungle",
        "Pirate Village",
        "Desert",
        "Snow Island",
        "MarineFord",
        "Colosseum",
        "Sky Island 1",
        "Sky Island 2",
        "Sky Island 3",
        "Prison",
        "Magma Village",
        "Under Water Island",
        "Fountain City",
        "Shank Room",
        "Mob Island"
    };
elseif Sea2 then
    IslandList = {
        "The Cafe",
        "Frist Spot",
        "Dark Area",
        "Flamingo Mansion",
        "Flamingo Room",
        "Green Zone",
        "Factory",
        "Colossuim",
        "Zombie Island",
        "Two Snow Mountain",
        "Punk Hazard",
        "Cursed Ship",
        "Ice Castle",
        "Forgotten Island",
        "Ussop Island",
        "Mini Sky Island"
    };
elseif Sea3 then
    IslandList = {
        "Mansion",
        "Port Town",
        "Great Tree",
        "Castle On The Sea",
        "MiniSky",
        "Hydra Island",
        "Floating Turtle",
        "Haunted Castle",
        "Ice Cream Island",
        "Peanut Island",
        "Cake Island",
        "Cocoa Island",
        "Candy Island",
        "Tiki Outpost"
    };
end
local v121 = v16.Teleport:AddDropdown("DropdownIsland", {
    Title = "Chọn Đảo",
    Description = "",
    Values = IslandList,
    Multi = false,
    Default = Config.SelectIsland
});
v121:SetValue(Config.SelectIsland);
v121:OnChanged(function(v317)
    _G.SelectIsland = v317;
    Config.SelectIsland = v317;
    SaveConfig(Config)
end);
v16.Teleport:AddButton({
    Title = "Bay Đến Đảo",
    Description = "",
    Callback = function()
        if (_G.SelectIsland == "WindMill") then
            Tween2(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594));
        elseif (_G.SelectIsland == "Marine") then
            Tween2(CFrame.new(- 2566.4296875, 6.8556680679321, 2045.2561035156));
        elseif (_G.SelectIsland == "Middle Town") then
            Tween2(CFrame.new(- 690.33081054688, 15.09425163269, 1582.2380371094));
        elseif (_G.SelectIsland == "Jungle") then
            Tween2(CFrame.new(- 1612.7957763672, 36.852081298828, 149.12843322754));
        elseif (_G.SelectIsland == "Pirate Village") then
            Tween2(CFrame.new(- 1181.3093261719, 4.7514905929565, 3803.5456542969));
        elseif (_G.SelectIsland == "Desert") then
            Tween2(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688));
        elseif (_G.SelectIsland == "Snow Island") then
            Tween2(CFrame.new(1347.8067626953, 104.66806030273, - 1319.7370605469));
        elseif (_G.SelectIsland == "MarineFord") then
            Tween2(CFrame.new(- 4914.8212890625, 50.963626861572, 4281.0278320313));
        elseif (_G.SelectIsland == "Colosseum") then
            Tween2(CFrame.new(- 1427.6203613281, 7.2881078720093, - 2792.7722167969));
        elseif (_G.SelectIsland == "Sky Island 1") then
            Tween2(CFrame.new(- 4869.1025390625, 733.46051025391, - 2667.0180664063));
        elseif (_G.SelectIsland == "Sky Island 2") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.82275, 872.54248, - 1667.55688));
        elseif (_G.SelectIsland == "Sky Island 3") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047));
        elseif (_G.SelectIsland == "Prison") then
            Tween2(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656));
        elseif (_G.SelectIsland == "Magma Village") then
            Tween2(CFrame.new(- 5247.7163085938, 12.883934020996, 8504.96875));
        elseif (_G.SelectIsland == "Under Water Island") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875));
        elseif (_G.SelectIsland == "Fountain City") then
            Tween2(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813));
        elseif (_G.SelectIsland == "Shank Room") then
            Tween2(CFrame.new(- 1442.16553, 29.8788261, - 28.3547478));
        elseif (_G.SelectIsland == "Mob Island") then
            Tween2(CFrame.new(- 2850.20068, 7.39224768, 5354.99268));
        elseif (_G.SelectIsland == "The Cafe") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 281.93707275390625, 306.130615234375, 609.280029296875));
            wait(0.05);
            Tween2(CFrame.new(- 380.47927856445, 77.220390319824, 255.82550048828));
        elseif (_G.SelectIsland == "Frist Spot") then
            Tween2(CFrame.new(- 11.311455726624, 29.276733398438, 2771.5224609375));
        elseif (_G.SelectIsland == "Dark Area") then
            Tween2(CFrame.new(3780.0302734375, 22.652164459229, - 3498.5859375));
        elseif (_G.SelectIsland == "Flamingo Mansion") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 281.93707275390625, 306.130615234375, 609.280029296875));
        elseif (_G.SelectIsland == "Flamingo Room") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.152034759521484, 905.48291015625));
        elseif (_G.SelectIsland == "Green Zone") then
            Tween2(CFrame.new(- 2448.5300292969, 73.016105651855, - 3210.6306152344));
        elseif (_G.SelectIsland == "Factory") then
            Tween2(CFrame.new(424.12698364258, 211.16171264648, - 427.54049682617));
        elseif (_G.SelectIsland == "Colossuim") then
            Tween2(CFrame.new(- 1503.6224365234, 219.7956237793, 1369.3101806641));
        elseif (_G.SelectIsland == "Zombie Island") then
            Tween2(CFrame.new(- 5622.033203125, 492.19604492188, - 781.78552246094));
        elseif (_G.SelectIsland == "Two Snow Mountain") then
            Tween2(CFrame.new(753.14288330078, 408.23559570313, - 5274.6147460938));
        elseif (_G.SelectIsland == "Punk Hazard") then
            Tween2(CFrame.new(- 6127.654296875, 15.951762199402, - 5040.2861328125));
        elseif (_G.SelectIsland == "Cursed Ship") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.40197753906, 125.05712890625, 32885.875));
        elseif (_G.SelectIsland == "Ice Castle") then
            Tween2(CFrame.new(6148.4116210938, 294.38687133789, - 6741.1166992188));
        elseif (_G.SelectIsland == "Forgotten Island") then
            Tween2(CFrame.new(- 3032.7641601563, 317.89672851563, - 10075.373046875));
        elseif (_G.SelectIsland == "Ussop Island") then
            Tween2(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781));
        elseif (_G.SelectIsland == "Mini Sky Island") then
            Tween2(CFrame.new(- 288.74060058594, 49326.31640625, - 35248.59375));
        elseif (_G.SelectIsland == "Great Tree") then
            Tween2(CFrame.new(2681.2736816406, 1682.8092041016, - 7190.9853515625));
        elseif (_G.SelectIsland == "Castle On The Sea") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375));
        elseif (_G.SelectIsland == "MiniSky") then
            Tween2(CFrame.new(- 260.65557861328, 49325.8046875, - 35253.5703125));
        elseif (_G.SelectIsland == "Port Town") then
            Tween2(CFrame.new(- 290.7376708984375, 6.729952812194824, 5343.5537109375));
        elseif (_G.SelectIsland == "Hydra Island") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906));
        elseif (_G.SelectIsland == "Floating Turtle") then
            Tween2(CFrame.new(- 13274.528320313, 531.82073974609, - 7579.22265625));
        elseif (_G.SelectIsland == "Mansion") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 12468.5380859375, 375.0094299316406, - 7554.62548828125));
        elseif (_G.SelectIsland == "Castle On The Sea") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375));
        elseif (_G.SelectIsland == "Haunted Castle") then
            Tween2(CFrame.new(- 9515.3720703125, 164.00624084473, 5786.0610351562));
        elseif (_G.SelectIsland == "Ice Cream Island") then
            Tween2(CFrame.new(- 902.56817626953, 79.93204498291, - 10988.84765625));
        elseif (_G.SelectIsland == "Peanut Island") then
            Tween2(CFrame.new(- 2062.7475585938, 50.473892211914, - 10232.568359375));
        elseif (_G.SelectIsland == "Cake Island") then
            Tween2(CFrame.new(- 1884.7747802734375, 19.327526092529297, - 11666.8974609375));
        elseif (_G.SelectIsland == "Cocoa Island") then
            Tween2(CFrame.new(87.94276428222656, 73.55451202392578, - 12319.46484375));
        elseif (_G.SelectIsland == "Candy Island") then
            Tween2(CFrame.new(- 1014.4241943359375, 149.11068725585938, - 14555.962890625));
        elseif (_G.SelectIsland == "Tiki Outpost") then
            Tween2(CFrame.new(- 16542.447265625, 55.68632888793945, 1044.41650390625));
        end
    end
});
v16.Teleport:AddButton({
    Title = "Dừng Bay",
    Description = "",
    Callback = function()
        CancelTween();
    end
});
v16.Visual:AddButton({
    Title = "Giả",
    Description = "",
    Callback = function()
        local v318 = game:GetService("Players").LocalPlayer;
        local v319 = require(game:GetService("ReplicatedStorage").Notification);
        local v320 = v318:WaitForChild("Data");
        local v321 = require(game.ReplicatedStorage:WaitForChild("EXPFunction"));
        local v322 = require(game:GetService("ReplicatedStorage").Effect.Container.LevelUp);
        local v323 = require(game:GetService("ReplicatedStorage").Util.Sound);
        local v324 = game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp_Proxy") or game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp") ;
        function v129(v543)
            local v544 = v543;
            while true do
                local v649, v650 = string.gsub(v544, "^(-?%d+)(%d%d%d)", "%1,%2");
                v544 = v649;
                if (v650 == 0) then
                    break;
                end
            end
            return v544;
        end
        v319.new("<Color=Yellow>QUEST COMPLETED!<Color=/>"):Display();
        v319.new("Earned<Color=Yellow>9,999,999,999,999 Exp.<Color=/>(+None)"):Display();
        v319.new("Earned<Color=Green>$9,999,999,999,999<Color=/>"):Display();
        v318.Data.Exp.Value = 999999999999;
        v318.Data.Beli.Value = v318.Data.Beli.Value + 999999999999 ;
        delay = 0;
        count = 0;
        while (v318.Data.Exp.Value - v321(v320.Level.Value)) > 0 do
            v318.Data.Exp.Value = v318.Data.Exp.Value - v321(v320.Level.Value) ;
            v318.Data.Level.Value = v318.Data.Level.Value + 1 ;
            v318.Data.Points.Value = v318.Data.Points.Value + 3 ;
            v322({
                v318
            });
            v323.Play(v323, v324.Value);
            v319.new("<Color=Green>LEVEL UP!<Color=/>(" .. v318.Data.Level.Value .. ")"):Display();
            count = count + 1 ;
            if (count >= 5) then
                delay = tick();
                count = 0;
                wait(0.05);
            end
        end
    end
});
v16.Visual:AddInput("Input_Level", {
    Title = "Cấp",
    Default = "",
    Placeholder = "Nhập",
    Numeric = false,
    Finished = false,
    Callback = function(v327)
        game:GetService("Players")['LocalPlayer'].Data.Level.Value = tonumber(v327);
    end
});
v16.Visual:AddInput("Input_EXP", {
    Title = "Kinh Nghiệm",
    Default = "",
    Placeholder = "Nhập",
    Numeric = false,
    Finished = false,
    Callback = function(v329)
        game:GetService("Players")['LocalPlayer'].Data.Exp.Value = tonumber(v329);
    end
});
v16.Visual:AddInput("Input_Beli", {
    Title = "Tiền",
    Default = "",
    Placeholder = "Nhập",
    Numeric = false,
    Finished = false,
    Callback = function(v331)
        game:GetService("Players")['LocalPlayer'].Data.Beli.Value = tonumber(v331);
    end
});
v16.Visual:AddInput("Input_Fragments", {
    Title = "Điểm F",
    Default = "",
    Placeholder = "Nhập",
    Numeric = false,
    Finished = false,
    Callback = function(v333)
        game:GetService("Players")['LocalPlayer'].Data.Fragments.Value = tonumber(v333);
    end
});
local v122 = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
Table_DevilFruitSniper = {};
ShopDevilSell = {};
for v335, v336 in next, v122 do
    table.insert(Table_DevilFruitSniper, v336.Name);
    if v336.OnSale then
        table.insert(ShopDevilSell, v336.Name);
    end
end
_G.SelectFruit = "Dragon-Dragon";
_G.PermanentFruit = "Dragon-Dragon";
_G.AutoBuyFruitSniper = false;
_G.AutoSwitchPermanentFruit = false;
local v123 = v16.Fruit:AddDropdown("DropdownFruit", {
    Title = "Chọn Trái",
    Description = "",
    Values = Table_DevilFruitSniper,
    Multi = false,
    Default = Config.SelectFruit
});
v123:SetValue(Config.SelectFruit);
v123:OnChanged(function(v337)
    _G.SelectFruit = v337;
    Config.SelectFruit = v337;
    SaveConfig(Config)
end);
local v111 = v16.Fruit:AddToggle("ToggleFruit", {
    Title = "Mua Trái Chọn",
    Description = "",
    Default = Config.AutoBuyFruitSniper
});
v111:OnChanged(function(v338)
    Config.AutoBuyFruitSniper = v338
    SaveConfig(Config)
    if v338 then
        _G.AutoBuyFruitSniper = true;
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits");
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", _G.SelectFruit, false);
        end);
        _G.AutoBuyFruitSniper = false;
    end
end);
v17.ToggleFruit:SetValue(Config.AutoBuyFruitSniper);
local v124 = v16.Fruit:AddDropdown("DropdownPermanentFruit", {
    Title = "Chọn Trái Vĩnh Viễn",
    Description = "",
    Values = Table_DevilFruitSniper,
    Multi = false,
    Default = Config.PermanentFruit
});
v124:SetValue(Config.PermanentFruit);
v124:OnChanged(function(v339)
    _G.PermanentFruit = v339;
    Config.PermanentFruit = v339;
    SaveConfig(Config)
end);
local v125 = v16.Fruit:AddToggle("TogglePermanentFruit", {
    Title = "Đổi Trái Vĩnh Viễn",
    Description = "",
    Default = Config.AutoSwitchPermanentFruit
});
v125:OnChanged(function(v340)
    Config.AutoSwitchPermanentFruit = v340
    SaveConfig(Config)
    if v340 then
        _G.AutoSwitchPermanentFruit = true;
        pcall(function()
            local v742 = {
                [1] = "SwitchFruit",
                [2] = _G.PermanentFruit
            };
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v742));
        end);
        _G.AutoSwitchPermanentFruit = false;
    end
end);
v17.TogglePermanentFruit:SetValue(Config.AutoSwitchPermanentFruit);
local v126 = v16.Fruit:AddToggle("ToggleStore", {
    Title = "Lưu Trái",
    Description = "",
    Default = Config.AutoStoreFruit
});
v126:OnChanged(function(v341)
    _G.AutoStoreFruit = v341;
    Config.AutoStoreFruit = v341;
    SaveConfig(Config)
end);
v17.ToggleStore:SetValue(Config.AutoStoreFruit);
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local lp = Players.LocalPlayer
local CommF = ReplicatedStorage.Remotes.CommF_

-- Map TextureId -> Store Name
local FruitsId = {
    ["rbxassetid://15060012861"] = "Rocket-Rocket",
    ["rbxassetid://15057683975"] = "Spin-Spin",
    ["rbxassetid://15104782377"] = "Chop-Chop",
    ["rbxassetid://15105281957"] = "Spring-Spring",
    ["rbxassetid://15116740364"] = "Bomb-Bomb",
    ["rbxassetid://15116696973"] = "Smoke-Smoke",
    ["rbxassetid://15107005807"] = "Spike-Spike",
    ["rbxassetid://15111584216"] = "Flame-Flame",
    ["rbxassetid://15112469964"] = "Falcon-Falcon",
    ["rbxassetid://15100433167"] = "Ice-Ice",
    ["rbxassetid://15111517529"] = "Sand-Sand",
    ["rbxassetid://15111553409"] = "Dark-Dark",
    ["rbxassetid://15112600534"] = "Diamond-Diamond",
    ["rbxassetid://15100283484"] = "Light-Light",
    ["rbxassetid://15104817760"] = "Rubber-Rubber",
    ["rbxassetid://15100485671"] = "Barrier-Barrier",
    ["rbxassetid://15112333093"] = "Ghost-Ghost",
    ["rbxassetid://15105350415"] = "Magma-Magma",
    ["rbxassetid://15057718441"] = "Quake-Quake",
    ["rbxassetid://15100313696"] = "Buddha-Buddha",
    ["rbxassetid://15116730102"] = "Love-Love",
    ["rbxassetid://15116967784"] = "Spider-Spider",
    ["rbxassetid://14661873358"] = "Sound-Sound",
    ["rbxassetid://15100246632"] = "Phoenix-Phoenix",
    ["rbxassetid://15112215862"] = "Portal-Portal",
    ["rbxassetid://15116747420"] = "Rumble-Rumble",
    ["rbxassetid://15116721173"] = "Pain-Pain",
    ["rbxassetid://15100384816"] = "Blizzard-Blizzard",
    ["rbxassetid://15100299740"] = "Gravity-Gravity",
    ["rbxassetid://14661837634"] = "Mammoth-Mammoth",
    ["rbxassetid://15708895165"] = "T-Rex-T-Rex",
    ["rbxassetid://15100273645"] = "Dough-Dough",
    ["rbxassetid://15112263502"] = "Shadow-Shadow",
    ["rbxassetid://15100184583"] = "Control-Control",
    ["rbxassetid://15106768588"] = "Leopard-Leopard",
    ["rbxassetid://15482881956"] = "Kitsune-Kitsune",
    ["https://assetdelivery.roblox.com/v1/asset/?id=10395893751"] = "Venom-Venom",
    ["https://assetdelivery.roblox.com/v1/asset/?id=10537896371"] = "Dragon-Dragon"
}

local function AutoStoreFruit()
    local char = lp.Character
    local bag = lp.Backpack
    if not char or not bag then return end

    for _, container in ipairs({char, bag}) do
        for _, tool in ipairs(container:GetChildren()) do
            local Fruit = tool:FindFirstChild("Fruit")
            if tool:IsA("Tool") and Fruit then
                local storeName = FruitsId[Fruit.Fruit.MeshId]
                if storeName then
                    CommF:InvokeServer("StoreFruit", storeName, tool)
                    task.wait(0.25) -- chống spam remote
                end
            end
        end
    end
end

task.spawn(function()
    while task.wait(3) do
        if _G.AutoStoreFruit then
            pcall(AutoStoreFruit)
        end
    end
end)

local v127 = v16.Fruit:AddToggle("ToggleRandomFruit", {
    Title = "Random Trái",
    Description = "",
    Default = Config.Random_Auto
});
v127:OnChanged(function(v342)
    _G.Random_Auto = v342;
    Config.Random_Auto = v342;
    SaveConfig(Config)
end);
v17.ToggleRandomFruit:SetValue(Config.Random_Auto);
spawn(function()
    pcall(function()
        while wait(0.05) do
            if _G.Random_Auto then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy");
            end
        end
    end);
end);
local v128 = v16.Fruit:AddToggle("ToggleCollectTP", {
    Title = "Bay Đến Trái",
    Description = "",
    Default = Config.CollectFruitTP
});
v128:OnChanged(function(v343)
    _G.CollectFruitTP = v343;
    Config.CollectFruitTP = v343;
    SaveConfig(Config)
end);
v17.ToggleCollectTP:SetValue(Config.CollectFruitTP);
spawn(function()
    while wait(0.05) do
        if _G.CollectFruitTP then
            for v801, v802 in pairs(game.Workspace:GetChildren()) do
                if string.find(v802.Name, "Fruit") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v802.Handle.CFrame;
                end
            end
        end
    end
end);
local v129 = v16.Fruit:AddToggle("ToggleCollect", {
    Title = "Dịch Chuyển Đến Trái",
    Description = "",
    Default = Config.Tweenfruit
});
v129:OnChanged(function(v344)
    _G.Tweenfruit = v344;
    Config.Tweenfruit = v344;
    SaveConfig(Config)
end);
v17.ToggleCollect:SetValue(Config.Tweenfruit);
spawn(function()
    while wait(0.05) do
        if _G.Tweenfruit then
            for v803, v804 in pairs(game.Workspace:GetChildren()) do
                if string.find(v804.Name, "Fruit") then
                    Tween(v804.Handle.CFrame);
                end
            end
        end
    end
end);
local v56 = v16.Fruit:AddSection("Định Vị");
local v130 = v16.Fruit:AddToggle("ToggleEspPlayer", {
    Title = "Người Chơi",
    Description = "",
    Default = Config.ESPPlayer
});
v130:OnChanged(function(v345)
    _G.ESPPlayer = v345;
    Config.ESPPlayer = v345;
    SaveConfig(Config)
    UpdatePlayerChams();
end);
v17.ToggleEspPlayer:SetValue(Config.ESPPlayer);
local v131 = v16.Fruit:AddToggle("ToggleEspFruit", {
    Title = "Trái",
    Description = "",
    Default = Config.DevilFruitESP
});
v131:OnChanged(function(v346)
    _G.DevilFruitESP = v346;
    Config.DevilFruitESP = v346;
    SaveConfig(Config)
    while _G.DevilFruitESP do
        wait(0.05);
        UpdateDevilChams();
    end
end);
local v132 = v16.Fruit:AddToggle("ToggleEspIsland", {
    Title = "Đảo",
    Description = "",
    Default = Config.IslandESP
});
local IslandESPThread = nil

v132:OnChanged(function(v)
    _G.IslandESP = v
    Config.IslandESP = v
    SaveConfig(Config)

    if v and not IslandESPThread then
        IslandESPThread = task.spawn(function()
            while _G.IslandESP do
                task.wait(0.5)
                UpdateIslandESP()
            end
            IslandESPThread = nil
        end)
    end
end)
local v133 = v16.Fruit:AddToggle("ToggleEspFlower", {
    Title = "Hoa",
    Description = "",
    Default = Config.FlowerESP
});
v133:OnChanged(function(v348)
    _G.FlowerESP = v348;
    Config.FlowerESP = v348;
    SaveConfig(Config)
    UpdateFlowerChams();
end);
v17.ToggleEspFlower:SetValue(Config.FlowerESP);
spawn(function()
    while wait(0.05) do
        if _G.FlowerESP then
            UpdateFlowerChams();
        end
        if _G.DevilFruitESP then
            UpdateDevilChams();
        end
        if _G.ChestESP then
            UpdateChestChams();
        end
        if _G.ESPPlayer then
            UpdatePlayerChams();
        end
        if _G.RealFruitESP then
            UpdateRealFruitChams();
        end
    end
end);
local v134 = v16.Fruit:AddToggle("ToggleEspRealFruit", {
    Title = "Trái Dứa Khớm Táo",
    Description = "",
    Default = Config.RealFruitESP
});
v134:OnChanged(function(v349)
    _G.RealFruitESP = v349;
    Config.RealFruitESP = v349;
    SaveConfig(Config)
    while _G.RealFruitESP do
        wait(0.05);
        UpdateRealFruitEsp();
    end
end);
v17.ToggleEspRealFruit:SetValue(Config.RealFruitESP);
function UpdateRealFruitEsp()
    for v548, v549 in pairs(game.Workspace.AppleSpawner:GetChildren()) do
        if v549:IsA("Tool") then
            if _G.RealFruitESP then
                if not v549.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v1066 = Instance.new("BillboardGui", v549.Handle);
                    v1066.Name = "NameEsp" .. Number ;
                    v1066.ExtentsOffset = Vector3.new(0, 1, 0);
                    v1066.Size = UDim2.new(1, 200, 1, 30);
                    v1066.Adornee = v549.Handle;
                    v1066.AlwaysOnTop = true;
                    local v1073 = Instance.new("TextLabel", v1066);
                    v1073.Font = Enum.Font.GothamSemibold;
                    v1073.FontSize = "Size14";
                    v1073.TextWrapped = true;
                    v1073.Size = UDim2.new(1, 0, 1, 0);
                    v1073.TextYAlignment = "Top";
                    v1073.BackgroundTransparency = 1;
                    v1073.TextStrokeTransparency = 0.5;
                    v1073.TextColor3 = Color3.fromRGB(255, 0, 0);
                    v1073.Text = v549.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v549.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v549.Handle["NameEsp" .. Number ].TextLabel.Text = v549.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v549.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v549.Handle:FindFirstChild("NameEsp" .. Number) then
                v549.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
    for v550, v551 in pairs(game.Workspace.PineappleSpawner:GetChildren()) do
        if v551:IsA("Tool") then
            if _G.RealFruitESP then
                if not v551.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v1085 = Instance.new("BillboardGui", v551.Handle);
                    v1085.Name = "NameEsp" .. Number ;
                    v1085.ExtentsOffset = Vector3.new(0, 1, 0);
                    v1085.Size = UDim2.new(1, 200, 1, 30);
                    v1085.Adornee = v551.Handle;
                    v1085.AlwaysOnTop = true;
                    local v1092 = Instance.new("TextLabel", v1085);
                    v1092.Font = Enum.Font.GothamSemibold;
                    v1092.FontSize = "Size14";
                    v1092.TextWrapped = true;
                    v1092.Size = UDim2.new(1, 0, 1, 0);
                    v1092.TextYAlignment = "Top";
                    v1092.BackgroundTransparency = 1;
                    v1092.TextStrokeTransparency = 0.5;
                    v1092.TextColor3 = Color3.fromRGB(255, 174, 0);
                    v1092.Text = v551.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v551.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v551.Handle["NameEsp" .. Number ].TextLabel.Text = v551.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v551.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v551.Handle:FindFirstChild("NameEsp" .. Number) then
                v551.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
    for v552, v553 in pairs(game.Workspace.BananaSpawner:GetChildren()) do
        if v553:IsA("Tool") then
            if _G.RealFruitESP then
                if not v553.Handle:FindFirstChild("NameEsp" .. Number) then
                    local v1104 = Instance.new("BillboardGui", v553.Handle);
                    v1104.Name = "NameEsp" .. Number ;
                    v1104.ExtentsOffset = Vector3.new(0, 1, 0);
                    v1104.Size = UDim2.new(1, 200, 1, 30);
                    v1104.Adornee = v553.Handle;
                    v1104.AlwaysOnTop = true;
                    local v1111 = Instance.new("TextLabel", v1104);
                    v1111.Font = Enum.Font.GothamSemibold;
                    v1111.FontSize = "Size14";
                    v1111.TextWrapped = true;
                    v1111.Size = UDim2.new(1, 0, 1, 0);
                    v1111.TextYAlignment = "Top";
                    v1111.BackgroundTransparency = 1;
                    v1111.TextStrokeTransparency = 0.5;
                    v1111.TextColor3 = Color3.fromRGB(251, 255, 0);
                    v1111.Text = v553.Name .. " \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v553.Handle.Position).Magnitude / 3) .. " Distance" ;
                else
                    v553.Handle["NameEsp" .. Number ].TextLabel.Text = v553.Name .. " " .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v553.Handle.Position).Magnitude / 3) .. " Distance" ;
                end
            elseif v553.Handle:FindFirstChild("NameEsp" .. Number) then
                v553.Handle:FindFirstChild("NameEsp" .. Number):Destroy();
            end
        end
    end
end
local v135 = v16.Fruit:AddToggle("ToggleIslandMirageEsp", {
    Title = "Đảo Bí Ẩn",
    Description = "",
    Default = Config.IslandMirageEsp
});
v135:OnChanged(function(v350)
    _G.IslandMirageEsp = v350;
    Config.IslandMirageEsp = v350;
    SaveConfig(Config)
    while _G.IslandMirageEsp do
        wait(0.05);
        UpdateIslandMirageEsp();
    end
end);
v17.ToggleIslandMirageEsp:SetValue(Config.IslandMirageEsp);
function isnil(v351)
    return v351 == nil ;
end
local function v20(v352)
    return math.floor(tonumber(v352) + 0.5);
end
Number = math.random(1, 1000000);
function UpdateIslandMirageEsp()
    for v554, v555 in pairs(game:GetService("Workspace")['_WorldOrigin'].Locations:GetChildren()) do
        pcall(function()
            if MirageIslandESP then
                if (v555.Name == "Mirage Island") then
                    if not v555:FindFirstChild("NameEsp") then
                        local v1347 = Instance.new("BillboardGui", v555);
                        v1347.Name = "NameEsp";
                        v1347.ExtentsOffset = Vector3.new(0, 1, 0);
                        v1347.Size = UDim2.new(1, 200, 1, 30);
                        v1347.Adornee = v555;
                        v1347.AlwaysOnTop = true;
                        local v1353 = Instance.new("TextLabel", v1347);
                        v1353.Font = Enum.Font.Code;
                        v1353.FontSize = Enum.FontSize.Size14;
                        v1353.TextWrapped = true;
                        v1353.Size = UDim2.new(1, 0, 1, 0);
                        v1353.TextYAlignment = Enum.TextYAlignment.Top;
                        v1353.BackgroundTransparency = 1;
                        v1353.TextStrokeTransparency = 0.5;
                        v1353.TextColor3 = Color3.fromRGB(80, 245, 245);
                    else
                        v555['NameEsp'].TextLabel.Text = v555.Name .. "   \n" .. v20((game:GetService("Players").LocalPlayer.Character.Head.Position - v555.Position).Magnitude / 3) .. " M" ;
                    end
                end
            elseif v555:FindFirstChild("NameEsp") then
                v555:FindFirstChild("NameEsp"):Destroy();
            end
        end);
    end
end
local v136 = {
    "Flame",
    "Ice",
    "Quake",
    "Light",
    "Dark",
    "Spider",
    "Rumble",
    "Magma",
    "Buddha",
    "Sand",
    "Phoenix",
    "Dough"
};
local v137 = v16.Raid:AddDropdown("DropdownRaid", {
    Title = "Chọn Chip",
    Description = "",
    Values = v136,
    Multi = false,
    Default = 1
});
v137:SetValue(SelectChip);
v137:OnChanged(function(v353)
    SelectChip = v353;
    SaveConfig(Config)
end);
local v138 = v16.Raid:AddToggle("ToggleBuy", {
    Title = "Mua Chip",
    Description = "",
    Default = Config.Auto_Buy_Chips_Dungeon
});
v138:OnChanged(function(v354)
    _G.Auto_Buy_Chips_Dungeon = v354;
    Config.Auto_Buy_Chips_Dungeon = v354;
    SaveConfig(Config)
end);
v17.ToggleBuy:SetValue(Config.Auto_Buy_Chips_Dungeon);
spawn(function()
    while wait(0.05) do
        if _G.Auto_Buy_Chips_Dungeon then
            pcall(function()
                local v805 = {
                    [1] = "RaidsNpc",
                    [2] = "Select",
                    [3] = SelectChip
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v805));
            end);
        end
    end
end);
local v139 = v16.Raid:AddToggle("ToggleStart", {
    Title = "Bắt Đầu Raid",
    Description = "",
    Default = Config.Auto_StartRaid
});
v139:OnChanged(function(v355)
    _G.Auto_StartRaid = v355;
    Config.Auto_StartRaid = v355;
    SaveConfig(Config)
end);
v17.ToggleStart:SetValue(Config.Auto_StartRaid);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if _G.Auto_StartRaid then
                if (game:GetService("Players")['LocalPlayer'].PlayerGui.Main.Timer.Visible == false) then
                    if (not game:GetService("Workspace")['_WorldOrigin'].Locations:FindFirstChild("Island 1") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip"))) then
                        if Sea2 then
                            Tween2(CFrame.new(- 6438.73535, 250.645355, - 4501.50684));
                            local v1547 = {
                                [1] = "SetSpawnPoint"
                            };
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1547));
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector);
                        elseif Sea3 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375));
                            Tween2(CFrame.new(- 5017.40869, 314.844055, - 2823.0127, - 0.925743818, 4.482175e-8, - 0.378151238, 4.5550315e-9, 1, 1.0737756e-7, 0.378151238, 9.768162e-8, - 0.925743818));
                            local v1656 = {
                                [1] = "SetSpawnPoint"
                            };
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1656));
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector);
                        end
                    end
                end
            end
        end);
    end
end);
local v140 = v16.Raid:AddToggle("ToggleNextIsland", {
    Title = "Đấm Quái Raid+Bay Đến Đảo",
    Description = "",
    Default = Config.AutoNextIsland
});
v140:OnChanged(function(v356)
    _G.AutoNextIsland = v356;
    Config.AutoNextIsland = v356;
    SaveConfig(Config)
    if not v356 then
        _G.AutoNear = false;
    end
end);
v17.ToggleNextIsland:SetValue(Config.AutoNextIsland);
spawn(function()
    local v357 = {};
    while task.wait(0.05) do
        if _G.AutoNextIsland then
            pcall(function()
                local v806 = game.Players.LocalPlayer.Character;
                if (v806 and v806:FindFirstChild("HumanoidRootPart")) then
                    local v900 = game:GetService("Workspace")['_WorldOrigin'].Locations;
                    local v901 = v806.HumanoidRootPart.Position;
                    if (((v901 - Vector3.new(- 6438.73535, 250.645355, - 4501.50684)).Magnitude < 1) or ((v901 - Vector3.new(- 5017.40869, 314.844055, - 2823.0127)).Magnitude < 1)) then
                        v357 = {};
                    end
                    if v900:FindFirstChild("Island 1") then
                        _G.AutoNear = true;
                    end
                    if (v900:FindFirstChild("Island 2") and not v357["Island 2"]) then
                        Tween(v900:FindFirstChild("Island 2").CFrame);
                        v357["Island 2"] = true;
                        _G.AutoNextIsland = false;
                        wait(0.05);
                        _G.AutoNextIsland = true;
                    elseif (v900:FindFirstChild("Island 3") and not v357["Island 3"]) then
                        Tween(v900:FindFirstChild("Island 3").CFrame);
                        v357["Island 3"] = true;
                        _G.AutoNextIsland = false;
                        wait(0.05);
                        _G.AutoNextIsland = true;
                    elseif (v900:FindFirstChild("Island 4") and not v357["Island 4"]) then
                        Tween(v900:FindFirstChild("Island 4").CFrame);
                        v357["Island 4"] = true;
                        _G.AutoNextIsland = false;
                        wait(0.05);
                        _G.AutoNextIsland = true;
                    elseif (v900:FindFirstChild("Island 5") and not v357["Island 5"]) then
                        Tween(v900:FindFirstChild("Island 5").CFrame);
                        v357["Island 5"] = true;
                        _G.AutoNextIsland = false;
                        wait(0.05);
                        _G.AutoNextIsland = true;
                    end
                end
            end);
        end
    end
end);
local v141 = v16.Raid:AddToggle("ToggleAwake", {
    Title = "Thức Tỉnh",
    Description = "",
    Default = Config.AutoAwakenAbilities
});
v141:OnChanged(function(v358)
    _G.AutoAwakenAbilities = v358;
    Config.AutoAwakenAbilities = v358;
    SaveConfig(Config)
end);
v17.ToggleAwake:SetValue(Config.AutoAwakenAbilities);
spawn(function()
    while task.wait(0.05) do
        if _G.AutoAwakenAbilities then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken");
            end);
        end
    end
end);
local v142 = v16.Raid:AddToggle("ToggleGetFruit", {
    Title = "Lấy Trái Dưới 1 Triệu",
    Description = "",
    Default = Config.Autofruit
});
v142:OnChanged(function(v359)
    _G.Autofruit = v359;
    Config.Autofruit = v359;
    SaveConfig(Config)
end);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if _G.Autofruit then
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Rocket-Rocket"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Spin-Spin"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Chop-Chop"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Spring-Spring"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Bomb-Bomb"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Smoke-Smoke"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Spike-Spike"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Flame-Flame"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Falcon-Falcon"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Ice-Ice"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Sand-Sand"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Dark-Dark"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Ghost-Ghost"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Diamond-Diamond"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Light-Light"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Rubber-Rubber"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
                local v807 = {
                    [1] = "LoadFruit",
                    [2] = "Barrier-Barrier"
                };
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v807));
            end
        end);
    end
end);
if Sea2 then
    v16.Raid:AddButton({
        Title = "Bay Đến Chỗ Tập Kích",
        Description = "",
        Callback = function()
            Tween2(CFrame.new(- 6438.73535, 250.645355, - 4501.50684));
        end
    });
elseif Sea3 then
    v16.Raid:AddButton({
        Title = "Bay Đến Chỗ Tập Kích",
        Description = "",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375));
            Tween2(CFrame.new(- 5017.40869, 314.844055, - 2823.0127, - 0.925743818, 4.482175e-8, - 0.378151238, 4.5550315e-9, 1, 1.0737756e-7, 0.378151238, 9.768162e-8, - 0.925743818));
        end
    });
end
local v56 = v16.Raid:AddSection("Tập Kích Law");
local v143 = v16.Raid:AddToggle("ToggleLaw", {
    Title = "Mua Chip Và Đấm Law",
    Description = "",
    Default = Config.Auto_Law
});
v143:OnChanged(function(v360)
    _G.Auto_Law = v360;
    Config.Auto_Law = v360;
    SaveConfig(Config)
end);
v17.ToggleLaw:SetValue(Config.Auto_Law);
spawn(function()
    pcall(function()
        while wait(0.05) do
            if _G.Auto_Law then
                if (not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") and not game:GetService("Workspace").Enemies:FindFirstChild("Order") and not game:GetService("ReplicatedStorage"):FindFirstChild("Order")) then
                    wait(0.05);
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1");
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2");
                end
            end
        end
    end);
end);
spawn(function()
    pcall(function()
        while wait(0.05) do
            if _G.Auto_Law then
                if (not game:GetService("Workspace").Enemies:FindFirstChild("Order") and not game:GetService("ReplicatedStorage"):FindFirstChild("Order")) then
                    if (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip")) then
                        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector);
                    end
                end
                if (game:GetService("ReplicatedStorage"):FindFirstChild("Order") or game:GetService("Workspace").Enemies:FindFirstChild("Order")) then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                        for v1468, v1469 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if (v1469.Name == "Order") then
                                repeat
                                    wait(_G.Fast_Delay);
                                    AttackNoCoolDown();
                                    AutoHaki();
                                    EquipTool(_G.SelectWeapon);
                                    Tween(v1469.HumanoidRootPart.CFrame * Pos);
                                    v1469.HumanoidRootPart.CanCollide = false;
                                    v1469.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                until not v1469.Parent or (v1469.Humanoid.Health <= 0) or (_G.Auto_Law == false)
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                        Tween(CFrame.new(- 6217.2021484375, 28.047645568848, - 5053.1357421875));
                    end
                end
            end
        end
    end);
end);
v16.Race:AddButton({
    Title = "Đền Thời Gian",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875));
    end
});
v16.Race:AddButton({
    Title = "Cần Gạt",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875));
        Tween2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734));
    end
});
v16.Race:AddButton({
    Title = "Chỗ Mua Gear",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875));
        Tween2(CFrame.new(28981.552734375, 14888.4267578125, - 120.245849609375));
    end
});
local v56 = v16.Race:AddSection("Tộc");
v16.Race:AddButton({
    Title = "Cửa Tộc",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875));
        if (game:GetService("Players").LocalPlayer.Data.Race.Value == "Human") then
            Tween2(CFrame.new(29221.822265625, 14890.9755859375, - 205.99114990234375));
        elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea") then
            Tween2(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375));
        elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman") then
            Tween2(CFrame.new(28231.17578125, 14890.9755859375, - 211.64173889160156));
        elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg") then
            Tween2(CFrame.new(28502.681640625, 14895.9755859375, - 423.7279357910156));
        elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul") then
            Tween2(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156));
        elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink") then
            Tween2(CFrame.new(29012.341796875, 14890.9755859375, - 380.1492614746094));
        end
    end
});
local v144 = v16.Race:AddToggle("ToggleHumanandghoul", {
    Title = "Hoàn Thành Ải [Human/Ghoul]",
    Description = "",
    Default = Config.KillAura
});
v144:OnChanged(function(v361)
    _G.KillAura = v361;
    Config.KillAura = v361;
    _G.Humanandghoul = v361;
    SaveConfig(Config)
end);
v17.ToggleHumanandghoul:SetValue(Config.Humanandghoul);
local v145 = v16.Race:AddToggle("ToggleAutotrial", {
    Title = "Hoàn Thành Ải",
    Description = "",
    Default = Config.AutoQuestRace
});
v145:OnChanged(function(v362)
    _G.AutoQuestRace = v362;
    Config.AutoQuestRace = v362;
end);
v17.ToggleAutotrial:SetValue(Config.AutoQuestRace);
spawn(function()
    pcall(function()
        while wait(0.05) do
            if _G.AutoQuestRace then
                if (game:GetService("Players").LocalPlayer.Data.Race.Value == "Human") then
                    for v1123, v1124 in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if (v1124:FindFirstChild("Humanoid") and v1124:FindFirstChild("HumanoidRootPart") and (v1124.Humanoid.Health > 0)) then
                            pcall(function()
                                repeat
                                    wait(0.05);
                                    v1124.Humanoid.Health = 0;
                                    v1124.HumanoidRootPart.CanCollide = false;
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
                                until not _G.AutoQuestRace or not v1124.Parent or (v1124.Humanoid.Health <= 0)
                            end);
                        end
                    end
                elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea") then
                    for v1470, v1471 in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
                        if (v1471.Name == "snowisland_Cylinder.081") then
                            BTPZ(v1471.CFrame * CFrame.new(0, 0, 0));
                        end
                    end
                elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman") then
                    for v1582, v1583 in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
                        if (v1583.Name == "HumanoidRootPart") then
                            Tween(v1583.CFrame * Pos);
                            for v1746, v1747 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v1747:IsA("Tool") then
                                    if (v1747.ToolTip == "Melee") then
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1747);
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            for v1748, v1749 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v1749:IsA("Tool") then
                                    if (v1749.ToolTip == "Blox Fruit") then
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1749);
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.05);
                            for v1750, v1751 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v1751:IsA("Tool") then
                                    if (v1751.ToolTip == "Sword") then
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1751);
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.05);
                            for v1752, v1753 in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if v1753:IsA("Tool") then
                                    if (v1753.ToolTip == "Gun") then
                                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1753);
                                    end
                                end
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            wait(0.2);
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart);
                        end
                    end
                elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg") then
                    Tween(CFrame.new(28654, 14898.7832, - 30, 1, 0, 0, 0, 1, 0, 0, 0, 1));
                elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul") then
                    for v1764, v1765 in pairs(game.Workspace.Enemies:GetDescendants()) do
                        if (v1765:FindFirstChild("Humanoid") and v1765:FindFirstChild("HumanoidRootPart") and (v1765.Humanoid.Health > 0)) then
                            pcall(function()
                                repeat
                                    wait(0.05);
                                    v1765.Humanoid.Health = 0;
                                    v1765.HumanoidRootPart.CanCollide = false;
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge);
                                until not _G.AutoQuestRace or not v1765.Parent or (v1765.Humanoid.Health <= 0)
                            end);
                        end
                    end
                elseif (game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink") then
                    for v1790, v1791 in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if (v1791.Name == "StartPoint") then
                            Tween(v1791.CFrame * CFrame.new(0, 10, 0));
                        end
                    end
                end
            end
        end
    end);
end);
local v146 = v16.Race:AddToggle("ToggleKillTrial", {
    Title = "Đấm Người Chơi Trong Trial",
    Description = "",
    Default = Config.AutoKillTrial
});
v146:OnChanged(function(v363)
    _G.AutoKillTrial = v363;
    Config.AutoKillTrial = v363;
end);
v17.ToggleKillTrial:SetValue(Config.AutoKillTrial);
spawn(function()
    while wait(0.05) do
        pcall(function()
            if _G.AutoKillTrial then
                for v870, v871 in pairs(game:GetService("Players"):GetChildren()) do
                    if (v871.Name and (v871.Name ~= game.Players.LocalPlayer.Name) and ((v871.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100)) then
                        if (v871.Character.Humanoid.Health > 0) then
                            repeat
                                wait(_G.Fast_Delay);
                                EquipTool(_G.SelectWeapon);
                                AutoHaki();
                                Tween(v871.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5));
                                v871.Character.HumanoidRootPart.CanCollide = false;
                                v871.Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60);
                                AttackNoCoolDown();
                            until not _G.AutoKillTrial or not v871.Parent or (v871.Character.Humanoid.Health <= 0)
                        end
                    end
                end
            end
        end);
    end
end);
local v56 = v16.Race:AddSection("Huấn Luyện");
local v147 = v16.Race:AddToggle("ToggleFarmRace", {
    Title = "Cày Luyện Tộc",
    Description = "",
    Default = Config.FarmRace
});
v147:OnChanged(function(v364)
    _G.FarmRace = v364;
    Config.FarmRace = v364;
end);
v17.ToggleFarmRace:SetValue(Config.FarmRace);
spawn(function()
    while wait(0.05) do
        if _G.FarmRace then
            pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
                    if (game.Players.LocalPlayer.Character.RaceTransformed.Value == true) then
                        _G.AutoBoneNoQuest = false;
                        Tween(CFrame.new(- 9698.4736328125, 445.09442138671875, 6545.8525390625));
                    elseif (game.Players.LocalPlayer.Character.RaceTransformed.Value == false) then
                        _G.AutoBoneNoQuest = true;
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game);
                        wait(0.05);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game);
                    end
                end
            end);
        else
            _G.AutoBoneNoQuest = false;
        end
    end
end);
local v149 = v16.Race:AddToggle("ToggleUpgrade", {
    Title = "Mua Gear",
    Description = "",
    Default = Config.AutoUpgrade
});
v149:OnChanged(function(v365)
    _G.AutoUpgrade = v365;
    Config.AutoUpgrade = v365;
    if _G.AutoUpgrade then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Buy");
    end
end);
v17.ToggleUpgrade:SetValue(Config.AutoUpgrade);
local v56 = v16.Shop:AddSection("Khả Năng");
v16.Shop:AddButton({
    Title = "Nhảy",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo");
    end
});
v16.Shop:AddButton({
    Title = "Haki Đấm",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso");
    end
});
v16.Shop:AddButton({
    Title = "Dịch Chuyển",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru");
    end
});
v16.Shop:AddButton({
    Title = "Haki Quan Sát",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy");
    end
});
local v56 = v16.Shop:AddSection("Kiếm");
v16.Shop:AddButton({
    Title = "Cutlass",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass");
    end
});
v16.Shop:AddButton({
    Title = "Katana",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana");
    end
});
v16.Shop:AddButton({
    Title = "Iron Mace",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace");
    end
});
v16.Shop:AddButton({
    Title = "Duel Katana",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana");
    end
});
v16.Shop:AddButton({
    Title = "Triple Katana",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana");
    end
});
v16.Shop:AddButton({
    Title = "Pipe",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe");
    end
});
v16.Shop:AddButton({
    Title = "Dual-Headed Blade",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade");
    end
});
v16.Shop:AddButton({
    Title = "Bisento",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento");
    end
});
v16.Shop:AddButton({
    Title = "Soul Cane",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane");
    end
});
v16.Shop:AddButton({
    Title = "Pole V2",
    Description = "",
    Callback = function()
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk");
    end
});
local v56 = v16.Shop:AddSection("Võ");
v16.Shop:AddButton({
    Title = "Black Leg",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg");
    end
});
v16.Shop:AddButton({
    Title = "Electro",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro");
    end
});
v16.Shop:AddButton({
    Title = "Fishman Karate",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate");
    end
});
v16.Shop:AddButton({
    Title = "Dragon Claw",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1");
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2");
    end
});
v16.Shop:AddButton({
    Title = "Superhuman",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman");
    end
});
v16.Shop:AddButton({
    Title = "Death Step",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep");
    end
});
v16.Shop:AddButton({
    Title = "Sharkman Karate",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true);
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate");
    end
});
v16.Shop:AddButton({
    Title = "Electric Claw",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw");
    end
});
v16.Shop:AddButton({
    Title = "Dragon Talon",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon");
    end
});
v16.Shop:AddButton({
    Title = "Godhuman",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman");
    end
});
v16.Shop:AddButton({
    Title = "Sanguine Art",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt");
    end
});
local v56 = v16.Shop:AddSection("Khác");
v16.Shop:AddButton({
    Title = "Đổi Chỉ Số",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1");
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2");
    end
});
v16.Shop:AddButton({
    Title = "Đổi Tộc",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1");
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2");
    end
});
v16.Shop:AddButton({
    Title = "Đổi Tộc Ghoul",
    Description = "",
    Callback = function()
        local v366 = {
            [1] = "Ectoplasm",
            [2] = "Change",
            [3] = 4
        };
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v366));
    end
});
v16.Shop:AddButton({
    Title = "Đổi Tộc Cyborg",
    Description = "",
    Callback = function()
        local v367 = {
            [1] = "CyborgTrainer",
            [2] = "Buy"
        };
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v367));
    end
});
v16.Shop:AddButton({
    Title = "Đổi Tộc Draco",
    Description = "Chỉ Ở Biển 3",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906));
        Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
        local v368 = Vector3.new(5814.42724609375, 1208.3267822265625, 884.5785522460938);
        local v369 = game.Players.LocalPlayer;
        local v370 = v369.Character or v369.CharacterAdded:wait(0.05) ;
        repeat
            wait(0.05);
        until (v370.HumanoidRootPart.Position - v368).Magnitude < 1
        local v371 = {
            [1] = {
                NPC = "Dragon Wizard",
                Command = "DragonRace"
            }
        };
        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v371));
    end
});
v16.Misc:AddButton({
    Title = "Tham Gia Máy Chủ Lại",
    Description = "",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer);
    end
});
v16.Misc:AddButton({
    Title = "Đổi Máy Chủ",
    Description = "",
    Callback = function()
        Hop();
    end
});
function Hop()
    local v372 = game.PlaceId;
    local v373 = {};
    local v374 = "";
    local v375 = os.date("!*t").hour;
    local v376 = false;
    function TPReturner()
        local v556;
        if (v374 == "") then
            v556 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. v372 .. "/servers/Public?sortOrder=Asc&limit=100"));
        else
            v556 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. v372 .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. v374));
        end
        local v557 = "";
        if (v556.nextPageCursor and (v556.nextPageCursor ~= "null") and (v556.nextPageCursor ~= nil)) then
            v374 = v556.nextPageCursor;
        end
        local v558 = 0;
        for v651, v652 in pairs(v556.data) do
            local v653 = true;
            v557 = tostring(v652.id);
            if (tonumber(v652.maxPlayers) > tonumber(v652.playing)) then
                for v872, v873 in pairs(v373) do
                    if (v558 ~= 0) then
                        if (v557 == tostring(v873)) then
                            v653 = false;
                        end
                    elseif (tonumber(v375) ~= tonumber(v873)) then
                        local v1472 = pcall(function()
                            v373 = {};
                            table.insert(v373, v375);
                        end);
                    end
                    v558 = v558 + 1 ;
                end
                if (v653 == true) then
                    table.insert(v373, v557);
                    wait(0.05);
                    pcall(function()
                        wait(0.05);
                        game:GetService("TeleportService"):TeleportToPlaceInstance(v372, v557, game.Players.LocalPlayer);
                    end);
                    wait(0.05);
                end
            end
        end
    end
    function v118()
        while wait(0.05) do
            pcall(function()
                TPReturner();
                if (v374 ~= "") then
                    TPReturner();
                end
            end);
        end
    end
    v118();
end
local v56 = v16.Misc:AddSection("Đội");
v16.Misc:AddButton({
    Title = "Hải Tặc",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates");
    end
});
v16.Misc:AddButton({
    Title = "Hải Quân",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines");
    end
});
local v56 = v16.Misc:AddSection("Kinh Nghiệm");
local v150 = {
    "KITT_RESET",
    "Sub2UncleKizaru",
    "SUB2GAMERROBOT_RESET1",
    "Sub2Fer999",
    "Enyu_is_Pro",
    "JCWK",
    "StarcodeHEO",
    "MagicBus",
    "KittGaming",
    "Sub2CaptainMaui",
    "Sub2OfficalNoobie",
    "TheGreatAce",
    "Sub2NoobMaster123",
    "Sub2Daigrock",
    "Axiore",
    "StrawHatMaine",
    "TantaiGaming",
    "Bluxxy",
    "SUB2GAMERROBOT_EXP1",
    "Chandler",
    "NOMOREHACK",
    "BANEXPLOIT",
    "WildDares",
    "BossBuild",
    "GetPranked",
    "EARN_FRUITS",
    "FIGHT4FRUIT",
    "NOEXPLOITER",
    "NOOB2ADMIN",
    "CODESLIDE",
    "ADMINHACKED",
    "ADMINDARES",
    "fruitconcepts",
    "krazydares",
    "TRIPLEABUSE",
    "SEATROLLING",
    "24NOADMIN",
    "REWARDFUN",
    "NEWTROLL",
    "fudd10_v2",
    "Fudd10",
    "Bignews",
    "SECRET_ADMIN"
};
v16.Misc:AddButton({
    Title = "Nhập Hết",
    Description = "",
    Callback = function()
        for v559, v560 in ipairs(v150) do
            RedeemCode(v560);
        end
    end
});
function RedeemCode(v377)
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(v377);
end
local v56 = v16.Misc:AddSection("Danh Hiệu");
v16.Misc:AddButton({
    Title = "Danh Hiệu",
    Description = "",
    Callback = function()
        local v378 = {
            [1] = "getTitles"
        };
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v378));
        game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true;
    end
});
local v56 = v16.Misc:AddSection("Thức Tỉnh");
v16.Misc:AddButton({
    Title = "Thức Tỉnh",
    Description = "",
    Callback = function()
        game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true;
    end
});
local v56 = v16.Misc:AddSection("Khác");
local v151 = v16.Misc:AddToggle("ToggleRejoin", {
    Title = "Tham Gia Máy Chủ Lại",
    Description = "",
    Default = Config.AutoRejoin
});
v151:OnChanged(function(v381)
    _G.AutoRejoin = v381;
    Config.AutoRejoin = v381;
end);
v17.ToggleRejoin:SetValue(true);
spawn(function()
    while wait(0.05) do
        if _G.AutoRejoin then
            getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(v808)
                if ((v808.Name == "ErrorPrompt") and v808:FindFirstChild("MessageArea") and v808.MessageArea:FindFirstChild("ErrorFrame")) then
                    game:GetService("TeleportService"):Teleport(game.PlaceId);
                end
            end);
        end
    end
end);
local v56 = v16.Misc:AddSection("Sương");
local function v152()
    local v382 = game:GetService("Lighting");
    if v382:FindFirstChild("BaseAtmosphere") then
        v382.BaseAtmosphere:Destroy();
    end
    if v382:FindFirstChild("SeaTerrorCC") then
        v382.SeaTerrorCC:Destroy();
    end
    if v382:FindFirstChild("LightingLayers") then
        if v382.LightingLayers:FindFirstChild("Atmosphere") then
            v382.LightingLayers.Atmosphere:Destroy();
        end
        wait(0.05);
        if v382.LightingLayers:FindFirstChild("DarkFog") then
            v382.LightingLayers.DarkFog:Destroy();
        end
    end
    v382.FogEnd = 100000;
end
v16.Misc:AddButton({
    Title = "Xóa Sương Mù",
    Description = "",
    Callback = function()
        v152();
    end
});
local v153 = v16.Misc:AddToggle("ToggleAntiBand", {
    Title = "Chống Band",
    Description = "",
    Default = Config.AntiBand
});
v153:OnChanged(function(v384)
    _G.AntiBand = v384;
    Config.AntiBand = v384;
end);
local v154 = {
    17884881,
    120173604,
    912348
};
spawn(function()
    while wait(0.05) do
        if _G.AntiBand then
            for v809, v810 in pairs(game:GetService("Players"):GetPlayers()) do
                if table.find(v154, v810.UserId) then
                    Hop();
                end
            end
        end
    end
end);
local v56 = v16.Sea:AddSection("Leviathan");
v16.Sea:AddButton({
    Title = "Mua Chip Leviathan",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "2");
    end
});
local v155 = v16.Sea:AddToggle("ToggleTPFrozenDimension", {
    Title = "Bay Đến Đảo Leviathan",
    Description = "",
    Default = Config.TweenToFrozenDimension
});
v155:OnChanged(function(v385)
    _G.TweenToFrozenDimension = v385;
    Config.TweenToFrozenDimension = v385;
end);
v155:SetValue(Config.TweenToFrozenDimension);
spawn(function()
    local v386;
    while not v386 do
        v386 = game:GetService("Workspace").Map:FindFirstChild("FrozenDimension");
        wait(0.05);
    end
    while wait(0.05) do
        if _G.TweenToFrozenDimension then
            if v386 then
                Tween(v386.CFrame);
            end
        end
    end
end);
if Sea3 then
    local v561 = v16.Sea:AddParagraph({
        Title = "Trạng Thái Chip Leviathan",
        Content = ""
    });
    spawn(function()
        pcall(function()
            while wait(0.05) do
                local v811 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "1");
                if (v811 == 5) then
                    v561:SetDesc("Leviathan Is Out There");
                elseif (v811 == 0) then
                    v561:SetDesc("I Don't Know");
                else
                    v561:SetDesc("Mua: " .. tostring(v811));
                end
            end
        end);
    end);
end
local v156 = v16.Sea:AddSection("Draco");
local v157 = v16.Sea:AddToggle("ToggleBlazeEmber", {
    Title = "Lụm Lửa Đỏ",
    Description = "",
    Default = Config.AutoBlazeEmber
});
v157:OnChanged(function(v387)
    _G.AutoBlazeEmber = v387;
    Config.AutoBlazeEmber = v387;
end);
spawn(function()
    while wait(0.05) do
        if _G.AutoBlazeEmber then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/DragonDojoEmber"):FireServer();
            end);
        end
    end
end);
local v158 = v16.Sea:AddToggle("ToggleReceiveQuest", {
    Title = "Nhận Nhiệm Vụ Lửa Đỏ",
    Description = "Bật Lên 1 Lần Là Nhận 1 Nhận Nữa Thì Tắt Bật Lại",
    Default = Config.AutoReceiveQuest
});
v158:OnChanged(function(v388)
    _G.AutoReceiveQuest = v388;
    Config.AutoReceiveQuest = v388;
    if _G.AutoReceiveQuest then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906));
        Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
        spawn(function()
            pcall(function()
                while wait(0.05) do
                    local v874 = {
                        [1] = {
                            Context = "RequestQuest"
                        }
                    };
                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(v874));
                    local v875 = {
                        [1] = {
                            Context = "Check"
                        }
                    };
                    local v876 = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(v875));
                end
            end);
        end);
    end
end);
local v159 = v16.Sea:AddParagraph({
    Title = "Trạng Thái Nhiệm Vụ Lửa Đỏ",
    Content = ""
});
spawn(function()
    pcall(function()
        while wait(0.05) do
            local v654 = {
                [1] = {
                    Context = "Check"
                }
            };
            local v655 = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(v654));
            if (typeof(v655) == "table") then
                for v877, v878 in pairs(v655) do
                    if (v878 == "Defeat 3 Venomous Assailants on Hydra Island.") then
                        v159:SetDesc("Defeat 3 Venomous Assailants on Hydra Island.");
                    elseif (v878 == "Defeat 3 Hydra Enforcers on Hydra Island.") then
                        v159:SetDesc("Defeat 3 Hydra Enforcers on Hydra Island.");
                    elseif (v878 == "Destroy 10 trees on Hydra Island.") then
                        v159:SetDesc("Destroy 10 trees on Hydra Island.");
                    end
                end
            end
        end
    end);
end);
local v160 = v16.Sea:AddToggle("ToggleHydraTree", {
    Title = "Phá Cây Ở Đảo Hydra",
    Description = "",
    Default = Config.AutoHydraTree
});
v160:OnChanged(function(v389)
    _G.AutoHydraTree = v389;
    Config.AutoHydraTree = v389;
end);
local function v161(v390)
    local v391 = game:GetService("VirtualInputManager");
    v391:SendKeyEvent(true, v390, false, game);
    v391:SendKeyEvent(false, v390, false, game);
end
local function v162(v392)
    local v393 = game.Players.LocalPlayer;
    local v394 = v393.Backpack;
    for v562, v563 in pairs(v394:GetChildren()) do
        if (v563:IsA("Tool") and (v563.ToolTip == v392)) then
            v563.Parent = v393.Character;
            for v812, v813 in ipairs({
                "Z",
                "X",
                "C",
                "V",
                "F"
            }) do
                wait(0.05);
                pcall(function()
                    v161(v813);
                end);
            end
            v563.Parent = v394;
            break;
        end
    end
end
local v163 = {
    CFrame.new(5288.61962890625, 1005.4000244140625, 392.43011474609375),
    CFrame.new(5343.39453125, 1004.1998901367188, 361.0687561035156),
    CFrame.new(5235.78564453125, 1004.1998901367188, 431.4530944824219),
    CFrame.new(5321.30615234375, 1004.1998901367188, 440.8951416015625),
    CFrame.new(5258.96484375, 1004.1998901367188, 345.5052490234375)
};
spawn(function()
    while wait(0.05) do
        if _G.AutoHydraTree then
            AutoHaki();
            for v814, v815 in ipairs(v163) do
                if not _G.AutoHydraTree then
                    break;
                end
                Tween2(v815);
                wait(0.05);
                local v816 = game.Players.LocalPlayer.Character;
                if (v816 and v816:FindFirstChild("HumanoidRootPart")) then
                    local v902 = (v816.HumanoidRootPart.Position - v815.Position).Magnitude;
                    if (v902 <= 1) then
                        v162("Melee");
                        v162("Sword");
                        v162("Gun");
                    end
                end
            end
        end
    end
end);
v156:AddButton({
    Title = "Bay Đến Khu Vực Dragon Dojo",
    Description = "",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906));
        Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938));
    end
});
v156:AddButton({
    Title = "Chế Tạo Volcanic Magnet",
    Description = "",
    Callback = function()
        local v395 = {
            [1] = "CraftItem",
            [2] = "Craft",
            [3] = "Volcanic Magnet"
        };
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v395));
    end
});
local v164 = v16.Sea:AddToggle("ToggleCollectFireFlowers", {
    Title = "Lụm Hoa Đỏ",
    Description = "",
    Default = Config.AutoCollectFireFlowers
});
v164:OnChanged(function(v396)
    _G.AutoCollectFireFlowers = v396;
    Config.AutoCollectFireFlowers = v396;
end);
spawn(function()
    while wait(0.05) do
        if _G.AutoCollectFireFlowers then
            local v747 = workspace:FindFirstChild("FireFlowers");
            if v747 then
                for v903, v904 in pairs(v747:GetChildren()) do
                    if (v904:IsA("Model") and v904.PrimaryPart) then
                        local v1367 = v904.PrimaryPart.Position;
                        local v1368 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;
                        local v1369 = (v1367 - v1368).Magnitude;
                        if (v1369 <= 1) then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                            wait(1.5);
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game);
                        else
                            Tween2(CFrame.new(v1367));
                        end
                    end
                end
            end
        end
    end
end);
local v165 = v16.Sea:AddToggle("ToggleWhiteBelt", {
    Title = "Cày Đai Trắng",
    Description = "",
    Default = Config.WhiteBelt
});
v165:OnChanged(function(v397)
    _G.AutoLevel = v397;
    Config.WhiteBelt = v397;
    if v397 then
        local v656 = {
            [1] = {
                NPC = "Dojo Trainer",
                Command = "RequestQuest"
            }
        };
        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v656));
        spawn(function()
            while _G.AutoLevel do
                local v817 = {
                    [1] = {
                        NPC = "Dojo Trainer",
                        Command = "ClaimQuest"
                    }
                };
                game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v817));
                wait(0.05);
            end
        end);
    end
end);
local v166 = v16.Sea:AddParagraph({
    Title = "Hoàn Thành Ải Draco V4 (Sớm Ra)",
    Content = ""
});
local v167 = v16.Sea:AddToggle("ToggleTrialTeleport", {
    Title = "Bay Đến Cửa Trial Tộc Draco",
    Description = "",
    Default = Config.AutoTrialTeleport
});
v167:OnChanged(function(v398)
    _G.AutoTrialTeleport = v398;
    Config.AutoTrialTeleport = v398;
end);
spawn(function()
    while wait(0.05) do
        if _G.AutoTrialTeleport then
            local v748 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport");
            if (v748 and v748:IsA("Part")) then
                Tween2(CFrame.new(v748.Position));
            end
        end
    end
end);
local v168 = v16.Sea:AddSection("Đảo Dung Nham");
local v169 = v16.Sea:AddParagraph({
    Title = "Trạng Thái Đảo Dung Nham",
    Content = ""
});
spawn(function()
    pcall(function()
        while wait(0.05) do
            if ggame:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") then
                v169:SetDesc("Đảo Dung Nham: ✅️");
            else
                v169:SetDesc("Đảo Dung Nham: ❌️");
            end
        end
    end);
end);
local v170 = v16.Sea:AddToggle("ToggleTPVolcano", {
    Title = "Bay Đến Đảo Dung Nham",
    Description = "",
    Default = Config.TweenToPrehistoric
});
v170:OnChanged(function(v399)
    _G.TweenToPrehistoric = v399;
    Config.TweenToPrehistoric = v399;
end);
v17.ToggleTPVolcano:SetValue(Config.TweenToPrehistoric);
spawn(function()
    local v400;
    while not v400 do
        v400 = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland");
        wait(0.05);
    end
    while wait(0.05) do
        if _G.TweenToPrehistoric then
            local v749 = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland");
            if v749 then
                local v879 = v749:FindFirstChild("Core") and v749.Core:FindFirstChild("PrehistoricRelic") ;
                local v880 = v879 and v879:FindFirstChild("Skull") ;
                if v880 then
                    Tween2(CFrame.new(v880.Position));
                    _G.TweenToPrehistoric = false;
                end
            end
        end
    end
end);
local v171 = v16.Sea:AddToggle("ToggleDefendVolcano", {
    Title = "Phòng Thủ",
    Description = "",
    Default = Config.AutoDefendVolcano
});
v171:OnChanged(function(v401)
    _G.AutoDefendVolcano = v401;
    Config.AutoDefendVolcano = v401;
end);
local v107 = v16.Sea:AddToggle("ToggleMelee", {
    Title = "Dùng Melee",
    Description = "",
    Default = Config.UseMelee
});
v107:OnChanged(function(v402)
    _G.UseMelee = v402;
    Config.UseMelee = v402;
end);
local v109 = v16.Sea:AddToggle("ToggleSword", {
    Title = "Dùng Sword",
    Description = "",
    Default = Config.UseSword
});
v109:OnChanged(function(v403)
    _G.UseSword = v403;
    Config.UseSword = v403;
end);
local v110 = v16.Sea:AddToggle("ToggleGun", {
    Title = "Dùng Gun",
    Description = "",
    Default = Config.UseGun
});
v110:OnChanged(function(v404)
    _G.UseGun = v404;
    Config.UseGun = v404;
end);
local function v172(v405)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, v405, false, game);
    game:GetService("VirtualInputManager"):SendKeyEvent(false, v405, false, game);
end
local function v173()
    local v406 = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava");
    if (v406 and v406:IsA("Model")) then
        v406:Destroy();
    end
    local v407 = game.Workspace.Map:FindFirstChild("PrehistoricIsland");
    if v407 then
        for v750, v751 in pairs(v407:GetDescendants()) do
            if (v751:IsA("Part") and v751.Name:lower():find("lava")) then
                v751:Destroy();
            end
        end
    end
    local v408 = game.Workspace.Map:FindFirstChild("PrehistoricIsland");
    if v408 then
        for v752, v753 in pairs(v408:GetDescendants()) do
            if v753:IsA("Model") then
                for v905, v906 in pairs(v753:GetDescendants()) do
                    if (v906:IsA("MeshPart") and v906.Name:lower():find("lava")) then
                        v906:Destroy();
                    end
                end
            end
        end
    end
end
local function v174()
    local v409 = game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks;
    for v564, v565 in pairs(v409:GetChildren()) do
        if v565:IsA("Model") then
            local v754 = v565:FindFirstChild("volcanorock");
            if (v754 and v754:IsA("MeshPart")) then
                local v881 = v754.Color;
                if ((v881 == Color3.fromRGB(185, 53, 56)) or (v881 == Color3.fromRGB(185, 53, 57))) then
                    return v754;
                end
            end
        end
    end
    return nil;
end
local function v162(v410)
    local v411 = game.Players.LocalPlayer;
    local v412 = v411.Backpack;
    for v566, v567 in pairs(v412:GetChildren()) do
        if (v567:IsA("Tool") and (v567.ToolTip == v410)) then
            v567.Parent = v411.Character;
            for v818, v819 in ipairs({
                "Z",
                "X",
                "C",
                "V",
                "F"
            }) do
                wait(0.05);
                pcall(function()
                    v172(v819);
                end);
            end
            v567.Parent = v412;
            break;
        end
    end
end
spawn(function()
    while wait(0.05) do
        if _G.AutoDefendVolcano then
            AutoHaki();
            pcall(v173);
            local v757 = v174();
            if v757 then
                local v882 = CFrame.new(v757.Position + Vector3.new(0, 0, 0));
                Tween2(v882);
                local v883 = v757.Color;
                if ((v883 ~= Color3.fromRGB(185, 53, 56)) and (v883 ~= Color3.fromRGB(185, 53, 57))) then
                    v757 = v174();
                else
                    local v1125 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;
                    local v1126 = ((v1125 - v757.Position) - Vector3.new(0, 0, 0)).Magnitude;
                    if (v1126 <= 1) then
                        if _G.UseMelee then
                            v162("Melee");
                        end
                        if _G.UseSword then
                            v162("Sword");
                        end
                        if _G.UseGun then
                            v162("Gun");
                        end
                    end
                    _G.TweenToPrehistoric = false;
                end
            else
                _G.TweenToPrehistoric = true;
            end
        end
    end
end);
local v175 = v16.Sea:AddToggle("ToggleKillAura", {
    Title = "Đấm Golems Aura",
    Description = "",
    Default = Config.KillGolem
});
v175:OnChanged(function(v413)
    _G.KillAura = v413;
    Config.KillGolem = v413;
    SaveConfig(Config)
end);
v17.ToggleKillAura:SetValue(Config.KillGolem);
spawn(function()
    while wait(0.05) do
        if _G.KillAura then
            pcall(function()
                for v884, v885 in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if (v885:FindFirstChild("Humanoid") and v885:FindFirstChild("HumanoidRootPart") and (v885.Humanoid.Health > 0)) then
                        repeat
                            task.wait(0.05);
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge);
                            v885.Humanoid.Health = 0;
                            v885.HumanoidRootPart.CanCollide = false;
                        until not _G.KillAura or not v885.Parent or (v885.Humanoid.Health <= 0)
                    end
                end
            end);
        end
    end
end);
local v176 = v16.Sea:AddToggle("ToggleCollectBone", {
    Title = "Lụm Xương",
    Description = "",
    Default = Config.AutoCollectBone
});
v176:OnChanged(function(v414)
    _G.AutoCollectBone = v414;
    Config.AutoCollectBone = v414;
    SaveConfig(Config)
end);
spawn(function()
    while wait(0.05) do
        if _G.AutoCollectBone then
            for v820, v821 in pairs(workspace:GetDescendants()) do
                if (v821:IsA("BasePart") and (v821.Name == "DinoBone")) then
                    Tween2(CFrame.new(v821.Position));
                end
            end
        end
    end
end);
local v177 = v16.Sea:AddToggle("ToggleCollectEgg", {
    Title = "Lụm Trứng",
    Description = "",
    Default = Config.AutoCollectEgg
});
v177:OnChanged(function(v415)
    _G.AutoCollectEgg = v415;
    Config.AutoCollectEgg = v415;
    SaveConfig(Config)
end);
spawn(function()
    while wait(0.05) do
        if _G.AutoCollectEgg then
            local v758 = workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren();
            if (# v758 > 0) then
                local v886 = v758[math.random(1, # v758)];
                if (v886:IsA("Model") and v886.PrimaryPart) then
                    Tween2(v886.PrimaryPart.CFrame);
                    local v1127 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;
                    local v1128 = v886.PrimaryPart.Position;
                    local v1129 = (v1127 - v1128).Magnitude;
                    if (v1129 <= 1) then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game);
                        wait(1.5);
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game);
                    end
                end
            end
        end
    end
end);
v14:Notify({
    Title = "Maru Hub",
    Content = "Dowload Complete",
    Duration = 10
});
if getgenv().AutoLevelController then
    return
end
getgenv().AutoLevelController = true
function StartAutoLevel()
    if AutoLevelThread then return end
    
    AutoLevelThread = task.spawn(function()
        while _G.AutoLevel do
            task.wait(0.05)

            if _G.PirateRaiding or _G.Elite then continue end

            pcall(function()
                CheckLevel()

                local QuestGui = LocalPlayer.PlayerGui.Main.Quest
                local QuestText = QuestGui.Container.QuestTitle.Title.Text

                -- Nếu chưa có quest đúng
                if not string.find(QuestText, NameMon) or not QuestGui.Visible then
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)

                    if (CFrameQ.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 500 then
                        Tween(CFrameQ)
                    end
                else
                    -- Farm mob
                    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                        if mob.Name == Ms 
                        and mob:FindFirstChild("Humanoid")
                        and mob:FindFirstChild("HumanoidRootPart")
                        and mob.Humanoid.Health > 0 then
                            
                            repeat
                                task.wait(_G.Fast_Delay)

                                AttackNoCoolDown()
                                AutoHaki()
                                EquipTool(_G.SelectWeapon)
                                Tween(mob.HumanoidRootPart.CFrame * Pos)

                                mob.HumanoidRootPart.Size = Vector3.new(60,60,60)
                                mob.HumanoidRootPart.Transparency = 1
                                mob.HumanoidRootPart.CanCollide = false
                                mob.Humanoid.WalkSpeed = 0
                                mob.Humanoid.JumpPower = 0

                            until not _G.AutoLevel
                                or mob.Humanoid.Health <= 0
                                or _G.PirateRaiding
                                or _G.Elite
                        end
                    end
                end
            end)
        end

        AutoLevelThread = nil
    end)
end
function StartAutoNear()
    if AutoNearThread then return end
    
    AutoNearThread = task.spawn(function()
        while _G.AutoNear do
            task.wait(0.05)

            if _G.PirateRaiding or _G.Elite then continue end

            for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                if mob:FindFirstChild("Humanoid")
                and mob:FindFirstChild("HumanoidRootPart")
                and mob.Humanoid.Health > 0 then
                    
                    if (LocalPlayer.Character.HumanoidRootPart.Position - mob.HumanoidRootPart.Position).Magnitude <= 5000 then
                        
                        repeat
                            task.wait(_G.Fast_Delay)

                            AttackNoCoolDown()
                            AutoHaki()
                            EquipTool(_G.SelectWeapon)
                            Tween(mob.HumanoidRootPart.CFrame * Pos)

                            mob.HumanoidRootPart.Size = Vector3.new(60,60,60)
                            mob.HumanoidRootPart.Transparency = 1
                            mob.HumanoidRootPart.CanCollide = false
                            mob.Humanoid.WalkSpeed = 0
                            mob.Humanoid.JumpPower = 0

                        until not _G.AutoNear
                            or mob.Humanoid.Health <= 0
                            or _G.PirateRaiding
                            or _G.Elite
                    end
                end
            end
        end

        AutoNearThread = nil
    end)
end
local CakePrinceThread

function StartCakePrince()
    if CakePrinceThread then return end

    CakePrinceThread = task.spawn(function()
        while task.wait(0.05) do
            if _G.CakePrince and not _G.PirateRaiding and not _G.Elite then
                pcall(function()

                    local Enemies = workspace.Enemies
                    local Rep = game:GetService("ReplicatedStorage")
                    local Mirror = workspace.Map.CakeLoaf.BigMirror.Other

                    -- ================= CAKE PRINCE =================

                    if Enemies:FindFirstChild("Cake Prince") then
                        for _, v in pairs(Enemies:GetChildren()) do
                            if v.Name == "Cake Prince"
                            and v:FindFirstChild("Humanoid")
                            and v:FindFirstChild("HumanoidRootPart")
                            and v.Humanoid.Health > 0 then

                                repeat
                                    task.wait(_G.Fast_Delay)

                                    AutoHaki()
                                    EquipTool(_G.SelectWeapon)

                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(60,60,60)

                                    Tween(v.HumanoidRootPart.CFrame * Pos)
                                    AttackNoCoolDown()

                                until not _G.CakePrince
                                    or not v.Parent
                                    or v.Humanoid.Health <= 0
                                    or _G.PirateRaiding
                                    or _G.Elite
                            end
                        end

                    -- ================= CHƯA SPAWN =================

                    elseif Rep:FindFirstChild("Cake Prince") then
                        Tween(Rep:FindFirstChild("Cake Prince").HumanoidRootPart.CFrame * CFrame.new(2,20,2))

                    -- ================= FARM MOB MỞ GƯƠNG =================

                    elseif Mirror.Transparency == 1 then
                        if (game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker")) then
                            for _, v in pairs(Enemies:GetChildren()) do
                                if (v.Name == "Cookie Crafter"
                                or v.Name == "Cake Guard"
                                or v.Name == "Baking Staff"
                                or v.Name == "Head Baker")
                                and v:FindFirstChild("Humanoid")
                                and v:FindFirstChild("HumanoidRootPart")
                                and v.Humanoid.Health > 0 then

                                    repeat
                                        task.wait(_G.Fast_Delay)

                                        AutoHaki()
                                        bringmob = true
                                        EquipTool(_G.SelectWeapon)

                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60,60,60)

                                        FarmPos = v.HumanoidRootPart.CFrame
                                        MonFarm = v.Name

                                        Tween(v.HumanoidRootPart.CFrame * Pos)
                                        AttackNoCoolDown()

                                    until not _G.CakePrince
                                        or _G.PirateRaiding
                                        or _G.Elite
                                        or not v.Parent
                                        or v.Humanoid.Health <= 0
                                        or Mirror.Transparency == 0
                                        or Rep:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]")
                                        or Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]")

                                    bringmob = false
                                end
                            end
                        else
                            Tween(CFrame.new(- 2003.932861328125, 380.4824523925781, - 12561.0185546875))
                        end
                    end

                end)
            end
        end

        CakePrinceThread = nil
    end)
end
task.spawn(function()
    while task.wait(0.05) do
        if _G.AutoLevel then
            if not _G.PirateRaiding and not _G.Elite then
                StartAutoLevel()
            end
        end
        if _G.AutoNear then
            if not _G.PirateRaiding and not _G.Elite then
                StartAutoNear()
            end
        end
        if _G.CakePrince then
            if not _G.PirateRaiding and not _G.Elite then
                StartCakePrince()
            end
        end
    end
end)
