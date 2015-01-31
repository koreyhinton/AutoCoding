# AutoCoding
Easily have an object serialized and deserialized automatically in Swift

All you have to do is inherit from AutoCoded class and implement the autoEncodings var of the AutoCoding protocol to specify which plist/primitive properties you'd like to be auto encoded.

### Implementation

```
class Person: AutoCoded, AutoCoding {
    var autoEncodings = ["name","age"]
    var name: String?
    var age: Int?
}
```

### NSKeyedArchiver
```
var bob = Person()
bob.name = "Bob"
bob.age = 25

// Archive
let data = NSKeyedArchiver.archivedDataWithRootObject(bob)

// Unarchive
if let person = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? Person {
    println(person.name)
}
```
