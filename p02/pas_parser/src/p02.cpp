/*
Author: Gordon Klundt                                           
E-Mail: gklundt@uco.edu
Author: Komes Adrian Kovatana 
E-mail: kkovatana1@uco.edu	                                        
Date:   November 5, 2014 
*/

#include <cstdlib>
#include <cstring>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <cstdio>
#include <string>

#include "p02lex.h"
#include "p02par.h"

using namespace std;

extern int yydebug;

int main(int argc,char* argv[])
{
    char ifn[255];
    char ofn[255];
    switch (argc) {
       case 1:
          cout << "Enter the input file name. ";
          cin >> ifn;
          break;
       case 2:
          strcpy(ifn,argv[1]);
          break;
       default:
          exit(EXIT_FAILURE);
    }

    strncpy(ofn,ifn,strlen(ifn)-4);
    strcat(ofn, ".trc");
    FILE* i=fopen(ifn,"r");
    freopen(ofn,"w+",stdout);
    yydebug = 1;
    Parser par(i);
    par.Parse();
    cout << endl;
    //fclose(ofn);
    fclose(i);
    return 0;

}

