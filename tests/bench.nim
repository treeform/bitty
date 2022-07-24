import benchy, bitty, random, sets, flatty/memoryused

type TestEnum = enum
  Value0
  Value1
  Value2
  Value3
  Value4
  Value5
  Value6
  Value7
  Value8
  Value9
  Value10
  Value11
  Value12
  Value13
  Value14
  Value15
  Value16
  Value17
  Value18
  Value19
  Value20
  Value21
  Value22
  Value23
  Value24
  Value25
  Value26
  Value27
  Value28
  Value29
  Value30
  Value31
  Value32
  Value33
  Value34
  Value35
  Value36
  Value37
  Value38
  Value39
  Value40
  Value41
  Value42
  Value43
  Value44
  Value45
  Value46
  Value47
  Value48
  Value49
  Value50
  Value51
  Value52
  Value53
  Value54
  Value55
  Value56
  Value57
  Value58
  Value59
  Value60
  Value61
  Value62
  Value63
  Value64
  Value65
  Value66
  Value67
  Value68
  Value69
  Value70
  Value71
  Value72
  Value73
  Value74
  Value75
  Value76
  Value77
  Value78
  Value79
  Value80
  Value81
  Value82
  Value83
  Value84
  Value85
  Value86
  Value87
  Value88
  Value89
  Value90
  Value91
  Value92
  Value93
  Value94
  Value95
  Value96
  Value97
  Value98
  Value99

var
  testEnumSet: set[TestEnum]
  testEnumHashSet: HashSet[TestEnum]
  testEnumBitArray = newBitArray(TestEnum.high.ord + 1)

timeIt "set":
  for i in 0 ..< 1000:
    for i in 0 ..< rand(0 ..< TestEnum.high.ord):
      testEnumSet.incl(rand(TestEnum.low .. TestEnum.high))
    for i in 0 ..< rand(0 ..< TestEnum.high.ord):
      discard rand(TestEnum.low .. TestEnum.high) in testEnumSet
    testEnumSet = {}

timeIt "hashset":
  for i in 0 ..< 1000:
    for i in 0 ..< rand(0 ..< TestEnum.high.ord):
      testEnumHashSet.incl(rand(TestEnum.low .. TestEnum.high))
    for i in 0 ..< rand(0 ..< TestEnum.high.ord):
      discard rand(TestEnum.low .. TestEnum.high) in testEnumSet
    testEnumHashSet.clear()

timeIt "bitty":
  for i in 0 ..< 1000:
    for i in 0 ..< rand(0 ..< TestEnum.high.ord):
      testEnumBitArray[rand(TestEnum.low .. TestEnum.high).ord] = true
    for i in 0 ..< rand(0 ..< TestEnum.high.ord):
      discard testEnumBitArray[rand(TestEnum.low .. TestEnum.high).ord]
    testEnumBitArray.clear()

echo memoryUsed(testEnumHashSet)
echo memoryUsed(testEnumBitArray)
