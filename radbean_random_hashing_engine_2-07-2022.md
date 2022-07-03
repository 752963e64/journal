# radbean - arbitrary random hashing engine.

"What's nice when u know what u talking about... Is that you know what u talking about :)"

#### In the state of things

- Now you can distribute hashes.

### Arbitrary random hashing engine ooff.

```lua
-- .init.lua
require "hexhashhandle"

-- special script called by main redbean process at startup
HidePath('/usr/share/zoneinfo/')
HidePath('/usr/share/ssl/')

ProgramBrand( 'beam/x.x.x' )

fqdn = {
  "dosomething.dev",
  "xxx.pinkypig.com",
  "rhex.752963e64.dev",
  "62.210.114.224" -- this is my server ip don't be arsh with her.
}

consumers = {
  "4770056f72cb9d455b9cf9d7fa8cab2f90aff81b",
  "f1957b26532e0e881ae87de29dab30b3286d4a5e"
}

function OnHttpRequest()
  SetHeader( 'Connection', 'close' )

  if GetHttpVersion() == 11 then
    ServeError(426)
    return
  end

   -- This check is pedantic but might be good to have.
  if GetMethod() ~= 'GET' then
    ServeError( 405 )
    SetHeader( 'Allow', 'GET' )
    return
  end

  local hostname = binaryHex(Sha1( GetHost() ))
  local match = false

  for _, v in ipairs(fqdn) do
    if hostname == binaryHex(Sha1(v)) then
      match = true
      hostname = v
      break
    end
  end

  if hostname == 'rhex.752963e64.dev' then
    local hash = {
      md5 = Md5,       sha1 = Sha1,
      sha224 = Sha224, sha256 = Sha256,
      sha384 = Sha384, sha512 = Sha512
    }

    local rhash = binaryHex( string.sub( GetPath(), 2 ) )

    for n, f in pairs(hash) do
      if binaryHex( n ) == rhash then
        rhash = {}
        rhash[n] = binaryHex( f( ""..Lemur64()..GetTime() ) )
        break
      end
    end

    if type(rhash) ~= 'table' then
      ServeError(404)
      SetHeader( 'Connection', 'close' )
      return
    end

    if HasParam("token") then -- consumer access
      print("Ooooff there is a token param.")
      for _, v in ipairs(consumers) do
        if binaryHex(v) == binaryHex(GetParam('token')) then
          print("Ooooff A CLIENT IS HERE! Aye Karamba. What do we do now?")
          break
        end
      end
    else
      SetHeader( 'Content-Type', 'application/json' )
      Write( EncodeJson( rhash ) )
    end

    return
  end

  if not Route() then -- this asks redbean to do the default thing
    ServeError(500)
    return
  end
end

```

#### usage

```shell

curl -vvH "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/md5?token=<damn_where_my_token>

curl -vvH "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/sha1

curl -vvH "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/sha224

curl -vvH "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/sha256

curl -vvH "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/sha384

curl -vvH "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/sha512

echo "oofff"

```

Now you are like professionals.

written by 752963e64 the 2/07/2022 d/m/y - for the free doom all the code here use MIT style license.