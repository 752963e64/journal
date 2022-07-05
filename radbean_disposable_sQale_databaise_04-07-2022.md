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

-- I databaise a lot... more shit soon :)

```

Now you are like databaise professionals.

written by 752963e64 the 4/07/2022 d/m/y - for the free doom all the code here use MIT style license.