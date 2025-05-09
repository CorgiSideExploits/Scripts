--[[
	
	Title Bar Editor Script By CorgiScripter
	Discord Server Invite: https://discord.gg/SBr3SXFpQA
	Property Of CorgiScripter: DO NOT SKID
	
--]]

Title                  = "TITLE DISPLAY HERE";
AboutMessage           = "Thank you for using (TITLENAME)! More to come in the future!";
BackgroundColor        = Color3.fromRGB(57, 235, 220)
BackgroundTransparency = 0.8
NotifyWhenChanged = true


-- Variables (I recommend you not change this stuff tehee)
Players     = game:GetService("Players");
LocalPlayer = Players.LocalPlayer;
PUI         = LocalPlayer.PlayerGui;

Home         = PUI['Home'];
hud          = Home['hud'];
Topbar       = hud['Topbar'];
Pulldownmenu = Topbar['Pulldownmenu'];
titleBar     = Topbar['titleBar'];
Frame        = Pulldownmenu['Frame']
Desc         = Frame['Description']

task.spawn(function()
	if NotifyWhenChanged then
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = ("Successfully Changed Title Bar Text To: "..Title);
			Text = ("Successfully Changed About Message To: "..AboutMessage);
		})
	end
	local titletask = function()
		task.wait()

		titleBar.Title.Text             = Title;
		Desc.Text                       = AboutMessage;
		titleBar.BackgroundColor3       = BackgroundColor;
		titleBar.BackgroundTransparency = BackgroundTransparency
	end
	while task.wait() do
		pcall(function()
			titletask()
		end)
	end
end)
