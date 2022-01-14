#ifndef HUFFMAN_H

#define HUFFMAN_H	 

#define ASCII_SIZE 256

/* An example of a TreeNode and ListNode structure. You don't have to use exactly this */
typedef struct TreeNode {
  int label;
  long count;
  struct TreeNode *left;
  struct TreeNode *right;
} TreeNode;

typedef struct ListNode {
	TreeNode *p;
	struct ListNode *nex;
} ListNode;



TreeNode * btree(int ch, long kio, TreeNode * l, TreeNode * r)
{

  TreeNode * node = malloc(sizeof(TreeNode));
	
  node -> count = kio;
  node -> label = ch;
	
	
  node -> right = r;
  node -> left = l;
	
  return node;
}


ListNode * blist(int ch, long kio, TreeNode * l, TreeNode * r)
{
  ListNode * node = malloc(sizeof(ListNode));
  node -> p = btree(ch, kio, l, r);	
  node -> nex = NULL;
  return node;
}


ListNode * alist(ListNode * cuList, int ch, long kio, TreeNode * l, TreeNode * r)
{
  if (cuList == NULL){
    ListNode * curNode = blist(ch, kio, l, r);
    return curNode;
  }
  else if (cuList -> p -> count > kio){
    ListNode * curNode = blist(ch, kio, l, r);
    curNode -> nex = cuList;
    return curNode;
  }
  else {
    cuList -> nex = alist(cuList -> nex, ch, kio, l, r);
    return cuList;
  }
	
  printf("Error! %c\n", ch);
	
  return NULL;
}


TreeNode * clontree(TreeNode * ogTree)
{
  if(ogTree == NULL){
    return NULL;
  }
	
  return btree(ogTree -> label, ogTree -> count, clontree(ogTree -> left),clontree(ogTree -> right));
}


void ftree(TreeNode * rot)
{
  if(rot == NULL){
    return;
  }

  ftree(rot -> right);
  
  ftree(rot -> left);
 
  
  free(rot);
  
  return;
}


void flist(ListNode * head)
{
  ftree(head -> p);
  free(head);
}


void plist(ListNode * head, char * ou){
  FILE * fup;
  fup = fopen(ou, "w");
  while (head != NULL){
    fprintf(fup, "%c:%lu\n", head -> p -> label, head -> p -> count);
    head = head -> nex;
  }
  
  fclose(fup);
  return;
}


void ptree(TreeNode * rot, char * ou, char * ped, int som)
{
  if (rot -> label != 0){
    ped[som] = 0;
    FILE * fup = fopen(ou, "a");
    fprintf(fup, "%c:%s\n", rot -> label, ped);
    fclose(fup);
  }
  else {
    ped[som] = '0';
    som++;
    
    ptree(rot -> left, ou, ped, som);
    som --;

    ped[som] = '1';
    som++;
    
    ptree(rot -> right, ou, ped, som);
    som--;
  }

  return;
}

#endif
