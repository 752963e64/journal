# radbean - disposable sQale databaise :D.

"What's nice when u know what u talking about... Is that you know what u talking about :)"

#### In the state of things

- demonstrate open/forget databaise :D

- Use case is on your own... get a brain :)

- Now you can databaise everything in memory at anytime and free databaise like it's a klinex! :D...

### Disposable mysQale.

```lua
-- mysQale.lua
-- global decl
local sqlite3 = require 'lsqlite3'

function mmdb(mm)
  mm = sqlite3.open_memory()
  return mm
end

-- end module
```

```lua
-- USAGE :D
require 'mysQale'

db1 = mmdb(db1)
db2 = mmdb(db2)

if not db1 and not db2 then os.exit(1) end

db1:exec[[
  CREATE TABLE souch (
    id INTEGER PRIMARY KEY,
    content TEXT
  );
]]

db2:exec[[
  CREATE TABLE souch (
    id INTEGER PRIMARY KEY,
    content TEXT
  );
]]

db1:exec[[
  INSERT INTO souch (content) VALUES ('covid42');
]]

db2:exec[[
  INSERT INTO souch (content) VALUES ('Covid43');
]]

for row in db1:nrows("SELECT * FROM souch") do
   Write(row.id.." "..row.content.."<br>")
end


for row in db2:nrows("SELECT * FROM souch") do
   Write(row.id.." "..row.content.."<br>")
end

db1 = nil -- ooops db1 is gone...

db1:exec[[
  CREATE TABLE souch (
    id INTEGER PRIMARY KEY,
    content TEXT
  );
]]
-- doesn't twerk anymoore, feels sad :/
-- what does happen really... it is costly to zeroz memory...
-- so db1 entry just get prefixed a null byte :)
-- WHAT! data still in memory so it leaks...
-- nah really as you stay processus owner...
-- memory is gonna be reused... that's all :)
-- no needed debugger involved... my feel debugged it :D

-- I databaise a lot... more shit soon :)

```

Now you are like databaise professionals.

### But still...

You thought we were stuck at using all this **crap**? Heh... no. sQale is turned to formal usage for lambda and average... (Which also bring a surprising load of risk at handling... no demo, it's gonna be worst than an horror movie :D)

#### In the state of things

- I demonstrate in memory database from programming language...

```lua
-- Mmpsq.lua

-- some cool ideaz will be shown...
-- free schema :D
-- programmed queries :)
-- on demand storage
-- on demand load :)

Mmpsq = {}


-- object:new()
-- @object
function Mmpsq:new()
  o = { db = {} }
  setmetatable( o, self )
  self.__index = self
  return o
end


-- object:insert(schema)
-- setup your own limit
function Mmpsq:insert( schema )
  table.insert( self.db, schema )
end


function Mmpsq:lst( struct )
  if struct ~= 'tables' then
    return nil
  end

  --[[
  legend:
    tid = table id
    ts  = table structure
    fid = caller field id
    f   = field
  ]]

  for tid, ts in ipairs(self.db) do
    print(i, v)
    for fid, f in ipairs(struct) do
      print(fid, v[f])
    end
  end
end

return Mmpsq

--[[

-- usage, look at this :)

require "Mmpsq"

local lol = Mmpsq:new()

for l=1000, 1, 1 do
  lol:insert({test="lool", subid=2, Ifloat=1.0002})
end

lol:insert({test="lool", subid=2, Ifloat=1.0002, schema='entirely free', cleverness=math.maxInteger })

-- the machine handle estate ... schema changes can be tracked ezly :)

lol:lst({'test', 'subid', 'Ifloat'})

]]

```

Memory programmed structure query... I can go deeper still :)

Now you are like memory professionals.

written by 752963e64 the 4/07/2022 d/m/y - for the free doom all the code here use MIT style license.