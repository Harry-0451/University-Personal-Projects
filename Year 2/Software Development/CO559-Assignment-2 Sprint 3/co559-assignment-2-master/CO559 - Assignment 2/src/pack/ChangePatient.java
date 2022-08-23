package pack;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import javax.swing.*;

import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;

public class ChangePatient extends JPanel{
    GridBagConstraints constrain = new GridBagConstraints();
    private JButton done,exit;
    private JLabel patientLabel, doctorLabel, errorMessage;
    private JTextField patient,doctor;

    public ChangePatient() {
        setLayout(new GridBagLayout());
        constrain.insets = new Insets(10, 10, 10, 10);

        //Method to set up the panel.
        createPanel(constrain);


        done.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent event) {
                System.out.println("Done was selected in change patient");
                errorMessage.setText("");
                //First, check the patient field isn't empty.
                if(patient.getText().isEmpty()) {
                    errorMessage.setText("Patient field empty.");
                    System.out.println("Patient field empty");
                }
                //Then checks if the doctor field isnt empty.
                else if(doctor.getText().isEmpty()) {
                    errorMessage.setText("Doctor field empty.");
                    System.out.println("Doctor field empty");
                }
                //if they're not empty then this is ran.
                else {
                    try {
                        System.out.println("trying to connect");
                        //connecting to driver (not sure if needed again)
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root" ,"root");
                        
                        //Statements to query if the doctor/patient exists.
                        PreparedStatement ps = connection.prepareStatement("SELECT `Patient ID` FROM `Patients Table` WHERE `Patient ID` = '"+patient.getText()+"';");
                        PreparedStatement qs = connection.prepareStatement("SELECT `Username` FROM `Doctors Table` WHERE `Username` = '"+doctor.getText()+"';");
                        ResultSet rs = ps.executeQuery();
                        ResultSet ns = qs.executeQuery();

                        //if the patient exists it passes
                        if(rs.next()){
                            System.out.println("rs query tried and passed");
                            //if the doctor exists it passes
                            if(ns.next()){
                                //Creates an update statement where it searcheds for the patient ID and changes the username cell of the record.
                                PreparedStatement ls = connection.prepareStatement("UPDATE `patients table` SET Username ='"+doctor.getText()+"' WHERE 'Patient ID' = '"+ patient.getText() + "'");
                                ls.executeUpdate();
                                System.out.println("Patient's doctor should be changed.");
                                //Resets text field and shows a message saying it worked.
                                patient.setText("");
                                doctor.setText("");
                                errorMessage.setText("Patient Doctor Changed.");
                            }
                            else{
                                //If the doctor inputted doesn't exist it shows this.
                                errorMessage.setText("Doctor doesn't exist.");
                                System.out.println("ns query tried and failed");
                            }
                        }
                        else{ 
                            //if the patient entered doesn't exist it shows this.
                            System.out.println("rs query tried and failed");
                            errorMessage.setText("Patient doesn't exist.");
                        }
                        //get current date and time in one
                        String insertedDateAndTime = "";
                        Date todayAndTime = Calendar.getInstance().getTime();
                        SimpleDateFormat format2 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                        insertedDateAndTime = format2.format(todayAndTime);
                        Statement statement7 = connection.createStatement();
                        statement7.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ", '" + Login.nameField.getText() +"', 'User Updated A Patients Doctor', '" + insertedDateAndTime + "');");
                    }
                    catch (ClassNotFoundException e) {
                        System.out.println("Could not find the database driver " + e.getMessage());
                    }catch (SQLException e) {
                        System.out.println("Could not connect to the database " + e.getMessage());
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
                    Connection connection3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root" ,"root");

                    //get current date and time in one
                    String insertedDateAndTime = "";
                    Date todayAndTime = Calendar.getInstance().getTime();
                    SimpleDateFormat format2 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                    insertedDateAndTime = format2.format(todayAndTime);

                    Statement statement7 = connection3.createStatement();
                    statement7.executeQuery("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User exited to main menu', '" + insertedDateAndTime + "');");
                }
                catch (ClassNotFoundException e) {
                    System.out.println("Could not find the database driver " + e.getMessage());
                }catch (SQLException e) {
                    System.out.println("Could not connect to the database " + e.getMessage());
                }
            }
        });
    }
      //Method that constructs the main page to be able to change patients
    public void createPanel(GridBagConstraints x) {
        //Creates a label to show the user what the field is for.
        patientLabel = new JLabel("Patient:");
        constrain.gridx = 0;
        constrain.gridy = 0;
        add(patientLabel,constrain);

        //Text field for the user to enter the new patient
        patient = new JTextField(5);
        constrain.gridx = 5;
        constrain.gridy = 0;
        add(patient,constrain);

        //Creates a label to show the user what the field is for.
        doctorLabel = new JLabel("Change Doctor:");
        constrain.gridx = 0;
        constrain.gridy = 1;
        add(doctorLabel,constrain);

        //Text field for the user to enter the doctor
        doctor = new JTextField(5);
        constrain.gridx = 5;
        constrain.gridy = 1;
        add(doctor,constrain);

        //Done button that makes the change depending on the fields.
        done = new JButton("Save");
        constrain.gridx = 0;
        constrain.gridy = 3;
        add(done,constrain);

        //Exit button back to the home panel.
        exit = new JButton("Exit");
        constrain.gridx = 5;
        constrain.gridy = 3;
        add(exit,constrain);

        //Error message for various errors.
        errorMessage = new JLabel("");
        constrain.gridx = 0;
        constrain.gridy = 4;
        constrain.gridwidth = 6;
        errorMessage.setForeground(Color.RED);
        add(errorMessage,constrain);
    }
}
