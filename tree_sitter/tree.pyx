cimport cruntime
from tree_sitter.node cimport Node

cdef class Tree:
    def __deallloc__(self):
        cruntime.ts_tree_delete(self._c_tree)
    
    def root_node(self):
        cdef cruntime.TSNode cnode = cruntime.ts_tree_root_node(self._c_tree)
        node = Node()
        node._c_node = cnode
        return node

    def edit(self, delta):
        raise NotImplementedError
    
    def get_changed_ranges(self, other):
        raise NotImplementedError
    
    def get_edited_range(self, other):
        raise NotImplementedError

    def walk(self):
        raise NotImplementedError
