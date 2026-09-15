task.spawn(function()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    -- تشغيل فحص مستمر وبدون توقف لضمان عدم اختفاء الهاك
    while task.wait(1) do
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local char = player.Character
                -- التأكد من أن اللاعب يمتلك جسماً حياً داخل اللعبة
                if char:FindFirstChild("HumanoidRootPart") and not char:FindFirstChild("Player_ESP") then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "Player_ESP"
                    highlight.FillColor = Color3.fromRGB(255, 0, 0) -- لون أحمر ساطع
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- حواف بيضاء
                    highlight.FillTransparency = 0.4
                    highlight.OutlineTransparency = 0
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop -- الرؤية عبر الجدران
                    highlight.Parent = char
                end
            end
        end
    end
end)
