# radbean - sql lock.

"What's nice when u know what u talking about... Is that you know what u talking about :)"

#### In the state of things

- you can "actually make a module" from this lock implementation.

- You can port to any languages! :D

- It's the basis... ooof. Stuck to it :D

- enjoy.

#### It also show up the reality

that you don't only have to perform db queries... but also to know what you talking about :D

### functional and limited lock

```lua
-- dblock.lua
local dblock = false
local ltlock = 60 -- 1sec

function acquireDbLock()
  local cnt, retlock = 0, nil
  while dblock do
    Sleep(1/60)
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
-- Olock.lua

Olock = {}

-- object:new()
-- @object
function Olock:new()
  o = { lock = false, limit = 120 }
  setmetatable( o, self )
  self.__index = self
  return o
end

-- object:limitLock(l)
-- setup your own limit
function Olock:limitLock(l)
  if type(l) == 'number' then
    self.limit = l
  end
end

-- object:acquireLock()
-- @true if you aquires a lock
-- @false if it reaches waiting limit.
function Olock:acquireLock()
  local cnt, retlock = 0, nil
  while self.lock do
    Sleep(1/60)
    cnt = cnt + 1
    if cnt >= self.limit then
      retlock = true
      break
    end
  end

  if retlock then
    return false
  else
    self.lock = true
    return self.lock
  end
end

-- object:resetLock()
-- unconditionaly
function Olock:resetLock()
  self.lock = false
end

return Olock

-- usage

local mylock = require "Olock"

local somethinglock = mylock:new()

if somethinglock:acquireLock() then
  -- locked in ooof
  somethinglock:resetLock()
end
```

Now you can have lock to whatever u wishes :)

written by 752963e64 the 2/07/2022 d/m/y - for the free doom all the code here use MIT style license.
