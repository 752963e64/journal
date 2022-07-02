# radbean - hex hash burst.

"What's nice when u know what u talking about... Is that you know what u talking about :)"

#### In the state of things

- you can "actually make a module" from this binaryHex handle implementation.

- enjoy.

### hex that binary suit ooff.

```lua
-- hexhashhandle.lua
-- in french exagère :D

function binaryHex(bin)
  local hexstr = ""
  if str ~= '' then
    for l=#bin,1,-1 do
      hexstr = "%.2x" % {string.byte( (string.sub(bin, l) ) )} .. hexstr
    end
  end
  if hexstr ~= "" then
    return hexstr
  else
    return nil
  end
end

```

Now you can filter like professionals.

written by 752963e64 the 2/07/2022 d/m/y - for the free doom all the code here use MIT style license.