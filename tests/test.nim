import bitty

block:
  var a = newBitArray(4)
  a[0] = true
  a[2] = true
  assert $a == "1010"
  assert a[0] == true
  assert a[1] == false

block:
  var a = newBitArray(4)
  a[0] = true
  a[1] = true
  a[0] = false
  assert $a == "0100"
  assert a[0] == false
  assert a[1] == true

block:
  var a = newBitArray(64)
  a[0] = true
  a[63] = true
  assert $a == "1000000000000000000000000000000000000000000000000000000000000001"
  assert a[0] == true
  assert a[63] == true

block:
  var a = newBitArray()
  a.add true
  a.add false
  a.add true
  a.add false
  assert $a == "1010"
  assert a[0] == true
  assert a[1] == false

block:
  var a = newBitArray()
  a.add true
  a.add false
  a.add true
  a.add false
  assert a.hash() == -4445816759453838206

block:
  var a = newBitArray(4)
  var b = newBitArray(4)
  assert a == b

block:
  var a = newBitArray()
  a.add true
  a.add false
  a.add true
  a.add false
  var b = newBitArray()
  b.add false
  b.add true
  b.add false
  b.add true
  assert $(a and b) == "0000"

block:
  var a = newBitArray()
  a.add true
  a.add false
  a.add true
  a.add false
  var b = newBitArray()
  b.add false
  b.add true
  b.add false
  b.add true
  assert $(a or b) == "1111"

block:
  var a = newBitArray()
  a.add true
  a.add false
  a.add true
  a.add false
  assert $(not a) == "0101"

block:
  var a = newBitArray2d(5, 5)
  a[1, 1] = true
  a[2, 2] = true
  a[3, 3] = true
  assert $(a) == """[
  00000
  01000
  00100
  00010
  00000
]
"""

block:
  var a = newBitArray2d(2, 2)
  a[0, 0] = true
  a[1, 1] = true
  var b = newBitArray2d(2, 2)
  b[0, 0] = true
  b[1, 0] = true
  assert $(a and b) == """[
  10
  00
]
"""

block:
  var a = newBitArray2d(2, 2)
  a[0, 0] = true
  a[1, 1] = true
  var b = newBitArray2d(2, 2)
  b[0, 0] = true
  b[1, 0] = true
  assert $(a or b) == """[
  10
  11
]
"""
block:
  var a = newBitArray2d(5, 5)
  a[1, 1] = true
  a[2, 2] = true
  a[3, 3] = true

  assert $(not a) == """[
  11111
  10111
  11011
  11101
  11111
]
"""
