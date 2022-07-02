# radbean - fqdn arsher.

"What's nice when u know what u talking about... Is that you know what u talking about :)"

#### In the state of things

- you can "actually make a module" from this fqdn arsher implementation.

- enjoy.

### fully qualified domain name ooff.

```lua
-- fqdn.lua

fqdn = {
  "dosomething.dev",
  "xxx.pinkypig.com",
  "62.210.114.224", -- this is my server ip don't be arsh with her.
}

function OnHttpRequest()
  local hostname = Sha1( GetHost() )
  local match = false
  for _, v in ipairs(fqdn) do
    if hostname == Sha1(v) then
      match = true
      -- because hostname own an unsafe string.
      hostname = v -- notice we grab safe strings anywayz...
      break
    end
  end

  if not match then
    print('\e[01;35mHOSTNAME DOESN\'T MATCH\e[0m')
    SetHeader('Connection', 'close')
    ServeError(404)
    return
  else
    print('\e[01;33mHOSTNAME OK\e[0m')
  end
end

```

Now you can filter like professionals.

written by 752963e64 the 2/07/2022 d/m/y - for the free doom all the code here use MIT style license.