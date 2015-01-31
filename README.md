# AutoCoding
Easily have an object serialized and deserialized automatically in Swift

All you have to do is inherit from AutoCoded class and implement the autoEncodings var of the AutoCoding protocol to specify which plist/primitive properties you'd like to be auto encoded.

```
class Person: AutoCoded, AutoCoding {
    var autoEncodings = ["name","age"]
    var name: String?
    var age: Int?
}
```
