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
-- Mysq.lua

-- some cool ideaz will be shown...
-- free schema :D
-- programmed queries :)

Mysq = {}

-- object:new()
-- @object
function Mysq:new()
  o = { db = {} }
  setmetatable( o, self )
  self.__index = self
  return o
end

-- object:insert(schema)
function Mysq:insert(schema)
  if type(schema) ~= 'table' then
    table.insert(self.db, schema)
  end
end

-- object:select()
function Mysq:select()
end

-- object:delete()
-- unconditionaly
function Mysq:delete()
end

return Mysq

-- usage

-- local mylock = require ""

-- local somethinglock = Mysq:new()

--somethinglock:insert({test="lool", subid=2})
--somethinglock:select()

```

written by 752963e64 the 4/07/2022 d/m/y - for the free doom all the code here use MIT style license.