local url = ""

function enviarDadosServidor()
    local tbl = toJSON({
        serverName = getServerName(),
        players = getPlayerCount(),
        ip = getServerConfigSetting("serverip"),
        status = "Online"
    })

    local options = {
        method = "POST",
        headers = {
            ["Content-Type"] = "application/json"
        },
        postData = string.sub(tbl, 2, -2),
    }
    fetchRemote(url, options, callBack)
end
        
function callBack(response, err)
end

setTimer(enviarDadosServidor, 60000, 0)
enviarDadosServidor()
