// -----------------------------------------------------------------------------
// Author: Harry Hacker
// Module: CO518
// 	Assignment 2 (2020-21)
// 	Task 1
// Program: Tower of Hanoi problem with any number of towers
// -----------------------------------------------------------------------------

import java.util.Scanner;  // Import the Scanner class
import java.io.*; // Import the I/O library

public class hwh2_task1 {


	// ---------------------------------------------------------------------
	// Function: Prints every move on screen and also writes it to a file
	// ---------------------------------------------------------------------
	public int print_move (int disc, int source_tower, int destination_tower, FileWriter writer)
	{
		try {
			System.out.printf("\nMove disc %d from T%d to T%d", disc, source_tower, destination_tower);//displays the disc source location to tower location to the user
			writer.write("\n" + disc + "\t" +  source_tower + "\t" + destination_tower);//it then writes it to the file that was created in the main program.
		} catch (IOException e) {
			e.printStackTrace();
		}

		return 0;
	}

	// ---------------------------------------------------------------------
	// Function: The recursive function for moving n discs 
	//           from s to d with t-2 buffer towers.
	//           It prints all the moves with disc numbers.
	// ---------------------------------------------------------------------
	public int move_t (int number_of_discs, int number_of_towers, int source_tower, int destination_tower, FileWriter writer)
	{
        // This is where my section of code begins.

            if (number_of_discs <= 0){// if the number of discs is less than or equal to 0 then there are none to be moved and thus returns 0.
                return number_of_discs; 
            }
        
            if (number_of_discs == 1) { //if the number of discs is equal to 1 then the program simply moves from source to destination.
                print_move(number_of_discs,source_tower,destination_tower,writer);
                return number_of_discs; 
            } 
    
            int[] towers = new int[number_of_towers-2];//towers with the size number of towers - 2 is created (removing the source and destination)
            int counter = 0;//int counter is initialised.
    
            for(int i = 1; i <= number_of_towers; i++){//for each tower
                if(i == source_tower||i == destination_tower){//if the source or destination tower is selected do nothing.
                }
                else{//otherwise the tower index is equal to i and counter is increased.
                    towers[counter]=i;
                    counter++;
                }
            }
    
            move_t((number_of_discs-towers.length),number_of_towers,source_tower,towers[0],writer);//this is the beginning of the recursive algorithm to that takes the number of discs - the spare towers
            
            for(int i = towers.length-1; i > 0; i--){//for loop that assigns i to the number of spare towers -i (for the array index starting at 0) and while that is larger than 0 
                print_move(number_of_discs-i,source_tower,towers[i],writer);//use the print move method to write the move to file and display to user
            }
                
            print_move(number_of_discs,source_tower,destination_tower,writer);//
            
            for (int i = 1; i < towers.length; i++) {//this then does the same as the other for loop but instead goes up until the tower length
                print_move(number_of_discs-i,towers[i],destination_tower,writer);//and again uses the print move method to display to user and write to file
    
            } 

            move_t((number_of_discs-towers.length),number_of_towers,towers[0],destination_tower,writer);//the final part of the recursive algorithm that moves everything back to where it needs to go

		return 0;


			//To note, this program doesn't work as intended, there's an error somewhere in logic of the program that I can't quite find.
			//The program is supposed to follow the recursive method and then for loops going down by one for the spare towers available displaying to the user the current move.
			//Then display the n source to destination followed by going back up in the for loop until the next recursive method is reached 

			//However this doesn't have quite the affect required.

			//the weird thing I find is that some moves are correct which means a section of the alorithm works in some states and not others.
			//If I had to judge where the issue is I'd say the towers array isn't correctly passing over what towers are available towers for discs to be moved to.

			
	}

	// ---------------------------------------------------------------------
	// Function: main
	// ---------------------------------------------------------------------
	public static void main(String[] args) {
		Scanner myObj = new Scanner(System.in);  // Create a Scanner object
		int n, t, s, d;
		String my_ID = new String("hwh2");

		if (args.length < 4)
		{
			System.out.printf("Usage: java %s_task1 <n> <t> <s> <d>\n", my_ID);
			return;
		}

		n = Integer.parseInt(args[0]);  // Read user input n
		t = Integer.parseInt(args[1]);  // Read user input t
		s = Integer.parseInt(args[2]);  // Read user input s
		d = Integer.parseInt(args[3]);  // Read user input d

		// Check the inputs for sanity
		if (n<1 || t<3 || s<1 || s>t || d<1 || d>t)
		{
			System.out.printf("Please enter proper parameters. (n>=1; t>=3; 1<=s<=t; 1<=d<=t)\n");
			return;
		}

		// Create the output file name
		String filename;
		filename = new String(my_ID + "_ToH_n" + n + "_t" + t + "_s" + s + "_d" + d + ".txt");
		try {
			// Create the Writer object for writing to "filename"
			FileWriter writer = new FileWriter(filename, true);

			// Write the first line: n, t, s, d
			writer.write(n + "\t" + t + "\t" + s + "\t" + d);

			// Create the object of this class to solve the generalised ToH problem
			hwh2_task1 ToH = new hwh2_task1();

            
			System.out.printf("\nThe output is also written to the file %s", filename);

			// Call the recursive function that solves the ToH problem
			ToH.move_t(n, t, s, d, writer);

			// Close the file
			writer.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.printf("\n");
		return;
	}
}