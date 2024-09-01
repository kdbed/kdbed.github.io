+++
title = "Unredact Pixelized Text"
author = ["svejk"]
draft = false
+++

## Unredact Pixelized Text {#unredact-pixelized-text}


### Unredactor {#unredactor}

-   [BishopFox](https://bishopfox.com/tools/unredacter)


### Depix {#depix}

Output the images from the pdf: `pdfimages <pdf> <out>`; then run depix:

```shell { linenos=true, linenostart=1 }
python3 depix.py \\
    -p test-000.ppm \\
    -s images/searchimages/debruinseq_notepad_Windows10_closeAndSpaced.png
```

-   [github](https://github.com/spipm/Depix)
-   [spipm](https://www.spipm.nl/2030.html)
