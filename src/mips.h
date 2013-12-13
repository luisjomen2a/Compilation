#ifndef _MIPS_H_
#define _MIPS_H_

#include "quad.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symbol.h"

FILE* openFile(char*);

void quadGenreate(struct quad*,int i);

void closeFile(FILE* f);

#endif
