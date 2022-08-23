// -----------------------------------------------------------------------------
// Author: Harry Hacker
// Module: CO518
// 	Assignment 2
// 	Task 2
// Program: Check the correctness of a solution for the Tower of Hanoi problem
// -----------------------------------------------------------------------------

import java.util.*; // Import the util library
import java.io.*; // Import the I/O library

public class hwh2_task2 {

	// ---------------------------------------------------------------------
	// Function: Empty Constructor
	// ---------------------------------------------------------------------
	public hwh2_task2 ()
	{
	}

	// ---------------------------------------------------------------------
	// Function: isBlank
	// ---------------------------------------------------------------------
	public static boolean isBlank (int character) {
		if (
		character == ' ' ||
		character == '\t' ||
		character == '\n' ||
		character == '\r'
		)
			return true;
		return false;

	}

	// ---------------------------------------------------------------------
	// Function: getNextInteger
	// This function only works assuming that the file has positive integers
	// ---------------------------------------------------------------------
	public static int getNextInteger (FileInputStream input_file) {
		int character;
		int digit;
		int number = 0;
		try {
			while ((character = input_file.read()) != -1 && !isBlank(character))
			{
				number *= 10;
				digit = (int) character - '0';
				number += digit;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return number;
	}

	// ---------------------------------------------------------------------
	// Function: main
	// ---------------------------------------------------------------------
	public static void main(String[] args) {
		Scanner myObj = new Scanner(System.in);  // Create a Scanner object
		int n, t, s, d;
		String str_filename;
		String my_ID = new String("hwh2");
		boolean Check = true;//if an error occurs this is set to false and the program therefor knows an error has occured at the end of the program 
							 //and doesn't display the messages that the program ran successfully.

		// Check if the input filename has been provided as an argument
		if (args.length < 1)
		{
			System.out.printf("Usage: java %s_task2 <file_name>\n", my_ID);
			return;
		}

		try {
			// Get the filename
			str_filename = args[0];
			System.out.printf("Reading the file " + str_filename + "\n");

			// Create the object for reading the input file
			FileInputStream input_file = new FileInputStream(str_filename);

			// Read the four parameters in the first row of the input file
			n = getNextInteger (input_file);
			t = getNextInteger (input_file);
			s = getNextInteger (input_file);
			d = getNextInteger (input_file);
			System.out.printf("%d\t%d\t%d\t%d\n", n, t, s, d);

			// This is where my section of code begins.

			List<List<Integer>> towers = new ArrayList<List<Integer>>();//This creates an arraylist for lists to hold tower 1 , 2, 3, ... ,6,.
			
			for (int i = 0; i < t; i++) {//this creates a new list for each tower and adds it to the arraylist.
				List<Integer> list = new ArrayList<>();
				towers.add(list);
			}

			for(int i = n;i > 0;i--){//this adds the disks from larges to smallest to the source array to create the idea of disc size, e.g. tower[0] = {6,5,4,3,2,1}
				towers.get(s-1).add(i);
			}
			System.out.println("\nThe status of all the towers at the start is as follows: ");

			for(int i = 0;i<t;i++){//This displays the stating position of each tower so the user can see how the source holds all the disks and the amount of towers there are.
				System.out.println("Tower: "+ (i + 1) +" "+ towers.get(i));
			}

			System.out.println("\n");

		

			mainWhile://assigning this while loop as mainWhile so it can be broken anywhere.
			while(true){

				int a = getNextInteger(input_file);//loads t he first number which would be a disc
				int b = getNextInteger(input_file);//loads the next number which would be the source tower
				int c = getNextInteger(input_file);//loads the final number in the line which would be the destination tower.

				if(a == 0){//if a is equal to 0 then the main while loop is broken (as the text file has reached the end.)
					break mainWhile;
				}

				if(Integer.valueOf(a) > Integer.valueOf(n)){//if the disc is larger than the amount of disks there are, then this disc doesn't exist on any  tower. Thus the disc is out of range.
					System.out.printf("Move Error: the disc number: " +a+ " is out of range. \n\n");
					System.out.printf("The status of all the towers is as follows:\n");

					Check = display(t,towers);//This method displays whatever the current layout of each tower is. (details of the methods specifics are at the bottom: see line 235)
					break mainWhile;//this breaks the main while loop that is the score of the program.
				}

				if(Integer.valueOf(c) > Integer.valueOf(t)){//if the destination tower is larger than the amount of towers there are
					System.out.printf("Move Error: tower: " +c+ " is out of range. \n\n");//then that tower doesn't exist and is therefor out of range.
					System.out.printf("The status of all the towers is as follows:\n");

					Check = display(t,towers);
					break mainWhile;
				}

				if(Integer.valueOf(b) > Integer.valueOf(t)){//if the source tower is larger than the amount of towers there are
					System.out.printf("Move Error: tower: " +b+ " is out of range. \n\n");//then that tower doesn't exist and is therefor out of range.
					System.out.printf("The status of all the towers is as follows:\n");
				
					Check = display(t,towers);
					break mainWhile;
				}
				
				System.out.printf("Move disc %d from tower %d to tower %d\n", a, b, c);//The order of the next line in the text file is shown.
				System.out.printf("Before the move: \n");
				System.out.println("Source tower "+ b +": "+ towers.get(b-1));//The source tower of disc a is shown
				System.out.println("Destination tower "+ c +": "+ towers.get(c-1));//the destination tower of where the disc needs to go is shown.

				//what follows is a series of checks that makes sure the move disc a from b to c is valid.
				
				for(int ina = 0;ina < towers.get(c-1).size();ina++){//for each element in destination tower
					if(Integer.valueOf(towers.get(c-1).get(ina)) < Integer.valueOf(a)){//if the value of the element in less than the disc that needs to be moved
						System.out.printf("Move Error: Destination tower: " +c+ " has a smaller disc than " +a+ " on the top. \n\n");//then the move is labeled as an error as there must be a smaller disc on the top of the tower.
						System.out.printf("The status of all the towers is as follows:\n");

						Check = display(t,towers);
						break mainWhile;
					}
				}

				int coun = towers.get(b-1).indexOf(a);//this gets the index of disc a in the source arraylist
				for(int in = 0;in < towers.get(b-1).size();in++){//for each element in the arraylist
					if(Integer.valueOf(towers.get(b-1).get(in)) > Integer.valueOf(a) && in > coun){//if the value of element is larger than the a disc and the index is larger than the value of a index, 
						System.out.printf("Move Error: Source tower: " +b+ " does not have the disc " +a+ " on the top. \n\n");//then there is a larger disc on top and thus cannot be moved.
						System.out.printf("The status of all the towers is as follows:\n");

						Check = display(t,towers);
						break mainWhile;
					}
				}

				int contains = 0;//true/false contains value
				for(int id = 0;id < towers.get(b-1).size();id++){
					if(towers.get(b-1).contains(a)){//if the element currently being looked at contains the disc, then one is added.
						contains++;
					}
					if(contains == 0){//if contains is equal to 0 then the source tower didn't have the disc inside it.
						System.out.printf("Move Error: Source tower: " +b+ " does not contain " +a+ "\n\n");
						System.out.printf("The status of all the towers is as follows:\n");

						Check = display(t,towers);
						break mainWhile;//an error has been found and thus the main while loop is broken.
					}
				}



				System.out.printf("After the move: \n");//The program can find no faults with the move and so assigns the disc to the new location and removes it from the original array.
				towers.get(c-1).add(a);
				towers.get(b-1).remove(Integer.valueOf(a));
				System.out.println("Source tower "+ b +": "+ towers.get(b-1));//this is then shown to the user as the change in source and change in destination towers.
				System.out.println("Destination tower "+ c +": "+ towers.get(c-1));

				System.out.printf("\n");
			}

			outerloop://This is assigning this forloop to the name outerloop so it can be called later to stop and break the main for loop.
			for(int i = 0;i<t;i++){//for each tower it's checked if any elements holds a disc & if all Checks came back fine.
				if(i != d-1 && Check == true){
					for(int j = 1;j <= n;j++){
						if(towers.get(i).contains(j)){//if a tower does contain a disc then there's an error as not all towers are empty.
							System.out.println("Error in file, not all towers are empty.\n\n");
						
							Check = display(t,towers);
							break outerloop;//If the condition is true then the error display is shown and the main loop is broken so it isnt repeated for other towers (as an error has already been found.)
						}
					}
				}
			}

			if(Check == true){//if Check is still true
				System.out.println("\nThe status of all the towers is as follows:");
				for(int i = 0;i<t;i++){//print out all of the towers and its contents
					System.out.println("Tower: "+ (i + 1) +" "+ towers.get(i));
				}
				System.out.println("\nThe sequence of moves is correct.");//confirms to the user that all moves are correct.
			}

			// Close the file
			input_file.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.printf("\n");
		return;
	}

	// ---------------------------------------------------------------------
	// Method: display 
	// This method displays whatever the current layout of each tower is.
	// ---------------------------------------------------------------------
	public static boolean display (int x,List<List<Integer>>  y) {//It takes an int and list of the towers as inputs.

		for(int bc = 0;bc<x;bc++){//for each tower created.
			System.out.println("Tower: "+ (bc + 1) +" "+ y.get(bc));//print out the tower number (+1 as arrays start at 0 so tower[0] = tower 1.) and prints the contents of that tower.
		}
		System.out.println("\nThe sequence of moves is incorrect.");//once the for loop has ended it tells the viewer that the sequence of moves is incorrect.

		return false;//and returns false so the Check variable can be turned from true to false as there is something wrong with the program.
	}

	
}