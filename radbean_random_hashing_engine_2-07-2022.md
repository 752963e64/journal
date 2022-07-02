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

function OnHttpRequest()
  SetHeader( 'Connection', 'close' )

  if GetHttpVersion() < 11 then
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
        rhash = f
        break
      end
    end

    if type(rhash) ~= 'function' then
      ServeError(404)
      SetHeader( 'Connection', 'close' )
      return
    end

    if HasParam("token") then -- consumer access
      print("Ooooff there is a token param.")
    else
      SetHeader( 'Content-Type', 'application/json' )
      Write(
        EncodeJson(
          binaryHex(
            rhash( ""..Lemur64()..GetTime() )
          )
        )
      )
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

curl -vvH "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/md5

curl -vvH "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/sha1

curl -vvH "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/sha224

curl -vvH "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/sha256

curl -vvH "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/sha384

curl -vvH "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/sha512

echo "oofff"

```

Now you are like a professionals.

written by 752963e64 the 2/07/2022 d/m/y - for the free doom all the code here use MIT style license.