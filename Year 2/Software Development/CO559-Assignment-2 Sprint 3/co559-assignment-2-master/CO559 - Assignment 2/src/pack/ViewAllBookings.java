package pack;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import javax.swing.*;
import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;

public class ViewAllBookings extends JPanel{

	GridBagConstraints constrain = new GridBagConstraints();
	private JButton exit;
	private JLabel noteJL, showDate, prescrip, dSurname, dName, patientID, appointID, titleApointID, titlePatID, titlePatName, titlePatSurname, titlePrescr, titleDate;
	private String patID, appointmentID, presc, date, pName, pSurname, note;
	int y;
	
	public ViewAllBookings() {
		setLayout(new GridBagLayout());
		constrain.insets = new Insets(10, 10, 10, 10);

		//Method to set up the panel.
		createPanel(constrain);
        
		y = 2;

		try {
		    //Setting up the driver again. See homepage for more of an explanation.
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root" ,"root");
			System.out.println("Database connection success.");
							
			Statement statement = connection.createStatement();
							
			//Selects all information from appointments table where the doctor that's logged in is assigned.
			ResultSet resultStatement = statement.executeQuery("SELECT * FROM `Appointments Table` WHERE `Username` ='" + Login.nameField.getText() + "' ");
							
			//while there's a record  that satisfies the argument.
			while(resultStatement.next()) {
		
			//get the appropriate information
			    presc = resultStatement.getString("Prescription");
                note = resultStatement.getString("Notes");
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
									
                //creates a label for the patients notes
				noteJL = new JLabel(note);
				constrain.gridx = 4;
				constrain.gridy = y;
				constrain.gridwidth = 1;
			    add(noteJL,constrain);

				//creates a label for the patients prescription
				prescrip = new JLabel(presc);
				constrain.gridx = 5;
				constrain.gridy = y;
				constrain.gridwidth = 1;
				add(prescrip,constrain);
						        
				//creates a label for the patients date.
				showDate = new JLabel(date);
				constrain.gridx = 6;
				constrain.gridy = y;
				constrain.gridwidth = 1;
				add(showDate,constrain);
						        
				y++;
			}
			System.out.println("Maybe display?");

			repaint();
			revalidate();
		

		



		}
		catch (ClassNotFoundException e) {
			System.out.println("Could not find the database driver " + e.getMessage());
		}catch (SQLException e) {
			System.out.println("Could not connect to the database " + e.getMessage());
		}
        
        exit.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent event) {
				Home home = new Home();
				
		        //Removing the view all bookings panel.
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

                    Statement statement5 = connection.createStatement();
                    statement5.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User exited to home', '" + insertedDateAndTime + "');");
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

		//Exit button back to the home panel.
		exit = new JButton("Exit");
		constrain.gridx = 3;
		constrain.gridy = 0;
		add(exit,constrain);

		//column for appointment id
		titleApointID = new JLabel("Appointment ID");
		constrain.gridx = 0;
		constrain.gridy = 1;
		constrain.gridwidth = 1;
		add(titleApointID,constrain);
					        
		//column for patient id
		titlePatID = new JLabel("Patient ID");
		constrain.gridx = 1;
		constrain.gridy = 1;
		constrain.gridwidth = 1;
		add(titlePatID,constrain);
					        
		//column for patients name
		titlePatName = new JLabel("Patient Name");
		constrain.gridx = 2;
		constrain.gridy = 1;
		constrain.gridwidth = 1;
		add(titlePatName,constrain);
					        
		//column for patients surname
		titlePatSurname = new JLabel("Patient Surname");
		constrain.gridx = 3;
		constrain.gridy = 1;
		constrain.gridwidth = 1;
		add(titlePatSurname,constrain);
					        
        //column for patients Notes
		titlePrescr = new JLabel("Notes");
		constrain.gridx = 4;
	    constrain.gridy = 1;
        constrain.gridwidth = 1;
		add(titlePrescr,constrain);

		//column for patients Prescription
		titlePrescr = new JLabel("Prescription");
		constrain.gridx = 5;
		constrain.gridy = 1;
	    constrain.gridwidth = 1;
		add(titlePrescr,constrain);
					        
		//column for patients date
		titleDate = new JLabel("Date");
		constrain.gridx = 6;
		constrain.gridy = 1;
	    constrain.gridwidth = 1;
	    add(titleDate,constrain);
	}
}
