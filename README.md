#Meta Iterator
###Overview
This repo is an experiment to show how to implement a meta iterator in Ruby. Note that in Ruby we use enumerators instead of iterators, however the Inumerator class is an important one in a variety of other languages, including Java.

###Explanation
Assume we have an iterator of users, an iterator of stores, and an iterator of items. We could easily iterate through each one in order, but then we would have three distinct chunks. What if we wanted them mixed, so that users, stores, and items would appear side by side? What if each iterator had a totally different size?

This is the use case for a meta iterator. A meta iterator accepts an array of other iterators. It then loops through this array, calling #next on each element until all are exhausted.

###Discussion

#####\#Initialize
The initialize method accepts an array of iterators which is stored in an instance variable, and sets initial values to the other instance variables.

#####\#next
The #next method returns the next item from the appropriate iterator. If all iterators are exhausted, the method returns nil.

#####\#has_next?
The #has_next? method returns true if the currently selected iterator has a next element. Otherwise, it increments a counter and recursively calls itself. If the counter reaches the total size of the array, the method returns false, because no remaining iterators have a next element.

Note this method has a helpful side-effect. If the currently selected iterator in the array has no next element, the method will actually move the index forward until it finds an iterator that does.

###Note
Because the iterator class does not exist in Ruby, I have implemented one here to support the meta iterator class. Due to its simplicity, I will not discuss it in depth, however it mimics the iterator class in Java.