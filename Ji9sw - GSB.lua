util.require_natives("2944a")

local sendToChat = false
local networked = false
local SWYS = false

function readLinesFromFile(filename)
    local lines = {}
    local file = io.open(filename, "r")
    if not file then
        util.toast("File not found: " .. filename)
        return lines
    end

    for line in file:lines() do
        table.insert(lines, line)
    end

    file:close()
    return lines
end

local GSB_PICKUP_LINES_DIR = filesystem.scripts_dir() .. "lib/ji9sw/"
local pickupLines = readLinesFromFile(GSB_PICKUP_LINES_DIR .. "GSBGoodLines.txt")
local outPickupLines = readLinesFromFile(GSB_PICKUP_LINES_DIR .. "GSBOutragiousLines.txt")

players.add_command_hook(function(pid, root)
    menu.player_root(pid):divider("Get Some Bitches")

    local womenMenu = root:list('Get Some Bitches', {}, 'A selection of options to increase your collection of females')

    womenMenu:toggle('See What Youre Sending', {}, 'See what you send when you send an SMS', function (on)
        SWYS = on
    end)

    womenMenu:toggle('Send Messages To Chat', {}, 'Do these options send messages to their phone or in the chat \nONLY WORKS ON FRIENDS OR CREW MEMBERS', function (on)
        sendToChat = on
    end)

    womenMenu:toggle('Chat Messages Networked', {}, 'Do the lines appear for other people besides your targeted female', function (on)
        networked = on
    end)

    local function sendRandomLine(lines)
        local randomIndex = math.random(1, #lines)
        local line = lines[randomIndex]
        if sendToChat then
            if networked then
                chat.send_message(line, false, true, true)
            else
                chat.send_targeted_message(pid, players.user(), line, networked)
            end
        else
            players.send_sms(pid, line)
            if SWYS then util.toast("Sent Line: " .. line) end
        end
    end

    womenMenu:action('Send Good Pick-Up Line', {}, 'Sends a pickup line from a random selection', function (s)
        sendRandomLine(pickupLines)
    end)

    womenMenu:action('Send Outragious Pick-Up Line', {}, 'Sends a pickup line from a random selection', function (s)
        sendRandomLine(outPickupLines)
    end)

    util.create_thread(function()
        if filesystem.exists(GSB_PICKUP_LINES_DIR .. "JI9SW.png") then
            local logo = directx.create_texture(GSB_PICKUP_LINES_DIR .. "JI9SW.png")

            for i = 1, 3 * 60 do
                directx.draw_texture(logo, 0.05, 0.05, 5, 0.5, 0.5, 0.5, 0.0, 1.0, 1.0, 1.0, 1.0)
                directx.draw_text(0.1, 0.5, "GSB Script", ALIGN_CENTRE_LEFT, 1, 0, 0, 0, 1)
                directx.draw_text(0.1, 0.53, #pickupLines + #outPickupLines .. " Pickup Lines Loaded", ALIGN_CENTRE_LEFT, 0.5, 0, 0, 0, 1)
                util.yield(1 / 60)
            end
        end
        util.stop_thread()
    end)
end)
