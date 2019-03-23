#include <stdio.h>
#include "x.h"

int main(int ac, char ** av) {
    const char * name = "john";
    printf("before\n");
    greeting(name);
    printf("done\n");

    return 0;
}
