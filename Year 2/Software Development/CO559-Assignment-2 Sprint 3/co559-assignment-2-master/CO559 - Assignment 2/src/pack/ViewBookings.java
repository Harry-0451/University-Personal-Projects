package pack;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import javax.swing.*;
import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;

public class ViewBookings extends JPanel{

	GridBagConstraints constrain = new GridBagConstraints();
	private JButton done,exit,back;
	private JLabel monthTxt, yearTxt, errorMessage,showDate, prescrip, dSurname, dName, patientID, appointID, titleApointID, titlePatID, titlePatName, titlePatSurname, titlePrescr, titleDate;
	private JTextField month,year;
	private String patID, appointmentID, presc, date, pName, pSurname;
	int y;
	
	public ViewBookings() {
		setLayout(new GridBagLayout());
		constrain.insets = new Insets(10, 10, 10, 10);

		//Method to set up the panel.
		createPanel(constrain);
        
		y = 4;
       
        done.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent event) {
				
				try {
                    //connecting to driver (not sure if needed again)
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root" ,"root");

                    //get current date and time in one
                    String insertedDateAndTime = "";
                    Date todayAndTime = Calendar.getInstance().getTime();
                    SimpleDateFormat format2 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    insertedDateAndTime = format2.format(todayAndTime);

                    Statement statement1 = connection.createStatement();
                    statement1.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User viewed bookings', '" + insertedDateAndTime + "');");
                }
                catch (ClassNotFoundException e) {
                    System.out.println("Could not find the database driver " + e.getMessage());
                }catch (SQLException e) {
                    System.out.println("Could not connect to the database " + e.getMessage());
                }
				
				//if Either of the text boxes are empty on button click, an error message is displayed
				if(month.getText().isEmpty() || year.getText().isEmpty()) {
					errorMessage.setText("Month Or Year Text Field Empty.");
				}
				else if (Integer.parseInt(month.getText()) > 12 || Integer.parseInt(month.getText()) < 1) {
					errorMessage.setText("Month must be between 1 and 12.");
				}
				else {
					if (month.getText().matches("[0-9]+") == false|| year.getText().matches("[0-9]+") == false) {
						errorMessage.setText("Month Or Year Text Field Cannot Contain Letters.");
					}
					else {
						//otherwise the program sets up the screen for results
						try {
							//column for appointment id
					        titleApointID = new JLabel("Appointment ID");
					        constrain.gridx = 0;
					        constrain.gridy = 3;
					        constrain.gridwidth = 1;
					        add(titleApointID,constrain);
					        
					        //column for title id
					        titlePatID = new JLabel("Patient ID");
					        constrain.gridx = 1;
					        constrain.gridy = 3;
					        constrain.gridwidth = 1;
					        add(titlePatID,constrain);
					        
					        //column for patients name
					        titlePatName = new JLabel("Patient Name");
					        constrain.gridx = 2;
					        constrain.gridy = 3;
					        constrain.gridwidth = 1;
					        add(titlePatName,constrain);
					        
					        //column for patients surname
					        titlePatSurname = new JLabel("Patient Surname");
					        constrain.gridx = 3;
					        constrain.gridy = 3;
					        constrain.gridwidth = 1;
					        add(titlePatSurname,constrain);
					        
					        //column for patients Prescription
					        titlePrescr = new JLabel("Prescription");
					        constrain.gridx = 4;
					        constrain.gridy = 3;
					        constrain.gridwidth = 1;
					        add(titlePrescr,constrain);
					        
					        //column for patients date
					        titleDate = new JLabel("Date");
					        constrain.gridx = 5;
					        constrain.gridy = 3;
					        constrain.gridwidth = 1;
					        add(titleDate,constrain);
					        
					        //Setting up the driver again. See homepage for more of an explanation.
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root" ,"root");
							System.out.println("Database connection success.");
							
							
							Statement statement = connection.createStatement();
							
							//Selects all information from appointments table where the doctor that's logged in is assigned, and the month and year are equal to that of the text fields.
							ResultSet resultStatement = statement.executeQuery("SELECT * FROM `Appointments Table` WHERE `Username` ='" + Login.nameField.getText() + "' " + "AND MONTH(Dat) = "+month.getText()+" AND YEAR(Dat) = "+year.getText()+"");
							
							
							
							
							
							//removes everything on screen.
							removeAll();
							
							//while there's a record  that satisfies the argument.
							while(resultStatement.next()) {
		
								//get the appropriate information
								presc = resultStatement.getString("Prescription");
								date = resultStatement.getString("Dat");
								appointmentID = resultStatement.getString("Appointment ID");
								patID = resultStatement.getString("Patient ID");
								
								//Creates a new label for the appointment ID
						        appointID = new JLabel(appointmentID);
						        constrain.gridx = 0;
						        constrain.gridy = y;
						        constrain.gridwidth = 1;
						        add(appointID,constrain);
						        
						        //Creates a new label for the patient ID
						        patientID = new JLabel(patID);
						        constrain.gridx = 1;
						        constrain.gridy = y;
						        constrain.gridwidth = 1;
						        add(patientID,constrain);
		
								System.out.println("Checking.");
									
									//New statement that if the record is equal to the current patient ID.
								Statement statement2 = connection.createStatement();
								ResultSet resultStatement2 = statement2.executeQuery("SELECT * FROM `Patients Table` WHERE `Patient ID` ='" + patID + "'");
									
								while(resultStatement2.next()) {
									//if the two statements are equal then take the name and surname of the patient.
									if(patID.equals(resultStatement2.getString("Patient ID"))) {
										pName = resultStatement2.getString("Name");
										pSurname = resultStatement2.getString("Surname");
									        
										//Creates a label for the patients name
								        dName = new JLabel(pName);
								        constrain.gridx = 2;
								        constrain.gridy = y;
								        constrain.gridwidth = 1;
								        add(dName,constrain);
									        
									        //creates a label for the patients surname
									    dSurname = new JLabel(pSurname);
									    constrain.gridx = 3;
									    constrain.gridy = y;
									    constrain.gridwidth = 1;
									    add(dSurname,constrain);
									}
								}
									
								//creates a label for the patients prescription
						        prescrip = new JLabel(presc);
						        constrain.gridx = 4;
						        constrain.gridy = y;
						        constrain.gridwidth = 1;
						        add(prescrip,constrain);
						        
						        //creates a label for the patients date.
						        showDate = new JLabel(date);
						        constrain.gridx = 5;
						        constrain.gridy = y;
						        constrain.gridwidth = 1;
						        add(showDate,constrain);
						        
						        y++;
							}
							System.out.println("Maybe display?");
							
							//Back button the view bookings page
					        back = new JButton("Back");
					        constrain.gridx = 3;
					        constrain.gridy = 1;
					        add(back,constrain);
							
							repaint();
					        revalidate();
					        
					        
					        
					        //back button leads to the bookings page
					        back.addActionListener(new ActionListener() {
								@Override
								public void actionPerformed(ActionEvent event) {
								
									ViewBookings view = new ViewBookings();
							        //Removing the table information.
							        removeAll();
							        
							        //Adding the bookings panel.
							        add(view);
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

					                    Statement statement10 = connection.createStatement();
					                    statement10.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User exited to bookings page from viewing bookings', '" + insertedDateAndTime + "');");
					                }
					                catch (ClassNotFoundException e) {
					                    System.out.println("Could not find the database driver " + e.getMessage());
					                }catch (SQLException e) {
					                    System.out.println("Could not connect to the database " + e.getMessage());
					                }
							     
								}
							});
						}
						catch (ClassNotFoundException e) {
							System.out.println("Could not find the database driver " + e.getMessage());
						}catch (SQLException e) {
							System.out.println("Could not connect to the database " + e.getMessage());
						}
					}
				}
			}
		});
        
        exit.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent event) {
				Home home = new Home();
				
		        //Removing the bookings panel.
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
	
	//Method that constructs the main page to be able to view bookings
	public void createPanel(GridBagConstraints x) {
		//creates a label to show the user what the field is for.
		monthTxt = new JLabel("Enter Month: ");
		constrain.gridx = 0;
		constrain.gridy = 0;
		add(monthTxt,constrain);
		
		//text field for the user to enter the month
		month = new JTextField(2);
		constrain.gridx = 1;
		constrain.gridy = 0;
		add(month,constrain);

		//creates a label to show the user what the field is for.
		yearTxt = new JLabel("Enter Year: ");
		constrain.gridx = 2;
		constrain.gridy = 0;
		add(yearTxt,constrain);
		    
		//text field for the user to enter the year
		year = new JTextField(4);
		constrain.gridx = 3;
		constrain.gridy = 0;
		add(year,constrain);

		//Done button that creates a search depending on the information entered into the fields.
		done = new JButton("Done");
		constrain.gridx = 1;
		constrain.gridy = 1;
		add(done,constrain);
	        
		//Exit button back to the home panel.
		exit = new JButton("Exit");
		constrain.gridx = 2;
		constrain.gridy = 1;
		add(exit,constrain);
		    
		//Error message for if no information was entered into one of both of the field boxes.
		errorMessage = new JLabel("");
		constrain.gridx = 0;
		constrain.gridy = 2;
		constrain.gridwidth = 4;
		errorMessage.setForeground(Color.RED);
		add(errorMessage,constrain);
	}
    //Methods below are used for testing
    /**
     * Method to return month, to facilitate testing.
     * @return month
     */
	public JTextField getMonth() {
		return month;
	}
    /**
     * Method to return year, to facilitate testing.
     * @return year
     */
	public JTextField getYear() {
		return year;
	}
    /**
     * Method to return done, to facilitate testing.
     * @return done
     */
	public JButton getDone() {
		return done;
	}
    /**
     * Method to return errorMessage, to facilitate testing.
     * @return errorMessage
     */
	public JLabel getErrorMessage() {
		return errorMessage;
	}
}
