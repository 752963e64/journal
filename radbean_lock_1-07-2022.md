# radbean - sql lock.

"What's nice when u know what u talking about... Is that you know what u talking about :)"

#### In the state of things

- you can "actually make a module" from this lock implementation.

- throwing ```dblock``` out of global scope using it locally, simply...


```lua
sqlite3 = require "lsqlite3"
db = sqlite3.open_memory()

dblock = false

function aquireDbLock()
  while dblock do Sleep(1/30) end
  dblock = true
  return dblock
end

function resetDbLock()
  dblock = false
  return
end

db:exec[[
  CREATE TABLE manual (
    id INTEGER PRIMARY KEY,
    sometext TEXT
  );
]]

function lockedInsert( tbl, fld, val )
  if aquireDbLock() then
    db:exec[[ INSERT INTO ]] .. tbl .. [[ ( ]] .. fld .. [[ ) VALUES ( ]].. val .. [[ );]]
    resetDbLock()
  end
  return
end
```

Now you can insert without blending :D

written by 752963e64 the 1/07/2022 d/m/y 
