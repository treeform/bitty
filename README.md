# Bitty - Tightly packed 1d and 2d bit arrays.

* `atlas use bitty`
* `nimble install bitty`

![Github Actions](https://github.com/treeform/bitty/workflows/Github%20Actions/badge.svg)

[API reference](https://treeform.github.io/bitty)

This library has no dependencies other than the Nim standard library.

## About

This library gives you 1d and 2d bit arrays and operations to perform on them.

If you have type like `seq[bool]` in your code, switching to bit arrays should improve your memory usage by 8x. Using tightly packed bit arrays can also improve cache performance if you are doing a lot of sequential read access on a large amount of bits. But tightly packed bit arrays can also be slower if you are doing a lot of random write access. Always measure!
