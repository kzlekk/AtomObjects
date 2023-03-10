/*
 
AtomObjects
 
Copyright (c) 2023 Natan Zalkin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 
*/
    

/// A convenience property wrapper type that can read and write a value of a specific atom.
@propertyWrapper public struct AtomValue<Atom>: Equatable where Atom: AtomObject {
    
    public static func == (lhs: AtomValue<Atom>, rhs: AtomValue<Atom>) -> Bool {
        lhs.atom === rhs.atom
    }
    
    public typealias Value = Atom.Value
 
    private var atom: Atom
    
    public var wrappedValue: Value {
        get { return atom.value }
        set { atom.value = newValue }
    }
    
    /// Creates a proxy for a specific atom value.
    ///
    /// - Parameters:
    ///   - keyPath: A key path to a specific atom in the root.
    ///   - root: An atom root type.
    public init<Root>(_ keyPath: ReferenceWritableKeyPath<Root, Atom>, in root: Root) where Root: AtomRoot {
        atom = root[keyPath: keyPath]
    }
    
    /// Creates a proxy for a specific atom value.
    public init(_ atom: Atom) {
        self.atom = atom
    }
}
