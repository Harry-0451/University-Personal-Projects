import java.lang.Math;
import java.util.*; 
import java.io.PrintWriter;
    class Markov{

    // Question 1 & 2
    public static  double getTransProb(int i,int j,int k){
    //int j = moving to state , int k = number of states , int i = starting state

        double ss_prob = ((double) 1) / k;//Steady State Probability: Desired Steady State Probability for a 3x3 grid is 1/9 OR 2x2 grid is 1/4
        double pacc = Math.min(1, ((ss_prob)/(ss_prob)));//Accepted Probability:
        double prob_to_move = (double) 1/4; //Probability to move: up down left and right (4 types of movement)

        ArrayList<Integer> mc = new ArrayList<Integer>(); //Markov Chain
        if(k == 4){
            switch (i) {
                case 1:
                    mc.add(1);
                    mc.add(2);
                    mc.add(3);
                    break;
                case 2:
                    mc.add(2);
                    mc.add(1);
                    mc.add(4);
                    break;
                case 3:
                    mc.add(3);
                    mc.add(1);
                    mc.add(4);
                    break;
                case 4:
                    mc.add(4);
                    mc.add(3);
                    mc.add(2);
                    break;
            }
        }
        else{
            switch (i) {
                case 1:
                    mc.add(1);
                    mc.add(2);
                    mc.add(4);
                    break;
                case 2:
                    mc.add(2);
                    mc.add(1);
                    mc.add(3);
                    mc.add(5);
                    break;
                case 3:
                    mc.add(3);
                    mc.add(2);
                    mc.add(6);
                    break;
                case 4:
                    mc.add(4);
                    mc.add(2);
                    mc.add(6);
                    break;
                case 5:
                    mc.add(2);
                    mc.add(4);
                    mc.add(6);
                    mc.add(8);
                    break;
                case 6:
                    mc.add(6);
                    mc.add(3);
                    mc.add(5);
                    mc.add(9);
                    break;
                case 7:
                    mc.add(7);
                    mc.add(4);
                    mc.add(8);
                    break;
                case 8:
                    mc.add(8);
                    mc.add(7);
                    mc.add(9);
                    mc.add(5);
                    break;
                case 9:
                    mc.add(9);
                    mc.add(8);
                    mc.add(6);
                    break;
            }
        }
        
        double A1;
        if(mc.contains(j)){
            if(k == 4){
                if(i == j){
                    A1 = 0.5;
                }
                else{
                    A1 = pacc * prob_to_move;
                }
            }
            else{
                if(mc.size() == 4){
                    A1 = pacc * prob_to_move;
                }
                else{
                    if(i == j){
                        A1 = 0.5;
                    }
                    else{
                        A1 = pacc * prob_to_move;
                    }
                }
            }
        }
        else{
            A1 = 0.0;
        }
        return A1;
    }

    // Question 3
    public static double getSejProb(int s1,int s2,int numStates,double TS){
        //numStates = the number of states , TS = Timestep 
        int total_states = numStates;//number of states
        double probability = 0.0;//suggested probability of getting to s2 from s1 in TS time.

        for(int i = 0; i < 50000; i++){ //runs the markov chain a few times.
            double step = 0;// number of transitions
            // s1 = starting state , s2 = ending state  , 
            int current = s1;//current state
            int endState = s2;//end state
            while(step < TS) {
                    
                step++;
                double r = Math.random();
                double sum = 0.0;

                ArrayList<Integer> mc = new ArrayList<Integer>(); //Markov Chain
                switch (current) {
                        case 1:
                            mc.clear();
                            mc.add(1);
                            mc.add(2);
                            mc.add(4);
                            break;
                        case 2:
                            mc.clear();
                            mc.add(2);
                            mc.add(1);
                            mc.add(3);
                            mc.add(5);
                            break;
                        case 3:
                            mc.clear();
                            mc.add(3);
                            mc.add(2);
                            mc.add(6);
                            break;
                        case 4:
                            mc.clear();
                            mc.add(4);
                            mc.add(2);
                            mc.add(6);
                            break;
                        case 5:
                            mc.clear();
                            mc.add(2);
                            mc.add(4);
                            mc.add(6);
                            mc.add(8);
                            break;
                        case 6:
                            mc.clear();
                            mc.add(6);
                            mc.add(3);
                            mc.add(5);
                            mc.add(9);
                            break;
                        case 7:
                            mc.clear();
                            mc.add(7);
                            mc.add(4);
                            mc.add(8);
                            break;
                        case 8:
                            mc.clear();
                            mc.add(8);
                            mc.add(7);
                            mc.add(9);
                            mc.add(5);
                            break;
                        case 9:
                            mc.clear();
                            mc.add(9);
                            mc.add(8);
                            mc.add(6);
                            break;
                    }
                // determine next state
                for (int j = 0; j < mc.size(); j++) {
                    if(mc.size() == 4){
                        sum += 0.25;
                        if(r <= sum){
                            current = mc.get(j);
                            break;
                        }
                    }
                    else{
                        if(mc.get(j) == current){
                            sum += 0.5;
                            if(r < sum){
                                current = mc.get(j);
                                break;
                            }
                        }
                        else{
                            sum += 0.25;
                            if(r <= sum){
                                current = mc.get(j);
                                break;
                            }
                        }
                    }
                }
                if(current == endState){
                    probability += 1.00;
                    break;
                }
            }
        }
        double A3 =  probability/ 50000;
        return A3;
    /* 
    * The idea here is that the initial state is entered, the program tries 100 times to get to final state in the time given.
    * If it reaches it then 1 is added to the probability of it reaching the final state. When it's finished it is then
    * divided by the amount of attempts, thus providing the probability that it'd reach the final state.
    */
    }

    // Question 4
    public static double getBiasTransProb(int s1, int s2,double[] ssprob){
        double a = ssprob[s1-1];
        double b = ssprob[s2-1];
        double pacc = Math.min(1, ((b)/(a)));//Accepted Probability:
        double prob_to_move = (double) 1/4; //Probability to move: up down left and right (4 types of movement)

        ArrayList<Integer> mc = new ArrayList<Integer>(); //Markov Chain
            switch (s1) {
                case 1:
                    mc.add(1);
                    mc.add(2);
                    mc.add(4);
                    break;
                case 2:
                    mc.add(2);
                    mc.add(1);
                    mc.add(3);
                    mc.add(5);
                    break;
                case 3:
                    mc.add(3);
                    mc.add(2);
                    mc.add(6);
                    break;
                case 4:
                    mc.add(4);
                    mc.add(2);
                    mc.add(6);
                    break;
                case 5:
                    mc.add(2);
                    mc.add(4);
                    mc.add(6);
                    mc.add(8);
                    break;
                case 6:
                    mc.add(6);
                    mc.add(3);
                    mc.add(5);
                    mc.add(9);
                    break;
                case 7:
                    mc.add(7);
                    mc.add(4);
                    mc.add(8);
                    break;
                case 8:
                    mc.add(8);
                    mc.add(7);
                    mc.add(9);
                    mc.add(5);
                    break;
                case 9:
                    mc.add(9);
                    mc.add(8);
                    mc.add(6);
                    break;
            }
        
        double A4;
        if(mc.contains(s2)){
            if(mc.size() == 4){
                A4 = pacc * prob_to_move;
            }
            else{
                if(s1 == s2){
                    A4 = pacc * 0.5;
                }
                else{
                    A4 = pacc * prob_to_move;
                }
            }
        }
        else{
            A4 = 0.0;
        }

        return A4;
    }

    // Question 5
    public static double  getContTransProb(int s1,int s2,double[] rates){
        //Transition probability = (k1 / (k1 + k2 + k3))
        int current = s1;
        int toState = s2;
        double A5 = 0.0;
        if(current == toState){
            return A5;
        }
        if(current == 1){
            if(toState == 2){
                A5 = (rates[toState - 2] / (rates[toState - 2] + rates[toState - 1]));
            }
            else{
                A5 = (rates[(toState - 2)] / (rates[(toState - 2)] + rates[(toState - 3)]));
            }
        }
        if(current == 2){
            if(toState == 1){
                A5 = (rates[(toState + 1)] / (rates[(toState + 1)] + rates[(toState + 2)]));
            }
            else{
                A5 = (rates[toState] / (rates[toState] + rates[(toState - 1)]));
            }
        }
        if(current == 3){
            if(toState == 1){
                A5 = (rates[(toState + 3)] / (rates[(toState + 3)] + rates[(toState + 4)]));
            }
            else{
                A5 = (rates[toState + 3] / (rates[toState + 3] + rates[(toState + 2)]));
            }
        }
        return A5;
    }

    // Question 6
    public static double getContSejProb(int s1,int s2,double[] rates,double TSC){
        int current = s1;
        int toState = s2;
        double foundBy = TSC;
        double probability = 0.0;
        
        for(int i = 0; i < 50000; i++){
            double time = 0.00;
            double rt = Math.random();
            double P = 0;
            if(current == 1){
                P = (rates[0] + rates[1]);
                time += 1/P * Math.log(rt); //Waiting Time
            }
            else if(current == 2){
                P = (rates[2] + rates[3]);
                time += 1/P * Math.log(rt); //Waiting Time
            }
            else{
                P = (rates[4] + rates[5]);
                time += 1/P * Math.log(rt); //Waiting Time
            }

            while(time < foundBy){
                P = 0; //Sum Of Possible Rates
                double r = Math.random();
                double transProb1 = 0;
                rt = Math.random();
                //I'm making the assumption that if the current is equal to travel to, there is no need to move thus P = 0
                if(current == toState){
                    probability += 1.00;
                    break;
                }
                else if(current == 1){
                    transProb1 = (rates[1] / (rates[1] + rates[0]));
                    if(r < transProb1){
                        current = 2;
                        P = (rates[0] + rates[1]);
                        time += 1/P * Math.log(rt); //Waiting Time
                    }
                    else{
                        current = 3;
                        P = (rates[0] + rates[1]);
                        time += 1/P * Math.log(rt); //Waiting Time
                    }
                }
                else if(current == 2){
                    transProb1 = (rates[2] / (rates[2] + rates[3]));
                    if(r < transProb1){
                        current = 1;
                        P = ((rates[2] + rates[3]));
                        time += 1/P * Math.log(rt); //Waiting Time
                    }
                    else{
                        current = 3;
                        P = ((rates[4] + rates[5]));
                        time += 1/P * Math.log(rt); //Waiting Time
                            
                    }
                }
                else{
                    transProb1 = (rates[4] / (rates[4] + rates[5]));
                    if(r < transProb1){
                        current = 1;
                        P = (rates[4] + rates[5]);
                        time += 1/P * Math.log(rt); //Waiting Time
                    }
                    else{
                        current = 2;
                        P = (rates[4] + rates[5]);
                        time += 1/P * Math.log(rt); //Waiting Time
                    }
                }
                time = Math.abs(time);
            }
        }
        double A6 =  probability/ 50000;
        
        return A6;
    }
}//end class



/* I couldn't think of doing this any other way without using a matrix for the questions. 
   There's a better way of doing this I'm sure.

    Q1 & Q2   (3x3 Grid)                          (2x2 Grid)

    (7) <------> (8) <------> (9)              (3) <------> (4)
     ^    0.25    ^    0.25    ^                ^    0.25    ^   
     |            |            |                |            |
     |0.25        |0.25        |0.25            |0.25        |0.25  (2x2: Each corner has a self landing probability of 0.5)
     |            |            |                |            |
     v            v            v                v            v
    (4) <------> (5) <------> (6)              (1) <------> (2)
     ^    0.25    ^    0.25    ^                     0.25
     |            |            |            
     |0.25        |0.25        |0.25
     |            |            |
     v            v            v
    (1) <------> (2) <------> (3) 
          0.25         0.25

(3x3: Each corner has a self landing probability of 0.5. Each outer middle state has a self probability of 0.25)


Q5:
          10
    ------------->
(1) <------------- (2)
\ \       1       / /
 \ \             / /
  \ \           / /
 5 \ \ 5     2 / / 2
    \ \       / /
     \ \     / /
      \ \   / /
         (3)
*/
