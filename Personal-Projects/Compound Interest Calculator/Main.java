import javax.swing.*;
import java.awt.BorderLayout;


public class Main extends JFrame{

    public static void main(String[] args) {
		JFrame javaFrame = new JFrame();//Creates the program's frame.
		Compound loginPanel = new Compound();
	
		javaFrame.setTitle("Compound Interest Calculator");//Window title.
		javaFrame.setSize(500, 625);//Although seems arbitrary, if someone grabs the frame and moves it, the size of the window is 0.
		javaFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		javaFrame.setVisible(true);//Shows the jframe.
		javaFrame.add(loginPanel,BorderLayout.NORTH);//Loads the newly created login panel to the frame.
		javaFrame.setResizable(false);
    }
}
