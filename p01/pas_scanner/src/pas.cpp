//--------------------------------------------------------------------
// Author 1:	Mrs. Debra Hogue
// Student ID:	*20343220
// E-Mail:		dhogue1@uco.edu
// Author 2: 	Mr. Gordon Klundt
// Student ID:	*20336928
// E-Mail:		gklundt@uco.edu
// Author 3:	Mr. William McLain
// Student ID:	*10066002
// E-Mail:		wmclain@uco.edu
// Author 4: 	Mr. Noah Sefcik
// Student ID:	*20309262
// E-Mail:		nsefcik@uco.edu
// Course:		CMSC 4173 - Translator Design
// CRN:		27419 Spring 2015
// Project:	p01
// Due:		January 21, 2015
// Account:	ttXXX
//--------------------------------------------------------------------
//--------------------------------------------------------------------
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <cstdio>
#include <string>
#include "paslex.h"
using namespace std;
//--------------------------------------------------------------------
ofstream t; 

struct FileException 
{
  FileException(const char* fn)
  {  cout << endl;
     cout << "File " << fn << " cannot be opened.";
     cout << endl;
  }
};

struct CommandLineException 
{
  CommandLineException(int m,int a)
  {  cout << endl; 
     cout << "Too many file names on the command line.";
     cout << endl;
     cout << "A maximum of " << m << " file names can appear on the command line.";
     cout << endl;
     cout << a << " file names were entered.";
     cout << endl;
     cout << "p01 (<input file name> (<output file name>))";
  }
};

void LexMgr(FILE* i)
{  
	Lexer L(i); 
 
	for (int tkn=L.Lex();tkn>0;tkn=L.Lex()) ;
	t << endl;
}

string CheckAndEditCommandLineArg(char* arg)
{
	int stringLength=0;	
	string tempFileName(arg);
	stringLength = tempFileName.length();
	if (stringLength>4)
	{
		size_t isPas = tempFileName.find(".pas",(tempFileName.length()-4));
		if (isPas!=-1)
		{
			tempFileName.erase((tempFileName.length()-4),4);
			tempFileName.append(".trc");
			return tempFileName;
		}
		else
		{
			cout << tempFileName <<" is an invalid file name. Please enter valid \"*.pas\" files next time." << "/n";
			throw(0);
		}
	}
	else
	{
		cout << tempFileName <<" is an invalid file name. Please enter valid \"*.pas\" files next time." << "/n";
		throw(0);
	}
}

int main(int argc, char* argv[])
{
	try {
		char ifn[255];           //Input File Name
		char tfn[255];           //Trace File Name
		string tfns; 
		switch (argc) {
			case 1://no files on the command line
					cout << "Enter the input file name. ";
					cin >> ifn;
					tfns =  CheckAndEditCommandLineArg(ifn); 
					strcpy(tfn, tfns.c_str());
					break;
			case 2://input file on the command line
					strcpy(ifn,argv[1]);
					tfns =  CheckAndEditCommandLineArg(ifn);	
					strcpy(tfn ,tfns.c_str());
					break;
			default: throw CommandLineException(2,argc-1); 
					break;
		 }
		 FILE* i=fopen(ifn,"r"); 
		 if (!i) throw FileException(ifn);
		 t.open(tfn);            
		 if (!t) throw FileException(tfn);
	 
		 LexMgr(i);
		 
		 fclose(i);
		 t.close();
	} catch ( ... ) {
		 cout << endl;
		 cout << "Program Terminated!";
		 cout << endl;
		 cout << "I won't be back!";
		 cout << endl;
		 exit(EXIT_FAILURE);
	}
	return 0;
}