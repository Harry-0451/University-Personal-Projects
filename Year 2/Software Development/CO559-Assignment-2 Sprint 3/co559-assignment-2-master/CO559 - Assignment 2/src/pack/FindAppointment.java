package pack;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import javax.swing.*;
import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;
//For simplicity, this class started as a copy of ViewBookings.
//Since, functionally, it also views bookings - except it views only one,
//and it filters by different criteria.
public class FindAppointment extends JPanel{

    GridBagConstraints constrain = new GridBagConstraints();
    private JButton done,exit,back,edit;
    private JLabel prescLabel, noteLabel, apptIDText, note, errorMessage,showDate, prescrip, not, dSurname, dName, patientID, appointID, titleApointID, titlePatID, titlePatName, titlePatSurname, titlePrescr, titleDate;
    private JTextField apptID, prescDetail, prescNote;
    private String patID, presc, date, pName, pSurname, patNotes, apptUsername;
    private boolean viewingAppt;

    public FindAppointment() {
        setLayout(new GridBagLayout());
        constrain.insets = new Insets(10, 10, 10, 10);

        //Method to set up the panel.
        createPanel(constrain);

        done.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent event) {
                    //If either of the text boxes are empty on button click, an error message is displayed
                    //otherwise the program sets up the screen for results



                    try {
                        //Setting up the driver again. See homepage for more of an explanation.
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root" ,"root");
                        System.out.println("Database connection success.");

                        Statement statement = connection.createStatement();
                        //Selects all results where the appointment ID is as specified, and the user is the current user. (The @s are present to prevent SQL injection.)
                        //Since appointment ID is unique, this will only return 0 or 1 records.
                        ResultSet resultStatement = statement.executeQuery("SELECT * FROM `Appointments Table` WHERE `Appointment ID` ='" + apptIDText.getText()+ "' " + "AND `Username` ='" + Login.nameField.getText() + "'");

                        //removes everything on screen.
                        removeAll();
                        //Variable to indicate whether any records were found.
                        boolean hasRun = false;
                        //While there's a record that satisfies the argument.
                        //Which should really only occur once.
                        while(resultStatement.next()) {
                            if (hasRun) {
                                //Something's gone wrong here - it's apparently gone through this already.
                                //Given that appointment ID is unique, that shouldn't be possible.
                                //Better print an error, just to be on the safe side.
                                errorMessage.setText("Error: Multiple matching appointments.");
                            }
                            else {
                                //Set hasRun to true
                                hasRun = true;
                                //Get the appropriate information
                                presc = resultStatement.getString("Prescription");
                                date = resultStatement.getString("Dat");
                                patID = resultStatement.getString("Patient ID");
                                patNotes = resultStatement.getString("Notes");
                            }
                        }
                        if (hasRun == false) {
                            //If hasRun is false, there were no records.
                            //Better print an error.
                            errorMessage.setText("Error: No matching appointment for your username.");
                        }
                        else {

                            //Creates a new label for the patient ID
                            patientID = new JLabel(patID);
                            constrain.gridx = 0;
                            constrain.gridy = 4;
                            constrain.gridwidth = 1;
                            add(patientID,constrain);

                            //New statement that if the record is equal to the current patient ID.
                            Statement statement2 = connection.createStatement();
                            ResultSet resultStatement2 = statement2.executeQuery("SELECT * FROM `Patients Table` WHERE `Patient ID` ='" + patID + "'");
                            boolean hasRunPatient = false;
                            while(resultStatement2.next()) {
                                if (hasRunPatient) {
                                    //We've somehow found multiple records under that patient ID.
                                    //Patient ID is unique, so that can't be right.
                                    //Let's print an error.
                                    errorMessage.setText("Error: Multiple matching patients.");
                                }
                                else if(patID.equals(resultStatement2.getString("Patient ID"))) {
                                    pName = resultStatement2.getString("Name");
                                    pSurname = resultStatement2.getString("Surname");
                                }
                            }

                        //Column for title id
                        titlePatID = new JLabel("Patient ID");
                        constrain.gridx = 0;
                        constrain.gridy = 3;
                        constrain.gridwidth = 1;
                        add(titlePatID,constrain);

                        //Column for patients name
                        titlePatName = new JLabel("Patient Name");
                        constrain.gridx = 1;
                        constrain.gridy = 3;
                        constrain.gridwidth = 1;
                        add(titlePatName,constrain);

                        //Column for patients surname
                        titlePatSurname = new JLabel("Patient Surname");
                        constrain.gridx = 2;
                        constrain.gridy = 3;
                        constrain.gridwidth = 1;
                        add(titlePatSurname,constrain);

                       //Column for patients notes
                       note = new JLabel("Notes");
                       constrain.gridx = 3;
                       constrain.gridy = 3;
                       constrain.gridwidth = 1;
                       add(note,constrain);

                        //Column for patients Prescription
                        titlePrescr = new JLabel("Prescription");
                        constrain.gridx = 4;
                        constrain.gridy = 3;
                        constrain.gridwidth = 1;
                        add(titlePrescr,constrain);

                        //Column for patients date
                        titleDate = new JLabel("Date");
                        constrain.gridx = 5;
                        constrain.gridy = 3;
                        constrain.gridwidth = 1;
                        add(titleDate,constrain);

                            //Creates a label for the patients name
                            dName = new JLabel(pName);
                            constrain.gridx = 1;
                            constrain.gridy = 4;
                            constrain.gridwidth = 1;
                            add(dName,constrain);

                            //creates a label for the patients surname
                            dSurname = new JLabel(pSurname);
                            constrain.gridx = 2;
                            constrain.gridy = 4;
                            constrain.gridwidth = 1;
                            add(dSurname,constrain);

                            //creates a label for the patients prescription
                            not = new JLabel(patNotes);
                            constrain.gridx = 3;
                            constrain.gridy = 4;
                            constrain.gridwidth = 1;
                            add(not,constrain);

                            //creates a label for the patients prescription
                            prescrip = new JLabel(presc);
                            constrain.gridx = 4;
                            constrain.gridy = 4;
                            constrain.gridwidth = 1;
                            add(prescrip,constrain);

                            //creates a label for the patients date.
                            showDate = new JLabel(date);
                            constrain.gridx = 5;
                            constrain.gridy = 4;
                            constrain.gridwidth = 1;
                            add(showDate,constrain);

                        }

                        //Back button the view bookings page
                        back = new JButton("Back");
                        constrain.gridx = 5;
                        constrain.gridy = 1;
                        add(back,constrain);

                        //Edit button that allows you to edit prescription details
                        edit = new JButton("Update prescription details");
                        constrain.gridx = 4;
                        constrain.gridy = 1;
                        add(edit,constrain);

                        prescLabel = new JLabel("Enter new prescription: ");
                        constrain.gridx = 0;
                        constrain.gridy = 1;
                        constrain.gridwidth = 1;
                        add(prescLabel,constrain);

                        //Text field for the user to update the prescription
                        prescDetail = new JTextField(6);
                        constrain.gridx = 1;
                        constrain.gridy = 1;
                        add(prescDetail,constrain);

                        noteLabel = new JLabel("Enter new Notes: ");
                        constrain.gridx = 2;
                        constrain.gridy = 1;
                        constrain.gridwidth = 1;
                        add(noteLabel,constrain);

                        //Text field for the user to update meeting details
                        prescNote = new JTextField(10);
                        constrain.gridx = 3;
                        constrain.gridy = 1;
                        add(prescNote,constrain);

                        repaint();
                        revalidate();

                        //Back button leads to the find appointment page
                        back.addActionListener(new ActionListener() {
                                @Override
                                public void actionPerformed(ActionEvent event) {

                                    FindAppointment findA = new FindAppointment();
                                    //Removing the table information.
                                    removeAll();

                                    //Adding the bookings panel.
                                    add(findA);
                                    repaint();
                                    revalidate();





                                    /*


                                    CODE FOR ADDING TO LOG TABLE WIP - MAY NEED FIXING


                                    */
                                    //Adds to log table based on action performed by the user
                                    
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
                                        statement5.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User clicked back', '" + insertedDateAndTime + "');");
                                    }
                                    catch (ClassNotFoundException e) {
                                        System.out.println("Could not find the database driver " + e.getMessage());
                                    }catch (SQLException e) {
                                        System.out.println("Could not connect to the database " + e.getMessage());
                                    }
                                    
                                    
                                    
                                    }


                                
                            });


                            /*

                            END OF CODE FOR ADDING TO LOG TABLE WIP - MAY NEED FIXING

                            */

                        //Edit button updates the prescription details and sends a message
                        edit.addActionListener(new ActionListener() {
                                @Override
                                public void actionPerformed(ActionEvent event) {
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root" ,"root");
                                        //Update prescription details
                                        Statement statement = connection.createStatement();
                                        statement.executeQuery("UPDATE `Patients Table` SET `Prescription` ='" + prescDetail.getText() + "' WHERE `Appointment ID` =" + apptIDText.getText());
                                        Statement statement2 = connection.createStatement();
                                        statement2.executeQuery("UPDATE `Patients Table` SET `Notes` ='" + prescNote.getText() + "' WHERE `Appointment ID` =" + apptIDText.getText());
                                        
                                        //Get the current date
                                        String insertedDate = "";
                                        Date today = Calendar.getInstance().getTime();
                                        SimpleDateFormat format = new SimpleDateFormat("dd/mm/yyyy");
                                        insertedDate = format.format(today);
                                        
                                        //Add messages
                                        Statement statement3 = connection.createStatement();
                                        statement3.executeUpdate("INSERT INTO `Messages Table` (`Message ID`, `Username`, `Message`, `Date`, `Username & Patient ID`) VALUES (" + MIDFinder.get() + ", 'System', 'Prescription updated', '" + insertedDate + "','" + Login.nameField.getText() +"');");
                                        Statement statement4 = connection.createStatement();
                                        statement4.executeUpdate("INSERT INTO `Messages Table` (`Message ID`, `Username`, `Message`, `Date`, `Username & Patient ID`) VALUES (" + MIDFinder.get() + ", 'System', 'Prescription updated', '" + insertedDate + "', '" + patID +"');");
                                        
                                        
                                        //connecting to driver (not sure if needed again)
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection connection1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root" ,"root");

                                        //get current date and time in one
                                        String insertedDateAndTime = "";
                                        Date todayAndTime = Calendar.getInstance().getTime();
                                        SimpleDateFormat format2 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                                        insertedDateAndTime = format2.format(todayAndTime);

                                        Statement statement6 = connection1.createStatement();
                                        statement6.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User edited patient record', '" + insertedDateAndTime + "');");
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
                        Connection connection3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root" ,"root");

                        //get current date and time in one
                        String insertedDateAndTime = "";
                        Date todayAndTime = Calendar.getInstance().getTime();
                        SimpleDateFormat format2 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                        insertedDateAndTime = format2.format(todayAndTime);

                        Statement statement7 = connection3.createStatement();
                        statement7.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User exited program', '" + insertedDateAndTime + "');");
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
        //Creates a label to show the user what the field is for.
        apptIDText = new JLabel("Enter appointment ID: ");
        constrain.gridx = 0;
        constrain.gridy = 0;
        add(apptIDText,constrain);

        //Text field for the user to enter the appointment ID
        apptID = new JTextField(4);
        constrain.gridx = 1;
        constrain.gridy = 0;
        add(apptID,constrain);

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

        //Error message for various errors.
        errorMessage = new JLabel("");
        constrain.gridx = 0;
        constrain.gridy = 2;
        constrain.gridwidth = 4;
        errorMessage.setForeground(Color.RED);
        add(errorMessage,constrain);
    }
        //The following methods are used for testing
        public JTextField getApptID()
        {
            return apptID;
        }
        public JButton getDone()
        {
            return done;
        }
        public JLabel getErrorMessage()
        {
            return errorMessage;
        }
}
