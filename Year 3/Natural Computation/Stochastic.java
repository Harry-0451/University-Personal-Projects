import java.lang.Math;
import java.util.*; 

class Stochastic {
		public static void main(String[] args){
				//Do not delete/alter the next line
		    long startT=System.currentTimeMillis();
int  numStates =9;
int s1 =2;
int s2 = 1;
double A1 = Markov.getTransProb(s1,s2,numStates);
//Q2
numStates = 4;
 s1 =1;
 s2 = 1;
 double A2 = Markov.getTransProb(s1,s2,numStates);
//Q3
numStates =9; // fixed for this question
s1=1;
s2=2;
int TS=3;
double A3 = Markov.getSejProb(s1,s2,numStates,TS);
//Q4
double[] ssprob  = {0.1,0.1,0.1,0.2,0.1,0.2,0.05,0.05,0.1};
s1=3;
s2=1;
double A4 = Markov.getBiasTransProb(s1,s2,ssprob);
//Q5
double[] rates = {10.0,5.0,1.0,2.0,5.0,2.0};
double A5 = Markov.getContTransProb(s1,s2,rates);
//Q6
double TSC=0.02;
rates[0]=10.0;
rates[1]=5.0;
rates[2]=1.0;
rates[3]=1.0;
rates[4]=2.0;
rates[5]=3.0;
s1=1;
s2=2;


double A6 = Markov.getContSejProb(s1,s2,rates,TSC);




//Below, we just print out the results of your attempt



System.out.println("Your answers to the questions were: " + " \n A1  "+A1 + "\n A2  "+A2+ "\n A3  "+A3+ "\n A4  "+A4+ "\n A5  "+A5+ "\n A6  "+A6);




		        long endT= System.currentTimeMillis();
			System.out.println("Total execution time was: " +  ((endT - startT)/1000.0) + " seconds");



	  }











}
