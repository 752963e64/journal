# radbean - sql lock.

"What's nice when u know what u talking about... Is that you know what u talking about :)"

#### In the state of things

- you can "actually make a module" from this lock implementation.

- throwing ```dblock``` out of global scope using it locally, simply...


### functional and limited lock

```lua
-- dblock.lua
local dblock = false
local ltlock = 60 -- 2sec

function aquireDbLock()
  local cnt, retlock = 0, nil
  while dblock do
    Sleep(1/30)
    cnt = cnt + 1
    if cnt >= ltlock then
      retlock = true
      break
    end
  end

  if retlock then
    return false
  else
    dblock = true
    return dblock
  end
end

function resetDbLock()
  dblock = false
  return
end

-- usage...
function lockedInsert( tbl, fld, val )
  if aquireDbLock() then
    -- database action here
    resetDbLock()
  end
  return
end
```

Now you can insert without blending :D


### object and unlimited lock

Here is the object version, this let you multiply locks for whatever u wishes to lock. :)

```lua
-- olock.lua

olock = {}

function olock:new()
  o = { lock = false }
  setmetatable( o, self )
  self.__index = self
  return o
end

function olock:aquireLock()
  while self.lock do Sleep(1/30) end
  self.lock = true
  return self.lock
end

function olock:resetLock()
  self.lock = false
  return
end

return olock

-- usage

local mylock = require "olock"

local somethinglock = mylock:new()

if somethinglock:aquireLock() then
  -- locked in ooof
  somethinglock:resetLock()
end
```

Now you can have lock to whatever u wishes :)

written by 752963e64 the 1/07/2022 d/m/y - for the free doom all the code here use MIT style license.
