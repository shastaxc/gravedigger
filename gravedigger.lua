_addon.name = 'gravedigger'
_addon.author = 'Shasta'
_addon.version = '0.1'
_addon.language = 'english'
_addon.commands = {'gravedigger, gd'}

local packets = require('packets')

windower.register_event('incoming chunk', function(id,original,modified,injected,blocked)
  if id == 0x00E then
    local parsed = packets.parse('incoming', original) or false
    local mob = windower.ffxi.get_mob_by_id(parsed['NPC']) or false

    if parsed and mob and parsed['HP %'] == 0 and T{2,3}:contains(parsed['Status']) then
      parsed['Mask'] = 32
      return packets.build(parsed)
    end
  end
end)
