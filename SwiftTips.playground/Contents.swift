//: Playground - noun: a place where people can play

import UIKit

// ・ジェネリック関数の引数に、プロトコル型の定数＆変数は渡せない
// ・プロトコル型のメタクラスの扱い方

protocol P1 {
    static var static_p1: String { get }
    var p1: String { get }
}
protocol P2 {
    static var static_p2: String { get }
    var p2: String { get }
}

struct S1: P1, P2 {
    static let static_p1 = "S1 static_p1"
    static let static_p2 = "S1 static_p2"
    let p1 = "S1 p1"
    let p2 = "S1 p2"
}
struct S2: P1, P2 {
    static let static_p1 = "S2 static_p1"
    static let static_p2 = "S2 static_p2"
    let p1 = "S2 p1"
    let p2 = "S2 p2"
}
struct S3: P1, P2 {
    static let static_p1 = "S3 static_p1"
    static let static_p2 = "S3 static_p2"
    let p1 = "S3 p1"
    let p2 = "S3 p2"
}

do {
    let p1: P1 = S1()
    let p2: P2 = S1()
}

do {
    let p1p2: protocol<P1, P2> = S1()
}

do {
    typealias P1P2 = protocol<P1, P2>
    let p1p2: P1P2 = S1()
}

do {
    func method1<T: P1 where T: P2>(instance: T) -> String {
        return "\(instance.p1), \(instance.p2)"
    }
    
    let p1: P1 = S1()
    
    // error: cannot invoke 'method1' with an argument list of type '(P1)'
    // method1(p1) // 🙅🏻 NG ジェネリクス関数には、プロトコル型を渡せないらしい
    
    method1(S1()) // 🙆🏻 OK 実際のインスタンスなら渡せる
}

do {
    func method2(instance: protocol<P1,P2>) -> String {
        return "\(instance.p1), \(instance.p2)"
    }
    
    let p1p2: protocol<P1, P2> = S1()
    method2(p1p2) // 🙆🏻 OK 関数の引数の型をプロトコルにすれば渡せる
}

func method3(type: protocol<P1,P2>.Type) -> String {
    return "\(type.static_p1), \(type.static_p2)"
}

method3(S1.self) // 🙆🏻 OK

let types: [protocol<P1,P2>.Type] = [S1.self, S2.self, S3.self]

types.forEach{
    method3($0) // 🙆🏻 OK
}
