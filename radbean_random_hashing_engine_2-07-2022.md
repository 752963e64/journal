# radbean - arbitrary random hashing engine.

"What's nice when u know what u talking about... Is that you know what u talking about :)"

#### In the state of things

- Now you can distribute hashes.

### Arbitrary random hashing engine ooff.

- not even 100 lines oooofff, 100% qualified for microservice production :D

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

  if GetHttpVersion() ~= 11 then
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

curl -H "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/md5?token=<damn_where_my_token>
{"md5":"bd6374ab83b75cd0a79b5b180fbee58a"}

curl -H "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/sha1
{"sha1":"3097480a08b03a5a3b69a30bd7da6b950ba29422"}

curl -H "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/sha224
{"sha224":"5d5c0fad812bafac4fc2b51f578f4f2b68dd92f1a85c60ecf52bd07f"}

curl -H "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/sha256
{"sha256":"ff1f62cf9132252e8371cd61aa25928081e1b227b44ecc4c81568bc2d086cb74"}

curl -H "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/sha384
{"sha384":"0d44b9d95b9d004ff8ab2b7603a3ac6cb025410740a53f43169886c15eaa44e71d9dbb48d08361b866f65ea70cd74017"}

curl -H "Host: rhex.752963e64.dev" https://<YOURSERVERIP>/sha512
{"sha512":"039baba35093223cc647828a2884c52522ba1b848c5add1f7c098aa6bb9ec586a175087c0fe9b97476dbacddc64aad51fa23ea0a7cd6444d7cadba473a2a16c5"}

echo "oofff"

```

Now you are like professionals.

![screenshot](https://raw.githubusercontent.com/752963e64/journal/master/screenshot_2022-07-05_at_17-50-19_Enthusiast_inc.png)

written by 752963e64 the 2/07/2022 d/m/y - for the free doom all the code here use MIT style license.