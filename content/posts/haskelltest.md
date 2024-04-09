+++
title = "Haskell Programming"
author = ["svejk"]
tags = ["org", "haskell", "org-roam", "example"]
draft = false
+++

## Basics {#basics}

\*\*


## Map {#map}

```haskell
import Control.Monad
:{

  map
      (\x -> x*x + x+ 1)
      [1..10]
:}
```

|   |   |    |    |    |    |    |    |    |     |
|---|---|----|----|----|----|----|----|----|-----|
| 3 | 7 | 13 | 21 | 31 | 43 | 57 | 73 | 91 | 111 |
