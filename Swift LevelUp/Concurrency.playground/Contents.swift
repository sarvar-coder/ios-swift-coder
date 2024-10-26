import UIKit

var greeting = """
By executing these operations asynchronously, your program is free to work on other tasks while it waits for
the blocking operation to complete. Working asynchronously introduces concurrency into your code.
Your program will work on multiple tasks simultaneously.
"""
var bulletpoints = """
• How to create unstructured and structured tasks.
• How to perform cooperative task cancellation.
• How to use the async / await pattern.
• How to create and use actor and Sendable types.
"""
// Note
"""
Note: You may have heard of multithreaded programming. Concurrency in Swift is built on top of threads, but
you don’t need to manipulate them directly. In Swift-concurrency-speak, the term main actor is used in place
of main thread. Actors are responsible for maintaining the consistency of objects you run concurrently in
your program.

"""

import SwiftUI

Task {
    print("Doing some work on a task")
    let sum = (1...100).reduce(0, +)
    print(sum)
}
print("Doing some work on the main actor")
