//Assignment 2 - Group 3E


import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import javax.swing.*;
import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.swing.*;

public class Home extends JPanel{

    GridBagConstraints constrain = new GridBagConstraints();
    private JButton view_Bookings, view_Patient, logOut, find_Booking, view_All_Bookings, create_Booking,change_Patient;

    public Home() {
        setLayout(new GridBagLayout());
        constrain.insets = new Insets(10, 50, 0, 0);

        //Button that moves to the view bookings page.
        view_Bookings = new JButton("View Bookings by Date");
        constrain.gridx = 0;
        constrain.gridy = 0;
        constrain.ipadx = 0; 
        add(view_Bookings,constrain);

        //Button that moves to the view patients page.
        view_Patient = new JButton("View Your Patients");
        constrain.gridx = 1;
        constrain.gridy = 0;
        constrain.ipadx = 0; 
        add(view_Patient,constrain);

        //Button that moves to the find booking page.
        find_Booking = new JButton("Edit Details of a Booking");
        constrain.gridx = 2;
        constrain.gridy = 0;
        constrain.ipadx = 0; 
        add(find_Booking,constrain);

        //Button that moves to the find booking page.
        view_All_Bookings = new JButton("View All Bookings");
        constrain.gridx = 3;
        constrain.gridy = 0;
        constrain.ipadx = 0; 
        add(view_All_Bookings,constrain);

        //Button that moves to the find booking page.
        create_Booking = new JButton("Create Booking");
        constrain.gridx = 4;
        constrain.gridy = 0;
        constrain.ipadx = 0; 
        add(create_Booking,constrain);

        change_Patient = new JButton("Change Patient");
        constrain.gridx = 5;
        constrain.gridy = 0;
        constrain.ipadx = 0; 
        add(change_Patient,constrain);
        //Goes to the login page
        logOut = new JButton("Logout");
        constrain.gridx = 2;
        constrain.gridy = 1;
        constrain.ipadx = 0; 
        constrain.gridwidth = 2;
        add(logOut,constrain);

        
        //Action listener is used on the view_Bookings button, once that button is clicked the block of code is ran.
        view_Bookings.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent event) {
                    ViewBookings viewBookings = new ViewBookings();

                    //Removing the Home panel.
                    removeAll();

                    //Adding the view bookings panel.
                    add(viewBookings);
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
                        statement5.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User viewed booking', '" + insertedDateAndTime + "');");
                    }
                    catch (ClassNotFoundException e) {
                        System.out.println("Could not find the database driver " + e.getMessage());
                    }catch (SQLException e) {
                        System.out.println("Could not connect to the database " + e.getMessage());
                    }

                }
            });

        view_All_Bookings.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent event) {
                    ViewAllBookings viewBooks = new ViewAllBookings();

                    //Removing the Home panel.
                    removeAll();

                    //Adding the view all bookings panel.
                    add(viewBooks);
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

                        Statement statement6 = connection.createStatement();
                        statement6.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User viewed all bookings', '" + insertedDateAndTime + "');");
                    }
                    catch (ClassNotFoundException e) {
                        System.out.println("Could not find the database driver " + e.getMessage());
                    }catch (SQLException e) {
                        System.out.println("Could not connect to the database " + e.getMessage());
                    }

                }
            });

        //Loads the view patients panel
        view_Patient.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent event) {
                    ViewPatients patients = new ViewPatients();

                    //Removing the Home panel.
                    removeAll();

                    //Adding the view patient panel.
                    add(patients);
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

                        Statement statement4 = connection.createStatement();
                        statement4.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User viewed patients', '" + insertedDateAndTime + "');");
                    }
                    catch (ClassNotFoundException e) {
                        System.out.println("Could not find the database driver " + e.getMessage());
                    }catch (SQLException e) {
                        System.out.println("Could not connect to the database " + e.getMessage());
                    }

                }
            });

        //Loads the view patients panel
        find_Booking.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent event) {
                    FindAppointment findA = new FindAppointment();

                    //Removing the Home panel.
                    removeAll();

                    //Adding the FindAppointment panel.
                    add(findA);
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

                        Statement statement3 = connection.createStatement();
                        statement3.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User searched for booking', '" + insertedDateAndTime + "');");
                    }
                    catch (ClassNotFoundException e) {
                        System.out.println("Could not find the database driver " + e.getMessage());
                    }catch (SQLException e) {
                        System.out.println("Could not connect to the database " + e.getMessage());
                    }

                }
            });

                    //Loads the view patients panel
        create_Booking.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent event) {
                    CreateAppointment createA = new CreateAppointment();

                    //Removing the Home panel.
                    removeAll();

                    //Adding the create booking panel.
                    add(createA);
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

                        Statement statement3 = connection.createStatement();
                        statement3.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User accessed create booking page', '" + insertedDateAndTime + "');");
                    }
                    catch (ClassNotFoundException e) {
                        System.out.println("Could not find the database driver " + e.getMessage());
                    }catch (SQLException e) {
                        System.out.println("Could not connect to the database " + e.getMessage());
                    }

                }
            });
            
        //Loads the logout panel.
        logOut.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent event) {
                    Login login = new Login();

                    //Removing the Home panel.
                    removeAll();

                    //Adding the login panel.
                    add(login);
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

                        Statement statement2 = connection.createStatement();
                        statement2.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User logged out of system', '" + insertedDateAndTime + "');");
                    }
                    catch (ClassNotFoundException e) {
                        System.out.println("Could not find the database driver " + e.getMessage());
                    }catch (SQLException e) {
                        System.out.println("Could not connect to the database " + e.getMessage());
                    }

                }
            });


            change_Patient.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent event) {
                    ChangePatient changePatient = new ChangePatient();

                    //Removing the Home panel.
                    removeAll();

                    //Adding the change patient panel.
                    add(changePatient);
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
                        statement5.executeUpdate("INSERT INTO `Logs Table`"+"VALUES (" + LIDFinder.get() + ", '" + Login.nameField.getText() +"', 'User entered change patient', '" + insertedDateAndTime + "')");
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
