//
//  Created by Natan Zalkin on 17/01/2023.
//  Copyright © 2023 Natan Zalkin. All rights reserved.
//
    

import Foundation
import AtomObjects

extension CommonAtoms {
    
    struct CounterAtomKey: AtomObjectKey {
        
        static var defaultValue: Int = 0
    }

    struct IncrementCounter: AtomRootAction {
        
        var value: Int
        
        init(by value: Int) {
            self.value = value
        }
        
        func perform(with root: CommonAtoms) async {
            root.counter.value += value
        }
    }
    
    struct DecrementCounter: AtomRootAction {
        
        var value: Int
        
        init(by value: Int) {
            self.value = value
        }
        
        func perform(with root: CommonAtoms) async {
            root.counter.value -= value
        }
    }
    
    var counter: GenericAtom<Int> {
        get { return self[CounterAtomKey.self] }
        set { self[CounterAtomKey.self] = newValue }
    }
}