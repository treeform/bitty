import hashes

type BitArray* = ref object
    ## Creates an array of bits all packed in together.
    bits: seq[uint64]
    len*: int

func divUp(a, b: int): int =
  ## Like div, but rounds up instead of down.
  let extra = if a mod b > 0: 1 else: 0
  return a div b + extra

proc newBitArray*(len: int = 0): BitArray =
  ## Create a new bit array.
  result = BitArray()
  result.len = len
  result.bits = newSeq[uint64](len.divUp(64))

proc setLen*(b: var BitArray, len: int) =
  ## Sets the length.
  b.len = len
  b.bits.setLen(len.divUp(64))

proc `[]`*(b: BitArray, i: int): bool =
  ## Access a single bit.
  if i < 0 or i >= b.len:
    raise newException(IndexError, "index out of bounds")
  let
    bigAt = i div 64
    littleAt = i mod 64
    mask = 1.uint64 shl littleAt
    r = b.bits[bigAt]
  return (r and mask) != 0

proc `[]=`*(b: BitArray, i: int, v: bool) =
  ## Set a single bit.
  if i < 0 or i >= b.len:
    raise newException(IndexError, "index out of bounds")
  let
    bigAt = i div 64
    littleAt = i mod 64
    mask = 1.uint64 shl littleAt
  b.bits[bigAt] = b.bits[bigAt] or mask

proc `==`*(a, b: BitArray): bool =
  ## Are two bit arrays the same.
  if a.len != b.len:
    return false
  for i in 0 ..< a.bits.len:
    if a.bits[i] != b.bits[i]:
      return false
  return true

proc `and`*(a, b: BitArray): BitArray =
  ## And(s) two bit arrays returning a new bit array.
  if a.len != b.len:
    raise newException(ValueError, "two bit arrays are not same length")
  result = newBitArray(a.len)
  for i in 0 ..< a.bits.len:
    result.bits[i] = a.bits[i] and b.bits[i]

proc `or`*(a, b: BitArray): BitArray =
  ## Or(s) two bit arrays returning a new bit array.
  if a.len != b.len:
    raise newException(ValueError, "two bit arrays are not same length")
  result = newBitArray(a.len)
  for i in 0 ..< a.bits.len:
    result.bits[i] = a.bits[i] or b.bits[i]

proc `not`*(a: BitArray): BitArray =
  ## Not(s) or inverts a and returns a new bit array.
  result = newBitArray(a.len)
  for i in 0 ..< a.bits.len:
    result.bits[i] = not a.bits[i]

proc `$`*(b: BitArray): string =
  ## Turns the bit array into a string.
  result = newStringOfCap(b.len)
  for i in 0 ..< b.len:
    if b[i]:
      result.add "1"
    else:
      result.add "0"

proc add*(b: BitArray, v: bool) =
  ## Add a bit to the end of the array.
  let
    i = b.len
  b.len += 1
  if b.len.divUp(64) > b.bits.len:
    b.bits.add(0)
  if v:
    let
      bigAt = i div 64
      littleAt = i mod 64
      mask = 1.uint64 shl littleAt
    b.bits[bigAt] = b.bits[bigAt] or mask

proc hash*(b: BitArray): Hash =
  ## Computes a Hash for the bit array.
  var h: Hash = 0
  h = h !& hash(b.bits)
  h = h !& hash(b.len)
  !$h

iterator items*(b: BitArray): bool =
  for i in 0 ..< b.len:
    yield b[i]

iterator pairs*(b: BitArray): (int, bool) =
  for i in 0 ..< b.len:
    yield (i, b[i])

type BitArray2d* = ref object
    ## Creates an array of bits all packed in together.
    bits: BitArray
    stride: int

proc newBitArray2d*(stride, len: int): BitArray2d =
  ## Create a new bit array.
  result = BitArray2d()
  result.bits = newBitArray(stride * len)
  result.stride = stride

proc `[]`*(b: BitArray2d, x, y: int): bool =
  b.bits[x * b.stride + y]

proc `[]=`*(b: BitArray2d, x, y: int, v: bool) =
  b.bits[x * b.stride + y] = v

proc `and`*(a, b: BitArray2d): BitArray2d =
  ## And(s) two bit arrays returning a new bit array.
  result = BitArray2d()
  result.bits = a.bits and b.bits
  result.stride = a.stride

proc `or`*(a, b: BitArray2d): BitArray2d =
  ## Or(s) two bit arrays returning a new bit array.
  result = BitArray2d()
  result.bits = a.bits or b.bits
  result.stride = a.stride

proc `not`*(a: BitArray2d): BitArray2d =
  ## Not(s) or inverts a and returns a new bit array.
  result = BitArray2d()
  result.bits = not a.bits
  result.stride = a.stride

proc `==`*(a, b: BitArray2d): bool =
  ## Are two bit arrays the same.
  a.stride == b.stride and b.bits == a.bits

proc hash*(b: BitArray2d): Hash =
  ## Computes a Hash for the bit array.
  var h: Hash = 0
  h = h !& hash(b.bits)
  h = h !& hash(b.bits.len)
  h = h !& hash(b.stride)
  !$h

proc `$`*(b: BitArray2d): string =
  ## Turns the bit array into a string.
  result = newStringOfCap(b.bits.len)
  result.add ("[\n")
  for i in 0 ..< b.bits.len:
    if i != 0 and i mod b.stride == 0:
      result.add "\n"
    if i mod b.stride == 0:
      result.add "  "
    if b.bits[i]:
      result.add "1"
    else:
      result.add "0"
  result.add ("\n]\n")
