struct LinkedList {
	head Node
}

struct Node {
mut:
	next  &Node
	value int
}

struct LinkedListIterator {
	 list LinkedList
mut: next Node
}

fn (mut iter LinkedListIterator) next() Node {
	if (!iter.next) {
		iter.next = iter.list.head
	}
	else {
		iter.next = iter.next.next
	}
	return iter.next
}