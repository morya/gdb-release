#include "x.h"
#include <stdio.h>


int greeting(const char * name) {
    if (name == NULL) {
        printf("hello there!\n");
    }else {
        printf("hello there, %s\n", name);
    }
    return 0;
}
