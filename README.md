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

## **func** newBitArray

Create a new bit array.

```nim
func newBitArray(len: int = 0): BitArray
```

## **func** setLen

Sets the length.

```nim
func setLen(b: BitArray; len: int)
```

## **func** `[]`

Access a single bit.

```nim
func `[]`(b: BitArray; i: int): bool {.raises: [IndexError].}
```

## **func** `[]=`

Set a single bit.

```nim
func `[]=`(b: BitArray; i: int; v: bool) {.raises: [IndexError].}
```

## **func** `==`

Are two bit arrays the same.

```nim
func `==`(a, b: BitArray): bool
```

## **func** `and`

And(s) two bit arrays returning a new bit array.

```nim
func `and`(a, b: BitArray): BitArray {.raises: [ValueError].}
```

## **func** `or`

Or(s) two bit arrays returning a new bit array.

```nim
func `or`(a, b: BitArray): BitArray {.raises: [ValueError].}
```

## **func** `not`

Not(s) or inverts a and returns a new bit array.

```nim
func `not`(a: BitArray): BitArray
```

## **func** `$`

Turns the bit array into a string.

```nim
func `$`(b: BitArray): string {.raises: [IndexError].}
```

## **func** add

Add a bit to the end of the array.

```nim
func add(b: BitArray; v: bool)
```

## **func** hash

Computes a Hash for the bit array.

```nim
func hash(b: BitArray): Hash
```

## **iterator** items


```nim
iterator items(b: BitArray): bool {.raises: [IndexError].}
```

## **iterator** pairs


```nim
iterator pairs(b: BitArray): (int, bool) {.raises: [IndexError].}
```

## **type** BitArray2d

Creates an array of bits all packed in together.

```nim
BitArray2d = ref object
 bits: BitArray
 stride: int
```

## **func** newBitArray2d

Create a new bit array.

```nim
func newBitArray2d(stride, len: int): BitArray2d
```

## **func** `[]`


```nim
func `[]`(b: BitArray2d; x, y: int): bool {.raises: [IndexError].}
```

## **func** `[]=`


```nim
func `[]=`(b: BitArray2d; x, y: int; v: bool) {.raises: [IndexError].}
```

## **func** `and`

And(s) two bit arrays returning a new bit array.

```nim
func `and`(a, b: BitArray2d): BitArray2d {.raises: [ValueError].}
```

## **func** `or`

Or(s) two bit arrays returning a new bit array.

```nim
func `or`(a, b: BitArray2d): BitArray2d {.raises: [ValueError].}
```

## **func** `not`

Not(s) or inverts a and returns a new bit array.

```nim
func `not`(a: BitArray2d): BitArray2d
```

## **func** `==`

Are two bit arrays the same.

```nim
func `==`(a, b: BitArray2d): bool
```

## **func** hash

Computes a Hash for the bit array.

```nim
func hash(b: BitArray2d): Hash
```

## **func** `$`

Turns the bit array into a string.

```nim
func `$`(b: BitArray2d): string {.raises: [IndexError].}
```
