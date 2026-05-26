local Module = {
    _initialized = false,
    shared = nil,
    _replicatedStorage = nil,
    _viewmodels = nil,
    _attachmentModules = {},
    config = {
        skin = "Default",
        charm = "Default",
    },
    options = {
        skin = { "Default", "BlackCamo", "BlackIce", "Blue", "CandyCane", "CandyCaneCrowbar", "CarbonFiber", "Cardboard", "CheckeredSkin", "ClassicAA12", "CrackedEarth", "DarkRedCamo", "DeepRed", "DesertCamo", "Diamond", "FestiveLightsM4", "ForestCamo", "FrenchSticker", "Ghillie", "GhostShipSkin", "GhostSkin", "GhostStickerSkin", "Golden", "Green", "HalloweenParty", "HazardMP7", "HazardSkin", "HotRedL85", "IceDrone", "Kalash", "Karambit", "MakeshiftBeretta", "MedievalShield", "NeonShapesM249", "OilSpill", "OrnamentBall", "PumpkinBomb", "PurpleFadeC775", "Red", "RustyAUG", "ScytheHammer", "Skulls", "SnowCamo", "Space", "SpiderHookSkin", "SpiderWebSkin", "Splattered", "Steyr", "Tan", "Toxic", "WastelandRSh12", "White", "Yellow" },
        charm = { "Default", "8BallCharm", "AceCard", "BananaCharm", "BellCharm", "BlueBall", "BulletCharm", "ChristmasTreeCharm", "ColorfulSquares", "DiamondCharm", "DogTagCharm", "EyeballCharm", "GhostCharm", "LoveHeart", "LuckyCharm", "PumpkinCharm", "S1Bronze", "S1Champion", "S1Diamond", "S1Gold", "S1Platinum", "S1Silver", "S2Bronze", "S2Champion", "S2Diamond", "S2Gold", "S2Platinum", "S2Silver", "SnowGlobeCharm", "SnowflakeCharm", "TargetPracticeCharm" },
    },
}

function Module:setShared(shared)
    if type(shared) ~= "table" then
        return false, "shared must be table"
    end

    self.shared = shared
    if type(shared.applyToEnv) == "function" then
        shared:applyToEnv()
    end

    return true
end

function Module:_getLocalPlayerGun()
    local viewmodels = self._viewmodels
    if not viewmodels then
        return nil
    end

    local localViewmodel = viewmodels:FindFirstChild("LocalViewmodel")
    if not localViewmodel then
        return nil
    end

    for _, child in ipairs(localViewmodel:GetChildren()) do
        if child:FindFirstChild("Gun") then
            return { instance = child }
        end
    end

    for _, child in ipairs(localViewmodel:GetChildren()) do
        if child:FindFirstChild("Shield") then
            return { instance = child }
        end
    end

    return nil
end

function Module:_findAttachmentAsset(moduleFolder, assetName)
    if not moduleFolder then
        return nil
    end

    local directChild = moduleFolder:FindFirstChild(assetName)
    if directChild then
        return directChild
    end

    for _, descendant in ipairs(moduleFolder:GetDescendants()) do
        if descendant.Name == assetName then
            return descendant
        end
    end

    return nil
end

function Module:_applyAttachment(moduleName, settingKey)
    local gun = self:_getLocalPlayerGun()
    if not gun then
        return false, "local gun not found"
    end

    local attachmentModule = self._attachmentModules[moduleName]
    if not attachmentModule then
        return false, "attachment module not found: " .. tostring(moduleName)
    end

    local selectedValue = self.config[settingKey]
    if selectedValue == "Default" then
        attachmentModule.remove(attachmentModule, gun)
        return true
    end

    local assetModule = self:_findAttachmentAsset(attachmentModule.module, selectedValue)
    if not assetModule then
        return false, "attachment asset not found: " .. tostring(selectedValue)
    end

    attachmentModule.remove(attachmentModule, gun)
    task.wait()
    attachmentModule.apply(require(assetModule), gun)
    return true
end

function Module:init(force)
    if self._initialized and not force then
        return true
    end

    self._replicatedStorage = game:GetService("ReplicatedStorage")
    self._viewmodels = workspace:WaitForChild("Viewmodels")

    local attachmentRoot = self._replicatedStorage.Modules.Items.Item.Attachment
    local loadedModules = {}
    for _, moduleScript in ipairs(attachmentRoot:GetChildren()) do
        local okRequire, attachmentModule = pcall(require, moduleScript)
        if okRequire and type(attachmentModule) == "table" then
            loadedModules[moduleScript.Name] = attachmentModule
            attachmentModule.module = moduleScript
        end
    end

    self._attachmentModules = loadedModules
    self._initialized = true
    return true
end

function Module:load(force)
    return self:init(force)
end

function Module:setOption(key, value)
    if self.config[key] == nil then
        return false, "unknown attachment key: " .. tostring(key)
    end

    self.config[key] = tostring(value)
    return true
end

function Module:updateConfig(newConfig)
    if type(newConfig) ~= "table" then
        return false, "config must be table"
    end

    for key, value in pairs(newConfig) do
        if self.config[key] ~= nil then
            self.config[key] = tostring(value)
        end
    end

    return true
end

function Module:getOptions()
    return self.options
end

function Module:getConfig()
    return self.config
end

function Module:applyAll()
    local okInit, initErr = self:init(false)
    if not okInit then
        return false, initErr
    end

    local order = {
        { module = "Skin", key = "skin" },
        { module = "Charm", key = "charm" },
    }

    for _, entry in ipairs(order) do
        local okApply, applyErr = self:_applyAttachment(entry.module, entry.key)
        if okApply == false then
            return false, applyErr
        end
    end

    return true
end

return Module
