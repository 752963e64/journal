# radbean - unable to keep a slice of data in memory between 2 requests :D

"What's nice when u know what u talking about... Is that you know what u talking about :)"

#### In the state of things

- Yes I hadn't test any of the shit I wrote precedently, cuz it should have worked... however it's not. damn design. :D

- Now you are aware SQL and brain usage can be required to store data in a persisting manner.

- I need write that shitty HTTP handler myself...

### Damn design that kills a clever attemp to do things originally :D.

From module to variable and everything... it's all freed badly fourked... adding issue to the real radbean **led topic deletion :D**

### Damn world of clowns :D

```lua
-- mycake.lua
-- global decl

-- limitation is that it seems to be in need of routing first... to grab back cookie.
-- I'll look source when I feel like it's limiting my input seriously...

cookie_store = {}

function myCake( cname, cvalue, cexpires, cdomain, cpath, csecure, chttponly, csamesite )
  local tstp = "%.0f" % { GetTime() }
  if type(cexpires) ~= 'number' then
    cexpires = 259200  -- +3 Days
  end

  if cvalue then
    table.insert(cookie_store, cvalue)
    print( "COOKIE in", #cookie_store )
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

function isMyCake( ck )
  local ret = nil
  
  if type(ck) ~= 'string' then
    return ret
  end
  
  print("ooops it's gone...", ck, #cookie_store )
  
  return nil
end


```

### Since I been deleted :D

- writing engine trick attemp here :)


#### might possibly conserve datas thru repuesta :)

```lua
-- .init.lua

function OnProcessCreate()
  print('\e[01;36mOnProcessCreate()...\e[0m')
end

function OnProcessDestroy(pid)
  print('\e[01;36mOnProcessDestroy('.. pid ..')...\e[0m')
end

function OnWorkerStart()
  print('\e[01;36mOnWorkerStart()...\e[0m')
end

function OnWorkerStop()
  print('\e[01;36mOnWorkerStop()...\e[0m')
end



```

Now you are like professionals.

written by 752963e64 the 23/07/2022 d/m/y - for the free doom all the code here use MIT style license.