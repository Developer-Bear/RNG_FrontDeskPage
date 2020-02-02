Config = {}

-- How far away from the desk the player can be before the text is displayed
Config.TextDrawDistance = 3

-- To prevent spamming (to disable cooldown set to 0)
Config.CoolDown = 1 -- MINUTES, do not use decimals

-- Edit to change the notification sound
Config.SoundDirectory = '5_SEC_WARNING'
Config.SoundName = 'HUD_MINI_GAME_SOUNDSET'

-- Use Mythic Notify? 
Config.UseMythicNotify = true

Config.Locations = {
    MissionRowPD = {
        DisplayName = 'Mission Row PD', -- How it displays in the notification to the whitelisted players
        Coords = { x = 441.47, y = -980.26, z = 31.89}, -- Pager Coords
        JobsToPage = { -- Jobs that will receive a notification (supports multiple)
            'police',
            'ambulance'
        }
    },

    SandySO = {
        DisplayName = 'Sandy Shores SO', -- How it displays in the notification to the whitelisted players
        Coords = { x = 1854.45, y = 3689.18, z = 35.32}, -- Pager Coords
        JobsToPage = { -- Jobs that will receive a notification (supports multiple)
            'police',
            -- 'ambulance'
        }
    },

    PaletoSO = {
        DisplayName = 'Paleto Bay SO', -- How it displays in the notification to the whitelisted players
        Coords = { x = -448.85, y = 6013.74, z = 32.78}, -- Pager Coords
        JobsToPage = { -- Jobs that will receive a notification (supports multiple)
            'police',
            -- 'ambulance'
        }
    },

    PillboxMedical = {
        DisplayName = 'Pillbox Hospital', -- How it displays in the notification to the whitelisted players
        Coords = { x = 308.04, y = -595.96, z = 44.15}, -- Pager Coords
        JobsToPage = { -- Jobs that will receive a notification (supports multiple)
            --'police',
            'ambulance'
        }
    }
}