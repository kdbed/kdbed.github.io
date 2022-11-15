---
id: acdc67cd-43a2-4060-b54a-cb80a48050b8
title: Haskell - Org Test
---

- <a href="#map" id="toc-map">Map</a>

# Map

``` haskell
import Control.Monad

:{

  map
      (\x -> x*x + x + 1)
      [1..10]
:}
```

``` example
 [3,7,13,21,31,43,57,73,91,111]
```
