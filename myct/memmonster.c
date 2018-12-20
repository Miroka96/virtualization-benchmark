#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

int main() {
  const long ARR_SIZE = 100000;
  volatile char* array;


  for (int i = 1000; i <= 10000 ; i+=1000)
  {
    size_t si = sizeof(char)*i*ARR_SIZE;
    printf("Size %ld byte\n", si);
    array = (char*) malloc(si);
    for(int j=0; j<i*ARR_SIZE; j++)
      array[j] = i%10 +'0';
    //sleep(1);
    if(array == NULL){
      perror(EXIT_FAILURE);
    }
    sleep(1);
    free(array);
  }
  
}