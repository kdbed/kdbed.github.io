# Braindump

taken from jethrokuan/braindump

This braindump is generated via [ox-hugo][ox-hugo] and uses the
[cortex][cortex] theme.

The org files used to generate the markdown files are also hosted here
for posterity. They can be found in [the org folder][org].

## Installation instructions

I use the [Ninja](https://ninja-build.posts/ "Ninja") build tool to convert my Org
files into Markdown locally. This is so that only changed Org files get
reprocessed into Markdown files. Ninja spawns many Emacs instances in batch mode
running `ox-hugo`, parallelizing the job of exporting the Org files.

To convert all Org files into Markdown, run:

```bash
./build.py
```

`build.py` is simple enough to inspect. Once the Markdown files are generated,
we can use Hugo to generate the website.


Make sure the submodule containing the Hugo theme is installed:

    $ git submodule init
    $ git submodule update

Now run hugo to generate the files (find them in `/public`):

    $ hugo

Or run the following to get an immediately browsable website on localhost:

    $ hugo serve

[hugo]: https://gohugo.io/
[ox-hugo]: https://github.com/kaushalmodi/ox-hugo
[cortex]: https://github.com/jethrokuan/cortex
[org]: https://github.com/jethrokuan/braindump/tree/master/org
