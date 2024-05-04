+++
title = "Haskell Programming"
author = ["svejk"]
tags = ["org", "haskell", "org-roam", "example"]
draft = false
+++

## Basics {#basics}

\*\*


### Map {#map}

```haskell
import Control.Monad
:{
map
  (\x -> x*x + x + 10)
  [1..10]
:}
```

|    |    |    |    |    |    |    |    |     |     |
|----|----|----|----|----|----|----|----|-----|-----|
| 12 | 16 | 22 | 30 | 40 | 52 | 66 | 82 | 100 | 120 |


## Applications {#applications}


### Derivatives {#derivatives}

```haskell
-- | alias R to be a Double as an approximate of a real number
type R = Double

type Time = R
type Position = R

type Derivative = (R -> R) -> R -> R

derivative :: R -> Derivative
derivative dt x t = (x (t + dt/2) - x(t - dt/2)) / dt

carPosition :: Time -> Position
carPosition t = cos t

carVelocity :: Time -> Velocity
carVelocity = derivative 0.01 carPosition

derivative 0.00001 carPosition 1

```
