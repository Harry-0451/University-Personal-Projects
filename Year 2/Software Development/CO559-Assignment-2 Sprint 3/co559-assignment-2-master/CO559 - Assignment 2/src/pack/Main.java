//Assignment 2 - Group 3E

package pack;

import javax.swing.*;

//Main driver for the program, where the frame is created.
public class Main extends JFrame{

	public Main() {
		
		
	}
	
	public static void main(String[] args) {
		JFrame javaFrame = new JFrame();//Creates the program's frame.
		Login loginPanel = new Login();
	
		javaFrame.setTitle("Assignment 2 - Group 3E");//Window title.
		javaFrame.setSize(600, 600);//Although seems arbitrary, if someone grabs the frame and moves it, the size of the window is 0.
		javaFrame.setExtendedState(JFrame.MAXIMIZED_BOTH); //Max windowed border.
		javaFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		javaFrame.setVisible(true);//Shows the jframe.
		javaFrame.setContentPane(loginPanel);//Loads the newly created login panel to the frame.
	}
}
