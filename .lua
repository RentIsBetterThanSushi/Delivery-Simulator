local library = loadstring(game:HttpGet(('https://pastebin.com/raw/FsJak6AT')))()
local w = library:CreateWindow("delivery poop simulator")
local b = w:CreateFolder("AutoFarm")
local f = w:CreateFolder("Get Items")
local e = w:CreateFolder("Mix")
local u = w:CreateFolder("Credits") 
--Toggle
b:Toggle("PickUpBoxesSpawn",function(bool)
    shared.toggle = bool
    PickUpBoxesSpawn = bool
end)

b:Toggle("PlaceBoxesBase",function(bool)
    shared.toggle = bool
    PlaceBoxesBase = bool
end)

b:Toggle("PickUpBoxesBase",function(bool)
    shared.toggle = bool
    PickUpBoxesBase = bool
end)

b:Toggle("Auto sell box",function(bool)
    shared.toggle = bool
    AutoSellBoxes = bool
end)

local Jack = "starter jack thing"
Jacks = {}
for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Jacks:GetChildren()) do
    Jacks[i] = v.Name
end

f:Dropdown("slect Jack",Jacks,true,function(mob)
    Jack = mob
end)

f:Button("get juck",function()
    game:GetService("ReplicatedStorage").Remotes.SelectItem:FireServer("Jacks",Jack)
end)

local Vehicle = "start van"
Vehicles = {}
for i,v in pairs(game:GetService("ReplicatedStorage").CarModels:GetChildren()) do
    Vehicles[i] = v.Name
end

f:Dropdown("slect the vehicle",Vehicles,true,function(mob)
    Vehicle = mob
end)

f:Button("get car, vehicle whatever",function()
   game:GetService("ReplicatedStorage").Remotes.SelectItem:FireServer("Vehicles",Vehicle)
end)

f:Button("get robux shelf",function()
    for i=1,4 do
        game:GetService("ReplicatedStorage").Remotes.SelectItem:FireServer("Racks","Starter Pack Shelf")
    end
end)

e:Toggle("AntiAfk",function(bool)
    shared.toggle = bool
    AntiAfk = bool
end)
--Credits
u:Button("rent#83925",function()
    setclipboard("rent#8392")
end)
 
u:Button("Roblox profile:",function()
    setclipboard("https://www.roblox.com/users/18680596/profile")
end)

while wait() do
    if PickUpBoxesSpawn == true then
        string = game:GetService("Players").LocalPlayer.PlayerGui.Main.Jack.Capacity.Text
        a,b = string:match("(.+)/(.+)")
        for i,v in pairs(game:GetService("Workspace").GameLogic.SpawnedBoxes:GetChildren()) do
            if a ~= b then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.MeshPart.Position)
                game:GetService("ReplicatedStorage").Remotes.PickupBox:InvokeServer(v)
            end
        end
    end
    
    if PlaceBoxesBase == true then
        for i,v in pairs(game:GetService("Workspace").GameLogic.Warehouses:GetDescendants()) do
            if v.Name == "Owner" and v.ClassName == "ObjectValue" then
                if v.Value == game.Players.LocalPlayer then
                    for i,v1 in pairs(v.Parent.Racks:GetChildren()) do
                        string = v1.Center.RackCapacity.Capacity.Text
                        a,b = string:match("(.+)/(.+)")
                        if a ~= b then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v1.Center.Position)
                            game:GetService("ReplicatedStorage").Remotes.StackRack:InvokeServer(v1)
                        end
                    end
                end
            end
        end
    end
    
    if PickUpBoxesBase == true then
        for i,v in pairs(game:GetService("Workspace").GameLogic.Warehouses:GetDescendants()) do
            if v.Name == "Owner" and v.ClassName == "ObjectValue" then
                if v.Value == game.Players.LocalPlayer then
                    for i,v1 in pairs(v.Parent.Racks:GetChildren()) do
                        for i,v2 in pairs(v1.Boxes:GetChildren()) do
                            string = game:GetService("Players").LocalPlayer.PlayerGui.Main.Carry.Capacity.Text
                            a,b = string:match("(.+)/(.+)")
                            if a ~= b then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v2.MeshPart.Position)
                                game:GetService("ReplicatedStorage").Remotes.PickupBox:InvokeServer(v2)
                            end
                        end
                    end
                end
            end
        end
    end
    
    if AutoSellBoxes == true then
        for i,v in pairs(game:GetService("Workspace").GameLogic.DeliveryPoints:GetChildren()) do
            game:GetService("ReplicatedStorage").Remotes.SellBox:InvokeServer(v)
        end
    end
    
    if BuyRacks == true then
        game:GetService("ReplicatedStorage").Remotes.SelectItem:FireServer("Racks",Rack)
    end
    
    if AntiAfk == true then
        local bb=game:service'VirtualUser'
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
    end
end
