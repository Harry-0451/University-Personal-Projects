//Assignment 2 - Group 3E

package pack;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import javax.swing.*;
import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.swing.*;
import javax.swing.table.*;

public class Welcome extends JPanel{
	
	String username, message, date;
	int x,y;
	GridBagConstraints constrain = new GridBagConstraints();
	private JButton continueButton;
	private JLabel welcome, fromLabel, messageLabel, dateLabel, empty, empty2;
	
	public Welcome() {
		setLayout(new GridBagLayout());
		constrain.insets = new Insets(10, 50, 0, 0);
		
		//Welcome label that welcomes the user to the program.
		welcome = new JLabel("Welcome " + Login.nameField.getText() + ".");
	    constrain.gridx = 3;
	    constrain.gridy = 0;
	    constrain.gridwidth = 3;
	    add(welcome,constrain);
	     
	    //Label message so the user knows what the following information is for.
		welcome = new JLabel("New messages: ");
	    constrain.gridx = 3;
	    constrain.gridy = 1;
	    constrain.gridwidth = 3;
	    add(welcome,constrain);
	    
	    //A plain label to help create spacing
	    empty = new JLabel(" ");
	    constrain.gridx = 3;
	    constrain.gridy = 2;
	    constrain.gridwidth = 3;
	    add(empty,constrain);
		    
        try {
			//**NOTE THIS IS NEEDED FOR THE PROGRAM TO CONNECT TO THE DATABASE**
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//**NOTE THIS IS NEEDED TO ACCESS THE INFORMATION ON THE DATABASE 
			//"localhost = the server, 3306 = the port, doctorinfo = the database name, root = username, root = password"**
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root" ,"root");
			
			//If the program can access the database then this will display on the console. 
			//May delete this, mainly used it for checking the connection is met. Useful for you in other classes where you'll need to access database.
			System.out.println("Database connection success.");
			
			Statement statement = connection.createStatement();
			
			//Creates a query that selects records where the current logged in user is equal to any messages sent to them as well as if the message has been seen or not.
			ResultSet resultStatement = statement.executeQuery("SELECT * FROM `Messages Table` WHERE `Username & Patient ID` ='" + Login.nameField.getText() + "' AND `Seen?` IS NULL");
			
			x = 0;
			y = 3;
			
			//While loop, for each record that the query satisfies, the following code is ran.
			while(resultStatement.next()) {
			
				//This grabs the name of the sender from the sql query
				username = resultStatement.getString("username");
				//This grabs the message content of the sender from the sql query.
				message = resultStatement.getString("message");
				//This grabs the date of the sender from the sql query.
				date = resultStatement.getString("date");
				 
				//First part of the message, who it was sent by.
				fromLabel = new JLabel("Sent by: " + username);
			    constrain.gridx = x ;
			    constrain.gridy = y;
			    add(fromLabel,constrain);
			     
			    //Second part of the message, the message.
				x++;
				messageLabel = new JLabel("Message: " + message);
			    constrain.gridx = x + 2;
			    constrain.gridy = y;
			    add(messageLabel,constrain);
				 
			    //Third part of the message, the date that the message was sent.
			    x++;
			    dateLabel = new JLabel("Date Sent: " + date);
			    constrain.gridx = x + 4;
			    constrain.gridy = y;
			    add(dateLabel,constrain);
			    
			    //End of the loop where the next line is created and x is reset to 0.
			    x = 0;
			    y++;
			}
		}
        //Catch statements for database driver.
		catch (ClassNotFoundException e) {
			System.out.println("Could not find the database driver " + e.getMessage());
		}catch (SQLException e) {
			System.out.println("Could not connect to the database " + e.getMessage());
		}
        
       
        //Welcome button that moves onto the home page.
		continueButton = new JButton("Continue");
        constrain.gridx = 4;
        constrain.gridy = y +1;
        constrain.ipadx = 0; 
        constrain.gridwidth = 2;
        add(continueButton,constrain);
       
        //Action listener is used on the continue button, once that button is clicked the block of code is ran.
        continueButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent event) {
				Home homePage = new Home();
				
		        //Removing the welcome panel.
		        removeAll();
		        
		        //Adding the home panel.
		        add(homePage);
		        repaint();
		        revalidate();
		        
		        try {
                    //connecting to driver (not sure if needed again)
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root" ,"root");

                    //get current date and time in one
                    String insertedDateAndTime = "";
                    Date todayAndTime = Calendar.getInstance().getTime();
                    SimpleDateFormat format2 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    insertedDateAndTime = format2.format(todayAndTime);

                    Statement statement18 = connection.createStatement();
                    statement18.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User continued from welcome page to home', '" + insertedDateAndTime + "');");
                }
                catch (ClassNotFoundException e) {
                    System.out.println("Could not find the database driver " + e.getMessage());
                }catch (SQLException e) {
                    System.out.println("Could not connect to the database " + e.getMessage());
                }
		        
		        
			}
		});
	}
}
