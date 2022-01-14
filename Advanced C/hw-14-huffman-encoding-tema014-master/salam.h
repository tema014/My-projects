typedef struct Byte88{
  char va; 
  int cur; 
}Byte88;


void wbit(int bit, Byte88 * ascii, char * outfile);

void wchar(char byt, char * outfile, Byte88 * ascii);

void wtree(TreeNode * rot1, char * outfile, Byte88 * ascii);

void fzero(char * outfile, Byte88 * ascii);

void pheader(TreeNode * rot1, char * outfile){
  Byte88 * ascii = malloc(sizeof(Byte88 *));
  
  
  ascii -> va = 0;
  ascii -> cur = 0;


  FILE * fp = fopen(outfile, "w");
  fclose(fp);
	


  wtree(rot1, outfile, ascii);
  fzero(outfile, ascii);


  free(ascii);
  return;
}

void wbit(int bit, Byte88 * ascii, char * outfile)
{
  if(bit){
    ascii -> va = (ascii -> va | 1);
  }
  
  ascii -> cur = ascii -> cur + 1;
  if (ascii -> cur == 8 ){
    FILE * fp = fopen(outfile, "a");
    
    fprintf(fp, "%c", ascii -> va);
    
    fclose(fp);
		
    ascii -> cur = 0;
    ascii -> va = 0;
  }
  else {
    ascii -> va = (ascii -> va << 1);
  }
  
  return;
}

void wchar(char byt, char * outfile, Byte88 * ascii){

  wbit(0, ascii, outfile);

  char check = 64;

  char tot;

  for(int i = 0; i < 7; i++){
    tot = byt & check;
    wbit(tot != 0, ascii, outfile);
    check = check >> 1;
  }
  
  return;
}

void wtree(TreeNode * rot1, char * outfile, Byte88 * ascii)
{
  if(rot1 -> label != 0){
    wbit(1, ascii, outfile);
    wchar(rot1 -> label, outfile, ascii);
  }
  else{
    wbit(0, ascii, outfile);
    wtree(rot1 -> left, outfile, ascii);
    wtree(rot1 -> right, outfile, ascii);
  }	
	
  return;
}

void fzero(char * outfile, Byte88 * ascii)
{
  wbit(0, ascii, outfile);
  
  if (ascii -> cur == 0){
    return;
  }
	
  int xero;

  for (xero = ascii -> cur; xero < 8; xero ++){
    wbit(0, ascii, outfile);
  }
	
  
  return;
}
