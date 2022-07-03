# radbean - disposable cake.

"What's nice when u know what u talking about... Is that you know what u talking about :)"

#### In the state of things

- Now you can bake speculo cake.

### Disposable cake.

```lua
-- mycake.lua
-- global decl

function myCake( cname, cvalue, cexpires, cdomain, cpath, csecure, chttponly, csamesite )
  local tstp = "%.0f" % { GetTime() }
  if type(cexpires) ~= 'number' then
    cexpires = 259200  -- +3 Days
  end

  tstp = tstp + cexpires
  SetCookie( cname or 'disposable-cake', cvalue or 'absolutly_oooff.', {
    Expires = FormatHttpDateTime( tstp ),
    Domain = cdomain or 'example.dev',
    Path = cpath or '/',
    Secure = csecure or true,
    HttpOnly = chttponly or true,
    SameSite = csamesite or 'Strict'
  })
end


```

Now you are like professionals.

written by 752963e64 the 2/07/2022 d/m/y - for the free doom all the code here use MIT style license.