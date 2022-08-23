
import java.util.Random;

/**
 *
 * @author Vijini
 */

//Main class
public class test {

    Population population = new Population();
    Individual fit;
    Individual sfit;
    int gCount = 0;
    int size = 20;

    public static void main(String[] args) {

        Random ran = new Random();

        test demo = new test();

        //Initialize population
        demo.population.initializePopulation(20);

        //Calculate fitness of each individual
        demo.population.calculateFitness();

        System.out.println("Generation: " + demo.gCount + " Fittest: " + demo.population.fittest);

        //While population gets an individual with maximum fitness
        while (demo.population.fittest < 5) {
            ++demo.gCount;

            //Do selection
            demo.selection();

            //Do crossover
            demo.crossover();

            //Do mutation under a random probability
            if (ran.nextInt()%7 < 5) {
                demo.mutation();
            }

            //Add fittest offspring to population
            demo.addFittestOffspring();

            //Calculate new fitness value
            demo.population.calculateFitness();

            System.out.println("Generation: " + demo.gCount + " Fittest: " + demo.population.fittest);
        }

        System.out.println("\nSolution found in generation " + demo.gCount);
        System.out.println("Fitness: "+demo.population.getFittest().fitness);
        System.out.print("Genes: ");
        for (int i = 0; i < 5; i++) {
            System.out.print(demo.population.getFittest().genes[i]);
        }

        System.out.println("");

    }

    //Selection
    void selection() {

        //Select the most fittest individual
        fit = population.getFittest();

        //Select the second most fittest individual
        sfit = population.getSecondFittest();
    }

    //Crossover
    void crossover() {
        Random rn = new Random();

        //Select a random crossover point
        int crossOverPoint = rn.nextInt(population.sol1[0].geneLength);

        //Swap values among parents
        for (int i = 0; i < crossOverPoint; i++) {
            int temp = fit.genes[i];
            fit.genes[i] = sfit.genes[i];
            sfit.genes[i] = temp;

        }

    }

    //Mutation
    void mutation() {
        Random rn = new Random();

        //Select a random mutation point
        int mutationPoint = rn.nextInt(population.sol1[0].geneLength);

        //Flip values at the mutation point
        if (fit.genes[mutationPoint] == 0) {
            fit.genes[mutationPoint] = 1;
        } else {
            fit.genes[mutationPoint] = 0;
        }

        mutationPoint = rn.nextInt(population.sol1[0].geneLength);

        if (sfit.genes[mutationPoint] == 0) {
            sfit.genes[mutationPoint] = 1;
        } else {
            sfit.genes[mutationPoint] = 0;
        }
    }

    //Get fittest offspring
    Individual getFittestOffspring() {
        if (fit.fitness > sfit.fitness) {
            return fit;
        }
        return sfit;
    }


    //Replace least fittest individual from most fittest offspring
    void addFittestOffspring() {

        //Update fitness values of offspring
        fit.calcFitness();
        sfit.calcFitness();

        //Get index of least fit individual
        int leastFittestIndex = population.getLeastFittestIndex();

        //Replace least fittest individual from most fittest offspring
        population.sol1[leastFittestIndex] = getFittestOffspring();
    }

}


//Individual class
class Individual {

    int fitness = 0;
    int[] genes = new int[5];
    int geneLength = 5;

    public Individual() {
        Random rn = new Random();

        //Set genes randomly for each individual
        for (int i = 0; i < genes.length; i++) {
            genes[i] = Math.random()*Math.round(5.12*(Math.random() - Math.random()));
        }

        fitness = 0;
    }

    //Calculate fitness
    public void calcFitness() {

        fitness = 0;
        for (int i = 0; i < 5; i++) {
            if (genes[i] == 1) {
                ++fitness;
            }
        }
    }

}

//Population class
class Population {

    int popSize = 20;
    Individual[] sol1 = new Individual[20];
    int fittest = 0;

    //Initialize population
    public void initializePopulation(int size) {
        for (int i = 0; i < sol1.length; i++) {
            sol1[i] = new Individual();
        }
    }

    //Get the fittest individual
    public Individual getFittest() {
        int maxFit = Integer.MIN_VALUE;
        int maxFitIndex = 0;
        for (int i = 0; i < sol1.length; i++) {
            if (maxFit <= sol1[i].fitness) {
                maxFit = sol1[i].fitness;
                maxFitIndex = i;
            }
        }
        fittest = sol1[maxFitIndex].fitness;
        return sol1[maxFitIndex];
    }

    //Get the second most fittest individual
    public Individual getSecondFittest() {
        int maxFit1 = 0;
        int maxFit2 = 0;
        for (int i = 0; i < sol1.length; i++) {
            if (sol1[i].fitness > sol1[maxFit1].fitness) {
                maxFit2 = maxFit1;
                maxFit1 = i;
            } else if (sol1[i].fitness > sol1[maxFit2].fitness) {
                maxFit2 = i;
            }
        }
        return sol1[maxFit2];
    }

    //Get index of least fittest individual
    public int getLeastFittestIndex() {
        int minFitVal = Integer.MAX_VALUE;
        int minFitIndex = 0;
        for (int i = 0; i < sol1.length; i++) {
            if (minFitVal >= sol1[i].fitness) {
                minFitVal = sol1[i].fitness;
                minFitIndex = i;
            }
        }
        return minFitIndex;
    }

    //Calculate fitness of each individual
    public void calculateFitness() {

        for (int i = 0; i < sol1.length; i++) {
            sol1[i].calcFitness();
        }
        getFittest();
    }

}