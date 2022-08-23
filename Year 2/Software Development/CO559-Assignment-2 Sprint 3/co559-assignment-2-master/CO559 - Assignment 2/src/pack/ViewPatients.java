package pack;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import javax.swing.*;
import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;

public class ViewPatients extends JPanel{

    GridBagConstraints constrain = new GridBagConstraints();
	private JButton exit;
	private JLabel patLabel, information, nameLabel, surnameLabel,phoneLabel, addressLabel, titlePatID, titlePatName, titlePatSurname, titleNum, titleAddress;
	private String patID, name, surname, phone_Num, address;
	private int y = 3;

    public ViewPatients() {
		setLayout(new GridBagLayout());
		constrain.insets = new Insets(10, 10, 10, 10);

		//Method to set up the panel.
		createPanel(constrain);

		//the program tries to set up the screen for the doctor's patients.
		try {
			//column for patient id
			titlePatID = new JLabel("Patient ID");
			constrain.gridx = 0;
		    constrain.gridy = 2;
			constrain.gridwidth = 1;
	        add(titlePatID,constrain);
					        
			//column for patients name
			titlePatName = new JLabel("Patient name");
			constrain.gridx = 1;
			constrain.gridy = 2;
			constrain.gridwidth = 1;
			add(titlePatName,constrain);
					        
			//column for patients surname
			titlePatSurname = new JLabel("Patient surname");
			constrain.gridx = 2;
			constrain.gridy = 2;
			constrain.gridwidth = 1;
			add(titlePatSurname,constrain);
					        
			//column for patients phone number
			titleNum = new JLabel("Phone number");
			constrain.gridx = 3;
			constrain.gridy = 2;
			constrain.gridwidth = 1;
			add(titleNum,constrain);
					        
			//column for patients address
			titleAddress = new JLabel("Address");
			constrain.gridx = 4;
			constrain.gridy = 2;
			constrain.gridwidth = 1;
			add(titleAddress,constrain);
			
			System.out.println("Column titles added.");

			//Setting up the driver again. See homepage for more of an explanation.
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root" ,"root");
			System.out.println("Database connection success.");
							
			Statement statement = connection.createStatement();
							
			//Selects all information from patients table where the doctor that's logged in is assigned.
			ResultSet resultStatement = statement.executeQuery("SELECT * FROM `Patients Table` WHERE `Username` ='" + Login.nameField.getText() + "' ");
			System.out.println("Statement created.");
			//while there's a record  that satisfies the argument.
			while(resultStatement.next()) {
		
				//get the appropriate information
				patID = resultStatement.getString("Patient ID");
				name = resultStatement.getString("Name");
				surname = resultStatement.getString("Surname");
				phone_Num = resultStatement.getString("Phone number");
				address = resultStatement.getString("Address");

				//Creates a new label for the patient ID
				patLabel = new JLabel(patID);
				constrain.gridx = 0;
				constrain.gridy = y;
				constrain.gridwidth = 1;
				add(patLabel,constrain);
						        
				//Creates a new label for the name
				nameLabel = new JLabel(name);
				constrain.gridx = 1;
				constrain.gridy = y;
				constrain.gridwidth = 1;
				add(nameLabel,constrain);

				//Creates a new label for the surname
				surnameLabel = new JLabel(surname);
				constrain.gridx = 2;
				constrain.gridy = y;
				constrain.gridwidth = 1;
				add(surnameLabel,constrain);

				//Creates a new label for the phone number
				phoneLabel = new JLabel(phone_Num);
				constrain.gridx = 3;
				constrain.gridy = y;
				constrain.gridwidth = 1;
				add(phoneLabel,constrain);

				//Creates a new label for the address
				addressLabel = new JLabel(address);
				constrain.gridx = 4;
				constrain.gridy = y;
				constrain.gridwidth = 1;
				add(addressLabel,constrain);

				//Increases the y value by one for future rows.
				y++;

				System.out.println("New record shown.");
			}
			
			System.out.println("Maybe displayed?");

			repaint();
			revalidate();

		}
		catch (ClassNotFoundException e) {
			System.out.println("Could not find the database driver " + e.getMessage());
		}catch (SQLException e) {
			System.out.println("Could not connect to the database " + e.getMessage());
		}

		//exit button leads to the bookings page
		exit.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent event) {
				Home home = new Home();
									
				//Removing the patients panel.
				removeAll();
									
				//Adding the home panel.
				add(home);
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

                    Statement statement15 = connection.createStatement();
                    statement15.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User exited to home', '" + insertedDateAndTime + "');");
                }
                catch (ClassNotFoundException e) {
                    System.out.println("Could not find the database driver " + e.getMessage());
                }catch (SQLException e) {
                    System.out.println("Could not connect to the database " + e.getMessage());
                }
				
				
			}
		});	
	}

	//Method that constructs the main page to be able to view a specific doctor's patients.
	public void createPanel(GridBagConstraints x) {

		//Label giving a short explanation as to what this panel is for.
		information = new JLabel("This is a list of all patients under your care.");
		constrain.gridx = 0;
		constrain.gridy = 0;
		constrain.gridwidth = 5;
		add(information,constrain);

		//Exit button back to the home panel.
		exit = new JButton("Exit");
		constrain.gridx = 2;
		constrain.gridy = 1;
		constrain.gridwidth = 1;
		add(exit,constrain);
	}
}
