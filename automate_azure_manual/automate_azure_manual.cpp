
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <fstream>

using namespace std;
int main(int argc, char *argv[]){

//rm test.azr
//rm current_work.azr
int a, c; //indexes
int l, m, n, o, p; // unused indexes
int order=0;
int ELLE=0;

ofstream outfile;
int input[5]={atoi(argv[1]), atoi(argv[2]), atoi(argv[3]), atoi(argv[4]), atoi(argv[5])};
std::string naming = std::string("auto")+ *argv[1]+"_" + *argv[2] + "_" + *argv[3] + "_" + *argv[4]+ "_" +*argv[5];

	// add more atoi(argv[]) if more resonances are added, make spin array larger
	// take this out of CLI and automate

	// edit this to contain the resonances you are studying
double RESON[14]={6.950, 7.041, 7.176, 7.370, 7.480, 7.801, 8.026, 8.189, 8.322, 8.507, 8.586, 8.672,8.717, 8.924 };

	//spin, parity, #entries, s1, s2,s3,s4
	// this is for natural parity
int JPI[6][8]={{0,1,1,4,0,0,0},{1,-1,3,2,2,6,1},{2,1,4,4,0,4,8,1},{3,-1,4, 6, 2, 6, 10,1},{4, 1, 4, 8, 4, 8, 12,1},{5,-1,4, 10, 6, 10, 14,1}};

	// this is for partial widths, [jpi][order of mag][widths] I generalize to only 3 sets of partial widths. one for 0+, one for , and one for 
int PARTIAL[6][4]={{10000,0,0,0},{1500,1000,500,500},{1500,1000,500,500},{1500,1000,500,500},{150,100,50,50},{150,100,50,50}};

outfile.open("work_temp.azr", ofstream::out | ofstream::app | ofstream::ate);
// edit the path, and change the true/false to suit your needs.
outfile<< "<config>" <<endl;
outfile<< "true                                                                                                #Perform A-Matrix Calculation" <<endl;
outfile<< "/home/amber/Documents/Tech/azure/outputs/"<<argv[6]<<"/"<<                              "#Full Path to Output Directory" <<endl;
outfile<< "/home/amber/Documents/Tech/azure/outputs/"<<argv[6]<<"/"<<                           "#Full Path to Checks Directory" <<endl;
outfile<< "none                                                                                                #Compond Nucleus Check" <<endl;
outfile<< "none                                                                                                #Boundary Condition Check" <<endl;
outfile<< "none                                                                                                #Data Check" <<endl;
outfile<< "none                                                                                                #Lo-Matrix and Penetrability Check" <<endl;
outfile<< "none                                                                                                #Legendre Polynomial Check" <<endl;
outfile<< "none                                                                                                #Coulomb Amplitudes Check" <<endl;
outfile<< "none                                                                                                #Reaction Pathway Check" <<endl;
outfile<< "none                                                                                                #Angular Distributions Check" <<endl;
outfile<< "</config>" <<endl;
outfile << "<levels>" << endl;

// change the upper limit of a to do more resonances at a time
for(a=0; a<4; a++){	
	outfile <<endl;

	for (c=0; c<JPI[input[a]][2]; c++){
		if (c==0 && input[a]!=0){ELLE=2;}
		else{ELLE=4;}
		//	  spin             		     parity                   	       E_res                                     2xess                 2xelle               entry                   partial
		outfile << JPI[input[a]][0] << "\t" << JPI[input[a]][1] <<  "\t" <<   RESON[a+input[4]]   <<"\t1      1       1\t"<< ELLE << "\t" <<   JPI[input[a]][c+3] << "\t" <<  a+1 << "\t1       0\t"   <<   PARTIAL[input[a]][c]<< "\t0.5     1       1.5     1       0       1       37      1       19      4.547   4.547   0       0       0.0     0       6.015 0       0       0\t" << endl;
        	//LEVEL="spin    parity       res   fixe       1       1		2ess	2elle       entry      1       0       partial   0.5     1       1.5     1       0       1       37      1       19      4.547   4.547   0       0       0.0     0       6.06511 0       0       0"
	};
	outfile <<endl;
};
// add any other level info for coulomb and other levels that won't change here, follow outfile grammar.

 outfile<<"0   -1         9.95    1    1    1    2    2    5    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
 outfile<<"  0    1          9.9    1    1    1    4    4    6    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
 outfile<<"  1   -1           10    1    1    1    2    2    7    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
 outfile<<"  1   -1           10    1    1    1    4    2    7    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
 outfile<<"  1   -1           10    1    1    1    4    6    7    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
 outfile<<"  1    1        10.05    1    1    1    2    0    8    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
 outfile<<"  1    1        10.05    1    1    1    2    4    8    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
 outfile<<"  1    1        10.05    1    1    1    4    4    8    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
 outfile<<"  2   -1        10.15    1    1    1    2    2    9    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
 outfile<<"  2   -1        10.15    1    1    1    2    6    9    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
 outfile<<"  2   -1        10.15    1    1    1    4    2    9    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
 outfile<<"  2   -1        10.15    1    1    1    4    6    9    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;

outfile<< " 2    1         10.5    1    1    1    2    4   10    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"2    1         10.5    1    1    1    4    0   10    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"2    1         10.5    1    1    1    4    4   10    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"2    1         10.5    1    1    1    4    8   10    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
outfile<<"3   -1        10.25    1    1    1    2    6   11    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"3   -1        10.25    1    1    1    4    2   11    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"3   -1        10.25    1    1    1    4    6   11    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"3   -1        10.25    1    1    1    4   10   11    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
outfile<<"3    1         10.1    1    1    1    2    4   12    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"3    1         10.1    1    1    1    2    8   12    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"3    1         10.1    1    1    1    4    4   12    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"3    1         10.1    1    1    1    4    8   12    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
outfile<<"4   -1        10.45    1    1    1    2    6   13    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"4   -1        10.45    1    1    1    2   10   13    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"4   -1        10.45    1    1    1    4    6   13    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"4   -1        10.45    1    1    1    4   10   13    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
outfile<<"4    1        10.75    1    1    1    2    8   14    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"4    1        10.75    1    1    1    4    4   14    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"4    1        10.75    1    1    1    4    8   14    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"4    1        10.75    1    1    1    4   12   14    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
outfile<<"5   -1         10.7    1    1    1    2   10   15    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"5   -1         10.7    1    1    1    4    6   15    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"5   -1         10.7    1    1    1    4   10   15    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"5   -1         10.7    1    1    1    4   14   15    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
outfile<<"5    1         10.3    1    1    1    2    8   16    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"5    1         10.3    1    1    1    2   12   16    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"5    1         10.3    1    1    1    4    8   16    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"5    1         10.3    1    1    1    4   12   16    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
outfile<<"5    1         10.8    1    1    1    2    8   17    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"5    1         10.8    1    1    1    2   12   17    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"5    1         10.8    1    1    1    4    8   17    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"5    1         10.8    1    1    1    4   12   17    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
outfile<<"6   -1        10.55    1    1    1    2   10   18    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"6   -1        10.55    1    1    1    2   14   18    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"6   -1        10.55    1    1    1    4   10   18    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"6   -1        10.55    1    1    1    4   14   18    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
outfile<<"6    1        10.35    1    1    1    2   12   19    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"6    1        10.35    1    1    1    4    8   19    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"6    1        10.35    1    1    1    4   12   19    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
outfile<<"7   -1         10.6    1    1    1    2   14   20    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"7   -1         10.6    1    1    1    4   10   20    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"7   -1         10.6    1    1    1    4   14   20    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
outfile<<"7    1        10.85    1    1    1    2   12   21    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"7    1        10.85    1    1    1    4   12   21    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
outfile<<"8   -1         10.9    1    1    1    2   14   22    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<<"8   -1         10.9    1    1    1    4   14   22    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
outfile<<"8    1         10.4    1    1    1    4   12   23    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile<< endl;
outfile<<"9   -1        10.65    1    1    1    4   14   24    1    0                   0  0.5    1  1.5    1            0       1      37    1   19        4.547        4.547    0    0          0.0     0   6.015            0            0       0" << endl;
outfile << "</levels>" << endl;
outfile << "<segmentsData>" << endl;

//automate 4th and 5th entry when change 
outfile << "1              1              1              2.5            2.8            134.58         134.58         1              1              0              0	/home/amber/ownCloud/Documents/Tech/azure/37K_new/qqq3_11_27_134.58.dat" << endl;
outfile << "1              1              1              2.5            2.8            138.9          138.9          1              1              0              0	/home/amber/ownCloud/Documents/Tech/azure/37K_new/qqq5_11_27_138.9.dat" << endl;
outfile << "</segmentsData>" << endl;
outfile << "<segmentsTest>" << endl;
outfile << "1              1              1              6.8            7              0.1            0              0              0              0" << endl;
outfile << "</segmentsTest>" << endl;
outfile << "<targetInt>" << endl;
outfile << "0              \"1\"            10             1              0.01           0              0               \"\" 0               0              0 " << endl;
outfile << "</targetInt>" << endl;
outfile << "<lastRun>" << endl;
outfile << "8969" << endl;
//make sure this is an absolute path.
outfile << "\"/home/amber/Documents/Tech/azure/outputs/"<<argv[6]<<"/"<<naming<<".out\"" << endl;
outfile << "\"/home/amber/Documents/Tech/azure/outputs/"<<argv[6]<<"/"<<naming<<".extrap\"" << endl;
outfile << "0 \"\" "<< endl;
outfile << "-1. -1. -1." << endl;
outfile << "</lastRun>" << endl;


return 0;
}

