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

db = mmdb(db)

if not db then os.exit(1) end

db:exec[[
  CREATE TABLE baise (
    id INTEGER PRIMARY KEY,
    content TEXT
  );
]]

db:exec[[
  INSERT INTO baise (content) VALUES ('FUCK THE WORLD');
]]

for row in db:nrows("SELECT * FROM baise") do
   Write(row.id.." "..row.content.."<br>")
end

```

Now you are like databaise professionals.

written by 752963e64 the 4/07/2022 d/m/y - for the free doom all the code here use MIT style license.