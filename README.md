# AutoCoding
Easily have an object serialized and deserialized automatically in Swift

All you have to do is inherit from AutoCoded class and implement the autoEncodings var of the AutoCoding protocol to specify which plist/primitive properties you'd like to be auto encoded.

### Implementation Example

```
class Person: AutoCoded, AutoCoding {
    var autoEncodings: NSArray = ["name","age"]
    var name: String!
    var age: NSNumber!

    init(name: String,age: NSNumber) {
        self.name = name
        self.age = age
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
```

### NSKeyedArchiver Example
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
