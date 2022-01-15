enum GraphSearchType {
	dfs
	bfs
}

enum GraphRTL {
	left_to_right
	right_to_left
}

struct GraphEdge {
	node   GraphNode
mut:
	weight f32
}

struct GraphNode {
	label     rune
mut:
	value     int
	neighbors []GraphEdge
}

struct Graph {
mut:
	nodes []GraphNode
}

struct GraphIterator {
	graph 			map[rune][]rune
	search_type		GraphSearchType
	rtl				GraphRTL
	start_node		rune
mut:
	next_nodes 		[]rune
	checked_nodes	[]rune
}


fn (mut iter GraphIterator) next() ?rune {
	if iter.next_nodes.len == 0 {
		iter.next_nodes << iter.start_node
	}
	for iter.next_nodes.len > 0 {
		node := iter.next_nodes.pop()
		if node in iter.checked_nodes { continue }
		iter.checked_nodes << node

		mut neighbors := []rune{}
		match iter.rtl {
			.left_to_right { neighbors = iter.graph[node].reverse() }
			.right_to_left { neighbors = iter.graph[node] }
		}

		match iter.search_type {
			.dfs { iter.next_nodes << neighbors }
			.bfs { iter.next_nodes.prepend(neighbors) }
		}

		return node
	}
	return error('')
}