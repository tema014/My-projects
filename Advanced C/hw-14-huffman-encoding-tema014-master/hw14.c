#include <stdio.h>
#include <stdlib.h>

#include "huffman.h"
#include "salam.h"

/* count the occurrences in a file */

long *countLetters(FILE *fp)
{
	long *asciiCount = (long *)malloc(sizeof(long)*ASCII_SIZE);
	if (asciiCount == NULL) {
		return NULL;
	}
	
	int ch;
	for (ch = 0; ch < ASCII_SIZE; ch++) {
		asciiCount[ch] = 0;
	}
	fseek(fp, 0, SEEK_SET);
	while ((ch = fgetc(fp)) != EOF) {
		asciiCount[ch] += 1;
	}
	return asciiCount;
}

/////////////////////////////////////////////////////////// Done!

ListNode * clist(long * ascii)
{
  ListNode * list = NULL;
	
  int charc;
	
	
	
  for (charc = 0; charc < ASCII_SIZE; charc++){
    if(ascii[charc] == 0){
      continue;
    }
    else{
      list = alist(list, charc, ascii[charc], NULL, NULL);
    }
  }
	
  free(ascii);
	
  return list;
}

///////////////////////////////////////////////////////////////// Done!

ListNode * ctree(ListNode * h)
{
  ListNode * cur;
	
  TreeNode * right;
  TreeNode * left;
  
  int index;	
	
  while (h -> nex != NULL){
    left = clontree(h -> p);
    right = clontree(h -> nex -> p);
    alist(h, 0, left -> count + right -> count, left, right);
    
    for (index = 0; index < 2; index++){
      cur = h;
      
      h = h -> nex;
      
      ftree(cur -> p);
      
      free(cur);		
    }
  }
	
  return h;
}
////////////////////////////////////////////////////////////
int main(int argc, char **argv)
{
  if (argc != 5) {
    printf("Not enough arguments");
    return EXIT_FAILURE;
  }
  FILE * inFile = fopen(argv[1], "r");
  if (inFile == NULL) {
    fprintf(stderr, "can't open the input file.  Quit.\n");
    return EXIT_FAILURE;
  }

  long *count1 = countLetters(inFile);
  
  
  fclose(inFile);

  if (count1 == NULL) {
    fprintf(stderr, "cannot allocate memory to count the characters in input file.  Quit.\n");
    return EXIT_FAILURE;
  }

  ///////////////////////////////////////////////
  
  char pat[ASCII_SIZE];
  
  ListNode * list = clist(count1);
  
  
  plist(list, argv[2]);


  list = ctree(list);	

  FILE * loh = fopen(argv[3], "w"); 
  
  fclose(loh);
  
  ptree(list -> p, argv[3], pat, 0);


  pheader(list -> p, argv[4]);


  flist(list);
  
  return EXIT_SUCCESS;
}








