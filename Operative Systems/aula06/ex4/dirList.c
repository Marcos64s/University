#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>


void listDir(char dirname[]) {
    DIR *dp;
    struct dirent *dent;
    dp = opendir(dirname);
    if(dp == NULL)
        return;
    dent = readdir(dp);
    while(dent!=NULL)
    {
        if(dent->d_name[0] != '.') // do not list hidden dirs/files
        {
          printf("d %s/  %s\n",dirname,dent->d_name);
        }
        dent = readdir(dp);
    }
}
int main(int argc, char *argv[]) {
    if(argc != 2)
    {
        fprintf(stderr,"Usage: %s base_directory\n",argv[0]);
        return EXIT_FAILURE;
    }
    listDir(argv[1]);

    return EXIT_SUCCESS;
}
