local Labels = Catalog.Labels

local channel = Ext.Net.CreateChannel(ModuleUUID, "BasicActions_Labels")

local function log(...)
    print("[BasicActions]", ...)
end

local function isSingleEntry(counts)
    local first = next(counts)
    return first ~= nil and next(counts, first) == nil
end

local function applyCounts(counts, source)
    local applied, fromGame, fromFallback = 0, 0, 0
    local logEach = isSingleEntry(counts)

    for spell, count in pairs(counts) do
        local handles = Labels[spell]
        if handles then
            local ownHandle, vanillaHandle = handles[1], handles[2]
            local baseName = Ext.Loca.GetTranslatedString(vanillaHandle)

            if baseName and baseName ~= "" then
                fromGame = fromGame + 1
            else
                baseName = Ext.Loca.GetTranslatedString(ownHandle)
                fromFallback = fromFallback + 1
                log("sem nome do jogo:", spell, "handle:", vanillaHandle)
            end

            if baseName and baseName ~= "" then
                local text = baseName .. " (" .. count .. ")"
                Ext.Loca.UpdateTranslatedString(ownHandle, text)
                applied = applied + 1
                if logEach then
                    log("escrito", ownHandle, "=", text,
                        "| relido:", Ext.Loca.GetTranslatedString(ownHandle))
                end
            end
        end
    end

    log("rótulos", source, "— aplicados:", applied,
        "| nome do jogo:", fromGame, "| fallback:", fromFallback)
end

channel:SetHandler(function(counts)
    if type(counts) == "table" then applyCounts(counts, "push") end
end)

Ext.Events.SessionLoaded:Subscribe(function()
    channel:RequestToServer({}, function(reply)
        if type(reply) == "table" then applyCounts(reply, "request") end
    end)
end)
