Config = {}

Config.Blips = {
    {title = "Vinewood Garden Apartments", colour = 3, id = 475, x = 327.51425, y = -72.64795, z = 70.924636}
}

Config.Zones = {
    {coords = vec3(329.16, -68.46, 72.89), name = 'enter_apartment', event = 'ud-apartments:enterApartmentserverside', label = 'Enter Apartment'},
    {coords = vec3(334.38, -53.88, 131.58), name = 'exit_apartment', event = 'ud-apartments:exitApartmentserverside', label = 'Exit Apartment'},
    {coords = vec3(333.11, -58.51, 131.58), name = 'open_stash', event = 'ud-apartments:OpenStorage', label = 'Open Stash'},
    {coords = vec3(334.56, -56.06, 131.58), name = 'change_clothing', event = 'qb-clothing:client:openOutfitMenu', label = 'Change Clothes'},
}

Config.StashLabel = 'Apartment Stash'
Config.StrageSlots = 70
Config.StorageWeight = 100000

Config.EnterApartmentCoords = { x = 334.13674, y = -54.63047, z = 131.57298 }
Config.EnterApartmentHeading = 161.00672

Config.ExitApartmentCoords = { x = 330.60385, y = -73.74017, z = 70.924545 }
Config.ExitApartmentHeading = 113.99302