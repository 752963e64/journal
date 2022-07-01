# radbean - sql lock.

```lua
sqlite3 = require "lsqlite3"
db = sqlite3.open_memory()

dblock = false

function isDblock()
  return dblock
end

db:exec[[
  CREATE TABLE manual (
    id INTEGER PRIMARY KEY,
    sometext TEXT
  );
]]

function lockedInsert( tbl, fld, val )
  if not isDblock() then
    dblock = true
    while not isDblock() do
      db:exec[[ INSERT INTO ]] .. tbl .. [[ ( ]] .. fld .. [[ ) VALUES ( ]].. val .. [[ );]]
      dblock = true
      break
    end
  end
  return
end
```

Now you can insert without blending :D

written by 752963e64 the 1/07/2022 d/m/y 
