# radbean - disposable post delay.

"What's nice when u know what u talking about... Is that you know what u talking about :)"

#### In the state of things

- Now you can assume futur posts.

### Disposable post delay ooff.

```lua
-- .init.lua

-- a like port knocking... here you do with entry knocking.

allowedposters = {}

-- fill up ez life.
-- mytime = "%.0f" % {GetTime()}
-- mytime = mytime + 600 -- 10min delay
-- allowedposters[binaryHex(Sha1(FormatIp( ip )))] = { path = "/path", time = mytime }

function postdelayed()
  if allowedposters and type(allowedposters) == 'table' then
    return true
  else
    return false
  end
end

function OnHttpRequest()
  SetHeader( 'Connection', 'close' )

  if postdelayed() then
    local ip, port = GetRemoteAddr()
    ip = FormatIp( ip )
    if allowedposters and type(allowedposters[binaryHex(Sha1(ip))]) == 'table' then
      -- allowedposters[binaryHex(Sha1(ip))].path
      -- allowedposters[binaryHex(Sha1(ip))].time
    end

    if allowedposters[binaryHex(Sha1(ip))].path == GetPath() then
      if GetMethod() ~= 'POST' or GetMethod() ~= 'GET' then
        ServeError( 405 )
        SetHeader( 'Allow', 'GET, POST' )
      end
    else
      -- This check is pedantic but might be good to have.
      if GetMethod() ~= 'GET' then
        ServeError( 405 )
        SetHeader( 'Allow', 'GET' )
        return
      end
    end
  end

  if not Route() then -- this asks redbean to do the default thing
    ServeError(500)
    return
  end
end

```

Now you are like professionals.

written by 752963e64 the 2/07/2022 d/m/y - for the free doom all the code here use MIT style license.