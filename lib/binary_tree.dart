class TreeNode {
  int data;
  TreeNode root, leftChild, rightChild;
  TreeNode(this.data);
}

class BinaryTree<int> {
  TreeNode root;

  BinaryTree(TreeNode treeNode) : root = treeNode;

  void preorder(TreeNode root) {
    if (root == null) {
      return;
    }
    print("当前遍历的节点是： " + root.data.toString());
    preorder(root.leftChild);
    preorder(root.rightChild);
  }

  void inorder(TreeNode root) {
    if (root == null) {
      return;
    }
    inorder(root.leftChild);
    print("当前遍历的节点是： " + root.data.toString());
    inorder(root.rightChild);
  }

  void postorder(TreeNode root) {
    if (root == null) {
      return;
    }
    postorder(root.leftChild);
    postorder(root.rightChild);
    print("当前遍历的节点是： " + root.data.toString());
  }
}

main() {
  TreeNode root = TreeNode(10);

  BinaryTree tree = BinaryTree(root);
  tree.root.leftChild = TreeNode(9);
  tree.root.rightChild = TreeNode(8);
  tree.root.leftChild.leftChild = TreeNode(7);
  tree.root.leftChild.rightChild = TreeNode(6);
  tree.root.rightChild.leftChild = TreeNode(5);
  tree.root.rightChild.rightChild = TreeNode(4);
  print("---------------");
  tree.preorder(root);
  print("---------------");
  tree.inorder(root);
  print("---------------");
  tree.postorder(root);
}
