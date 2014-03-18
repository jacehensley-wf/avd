part of tiles;

_updateChildren (Node node) {
  List<NodeChange> result = [];
  
  /**
   * get old children from node, next children descriptions from component and prepare next children map 
   */
  Map<num, NodeChild> oldChildren = _createChildrenMap(node.children);
  Map<num, ComponentDescription> nextChildrenDescriptions = _createChildrenDescriptionMap(_getChildrenFromComponent(node.component));
  Map<num, NodeChild> nextChildren = {};
  
  for (num key in nextChildrenDescriptions.keys) {
    ComponentDescription description = nextChildrenDescriptions[key];
    NodeChild oldChild = oldChildren[key];
    NodeChild nextChild;
    
    /**
     * if factory is same, just apply new props
     */
    if (oldChild != null && oldChild.factory == description.factory) {
      nextChild = oldChild;
      nextChild.node.apply(description.props, description.children);
    } else {
      /**
       * else create new node and if necessery, remove old one
       */
      nextChild = new NodeChild(new Node(node, description.createComponent()), description.factory, description.key);
      result.add(new NodeChange(NodeChangeType.CREATED, nextChild.node));

      if (oldChild != null) {
        result.add(new NodeChange(NodeChangeType.DELETED, oldChild.node));
      }
    }
    nextChildren[key] = nextChild;
    result.addAll(nextChild.node.update());
  }
  for (num key in oldChildren.keys) {
    if (nextChildrenDescriptions[key] == null) {
      result.add(new NodeChange(NodeChangeType.DELETED, oldChildren[key].node));
    }
  }
  
  node.children = _childrenMapToList(nextChildren);
  
  return result;

}

Map<num, NodeChild> _createChildrenMap (List<NodeChild> nodes) {
  return nodes.asMap();
}

Map<num, ComponentDescription> _createChildrenDescriptionMap (List<ComponentDescription> descriptions) {
  return descriptions.asMap();
}

List<NodeChild> _childrenMapToList(Map<num, NodeChild> nextChildren) {
  List<NodeChild> result = [];
  for (NodeChild value in nextChildren.values) {
    result.add(value);
  }
  return result;
}

List<ComponentDescription> _getChildrenFromComponent(Component component) {
  List<ComponentDescription> children;
  var rawChildren = component.render();
  if (rawChildren is ComponentDescription) {
    /**
     * if render returns componentDescription, construct newChildren list
     */
    children = [rawChildren];
  } else if (rawChildren is List<ComponentDescription>) {
    /**
     * if render returns List<componentDescription> set newChildren to it
     */
    children = rawChildren;
  } else if (children == null) {
    /** 
     * if component don't render anything and return null instead of empty list,
     * replace null with empty list. 
     */
    children = [];
  } else {
    /**
     * if it returns something else, throw exception
     */
    throw "render should return ComponentDescription or List<ComponentDescription>";
  }
  
  return children;
}

