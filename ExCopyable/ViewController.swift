import UIKit

struct A: ~Copyable {
    var age: Int
    
    deinit {
        print("deinit: A")
    }
}

class ViewController: UIViewController {
    var a = A(age: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        someFunc1(a: self.a)
    }
    
    /*
     compile error: Noncopyable parameter must specify its ownership
     - Add 'borrowing' for an immutable reference
     - Add 'inout' for a mutable reference
     - Add 'consuming' to take the value from the caller
     */
//    func someFunc(a: A) {
//        print(a.age)
//    }
    
    // borrowing: get만 가능 (deinit 발생x, set 불가능)
    func someFunc1(a: borrowing A) {
        print(a.age)
//        a.age = 1 // Cannot assign to property: 'a' is a 'let' constant
    }
    
    // inout: get, set 가능 (deinit 발생 x)
    func someFunc2(a: inout A) {
        print(a.age)
        a.age = 1
    }
    
    // consuming: 소유권 이전 (deinit 발생, get, set가능)
    func someFunc3(a: consuming A) {
        print(a.age)
        a.age = 1
    }
}
