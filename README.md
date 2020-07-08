# Bitty - bit array utilities for nim.

# API: bitty

```nim
import bitty
```

## **type** BitArray

Creates an array of bits all packed in together.

```nim
BitArray = ref object
  bits: seq[uint64]
  len*: int

```

## **proc** newBitArray

Create a new bit array.

```nim
proc newBitArray(len: int = 0): BitArray
```

## **proc** `[]`

Access a single bit.

```nim
proc `[]`(b: BitArray; i: int): bool {.raises: [IndexError].}
```

## **proc** `[]=`

Set a single bit.

```nim
proc `[]=`(b: BitArray; i: int; v: bool) {.raises: [IndexError].}
```

## **proc** `==`

Are two bit arrays the same.

```nim
proc `==`(a, b: BitArray): bool
```

## **proc** `and`

And(s) two bit arrays returning a new bit array.

```nim
proc `and`(a, b: BitArray): BitArray {.raises: [ValueError].}
```

## **proc** `or`

Or(s) two bit arrays returning a new bit array.

```nim
proc `or`(a, b: BitArray): BitArray {.raises: [ValueError].}
```

## **proc** `not`

Not(s) or inverts a and returns a new bit array.

```nim
proc `not`(a: BitArray): BitArray
```

## **proc** `$`

Turns the bit array into a string.

```nim
proc `$`(b: BitArray): string {.raises: [IndexError].}
```

## **proc** add

Add a bit to the end of the array.

```nim
proc add(b: BitArray; v: bool)
```

## **proc** hash

Computes a Hash for the bit array.

```nim
proc hash(b: BitArray): Hash
```

## **type** BitArray2d

Creates an array of bits all packed in together.

```nim
BitArray2d = ref object
  bits: BitArray
  stride: int

```

## **proc** newBitArray2d

Create a new bit array.

```nim
proc newBitArray2d(stride, len: int): BitArray2d
```

## **proc** `[]`


```nim
proc `[]`(b: BitArray2d; x, y: int): bool {.raises: [IndexError].}
```

## **proc** `[]=`


```nim
proc `[]=`(b: BitArray2d; x, y: int; v: bool) {.raises: [IndexError].}
```

## **proc** `and`

And(s) two bit arrays returning a new bit array.

```nim
proc `and`(a, b: BitArray2d): BitArray2d {.raises: [ValueError].}
```

## **proc** `or`

Or(s) two bit arrays returning a new bit array.

```nim
proc `or`(a, b: BitArray2d): BitArray2d {.raises: [ValueError].}
```

## **proc** `not`

Not(s) or inverts a and returns a new bit array.

```nim
proc `not`(a: BitArray2d): BitArray2d
```

## **proc** `$`

Turns the bit array into a string.

```nim
proc `$`(b: BitArray2d): string {.raises: [IndexError].}
```
