# motivation

```-0``` I've a weird feel... I wanna kick in everything around me.

# watching comrade TSODING

![The true skill has no dependancy](https://youtube.com/watch?v=qjWkNZ0SXfo)

playing directly from firefox devtools cuz I've no Emacs... but this gonna change certainly soon cuz I'm tired of vim(I never really understood how to master it...)

So from firefox's editor! live coding in javascript 😙 perfect env to be successful. Let's see what happens, how far it goes. I promise to share to show 😸 that I well understood.

- syntax highlight

- auto completion

- built in run shortcut

Firefox has a damn playground, really. 😙

Live coding requier different approach... It's full of this error down if you copy the way he does... 😸

```
Uncaught SyntaxError: redeclaration of const BACKGROUND
    <anonymous> debugger eval code:1
```

because in the console the program doesn't end after "running" it... every **const** are burned for life. until you refresh the page! 😸

running your additions **One More Times®** 😄 give you the sens you reloading it... while it's not at all... it sound like I like to render things more difficult

Aye karamba I'm at moment I add delta time... 😸 My computer is breathing like a monster eating 50% my CPU to draw a 800x600 black surface with a green cube... I hate this noize it irritate me... 

It cost an arm to draw a group of pixels on top stuffs that draws without eating your CPU it's drole, life is drole anyway 😙

I succeeded! I modified a little the name of the things... and my impression despite I knew it before is that it always an **Hypnotizing algorythm**

Some facts that need to be accounted... This all is only possible with descent math education and I don't remind I've learn at school to calculate coordinates based on a geometric form on the paper...

I'm wondering how you aquire that skill from the ground up.

```js
frame.width = 800
frame.height = 600

const BACKGORUND = "#101010"
const FOREGROUND = "#50ff50"
const FPS = 30

const ctx = frame.getContext("2d")

function clr() {
  ctx.fillStyle = BACKGORUND
  ctx.fillRect(0, 0, frame.width, frame.height)
}

function intersect({
  x,
  y
}) {
  const s = 20
  ctx.fillStyle = FOREGROUND
  ctx.fillRect(x - s / 2, y - s / 2, s, s)
}

function line(p1,p2) {
  ctx.lineWidth = 3
  ctx.strokeStyle = FOREGROUND
  ctx.beginPath()
  ctx.moveTo(p1.x,p1.y)
  ctx.lineTo(p2.x,p2.y)
  ctx.stroke()
}

function surface(p) {
  return {
    x: (p.x + 1) / 2 * frame.width,
    y: (1 - (p.y + 1) / 2) * frame.height
  }
}

function projection({x, y, z}) {
  return {
    x: x/z,
    y: y/z
  }
}

function translate_z({x,y,z}, dz) {
  return {x,y,z: z + dz}
}

function rotate_xz({x, y, z}, angle) {
  const c = Math.cos(angle)
  const s = Math.sin(angle)
  return {
    x: x*c-z*s,
    y,
    z: x*s+z*c,
  }
}

let dz = 1
let angle = 0
const dt = 1/FPS

const vs = [
  {x:  0.25, y:  0.25, z:0.25},
  {x: -0.25, y:  0.25, z:0.25},
  {x: -0.25, y: -0.25, z:0.25},
  {x:  0.25, y: -0.25, z:0.25},
  
  {x:  0.25, y:  0.25, z:-0.25},
  {x: -0.25, y:  0.25, z:-0.25},
  {x: -0.25, y: -0.25, z:-0.25},
  {x:  0.25, y: -0.25, z:-0.25}
]

const fs = [
  [0,1,2,3],
  [4,5,6,7],
  [0,4],
  [1,5],
  [2,6],
  [3,7]
]

function picture() {
  angle += Math.PI*(dt/2)
  clr()
  for(const f of fs) {
    for ( let i = 0; i < f.length; ++i) {
      const a = vs[f[i]]
      const b = vs[f[(i+1)%f.length]]
      line(surface(projection(translate_z(rotate_xz(a,angle),dz))),
           surface(projection(translate_z(rotate_xz(b,angle),dz))))
    }
  }
  setTimeout(picture, 1000/FPS)
}

setTimeout(picture, 1000/FPS)
```

# lol®
