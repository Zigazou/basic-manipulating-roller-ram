Manipulating Amstrad PCW roller RAM in Basic
============================================

This Basic program must be executed with Mallard Basic, the Basic that came with
each Amstrad PCW.

It demonstrates how you can manipulate the roller RAM to make the video RAM
accessible in the TPA memory (where your program is traditionnally executed
under CP/M).

<a data-flickr-embed="true"  href="https://www.flickr.com/photos/zigazou76/45564292672/in/dateposted/" title="Manipulating video RAM on an Amstrad PCW"><img src="https://farm2.staticflickr.com/1964/45564292672_1fee00b2fd.jpg" width="500" height="281" alt="Manipulating video RAM on an Amstrad PCW"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

What it does
------------

### Define useful functions (5-6)

To circumvent Basic limitations, we need our own modulo function since the mod
operator only handles numbers up to 32768, which is insufficient for our memory
manipulations.

### Reserve memory (10-60)

The program starts by reserving memory for the video RAM (23040 bytes) and the
roller RAM (512 bytes).

As the Basic interpreter uses memory, it leaves less than 7 kilobytes of free
memory for your program.

### Create a new roller RAM (10000-10090)

The video RAM is usually located in other memory banks. To make it easy to
manipulate, the program will create a new roller RAM in the TPA.

The roller RAM is an array of 256 word special pointers. These special pointers
each points to the start of one line. The Amstrad PCW has a resolution of 256
lines (in the european version).

It allows you to place a line anywhere in the first 128 kbytes of the Amstrad
PCW memory. For convenience, our roller RAM will create a contiguous serie of
lines.

### Change the roller RAM address (20000-20040)

Now that the new roller RAM is initialised, we need to tell the video controller
to use it instead of the standard one.

### Fill the screen (110-130)

The program then fills all the screen with white pixels. Due to the way the
video memory is organised, it fills 8×8 pixels at a time. The memory has been
arranged this way to optimize character drawing since the memory controller is
bitmap only (it does not handle characters drawing).

### Return to standard video memory (140)

We can now go back to the standard video memory. A simple reconfiguration of
the roller RAM base address is enough since we have used our own memory. The
standard video memory was never changed.

This means the Amstrad PCW is able to do double page flipping.
