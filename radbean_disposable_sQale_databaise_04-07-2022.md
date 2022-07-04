# radbean - disposable sQale databaise :D.

"What's nice when u know what u talking about... Is that you know what u talking about :)"

#### In the state of things

- Now you can databaise everything in memory at anytime and free databaise like it's a klinex! :D...

### Disposable cake.

```lua
-- mysQale.lua
-- global decl
sqlite3 = require 'lsqlite3'

function mmdb(mm)
  if not mm then return end
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
  CREATE TABLE baise (
    id INTEGER PRIMARY KEY,
    content TEXT
  );
]]

db2:exec[[
  CREATE TABLE baise (
    id INTEGER PRIMARY KEY,
    content TEXT
  );
]]

db1:exec[[
  INSERT INTO baise (content) VALUES ('FUCK THE WORLD');
]]

db2:exec[[
  INSERT INTO baise (content) VALUES ('FUCKING AUTISTS!');
]]

for row in db1:nrows("SELECT * FROM baise") do
   Write(row.id.." "..row.content.."<br>")
end


for row in db2:nrows("SELECT * FROM baise") do
   Write(row.id.." "..row.content.."<br>")
end

-- I databaise a lot... more shit soon :)

```

Now you are like databaise professionals.

written by 752963e64 the 4/07/2022 d/m/y - for the free doom all the code here use MIT style license.