import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import javax.swing.*;
import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;
public class CreateAppointment extends JPanel{

    GridBagConstraints constrain = new GridBagConstraints();
    private JButton done,exit,back,edit;
    private JLabel patIDTxt, noteTxt, dayTxt, monthTxt, yearTxt, errorMessage;
    private JTextField patID, note, day, month, year;

    public CreateAppointment() {
        setLayout(new GridBagLayout());
        constrain.insets = new Insets(10, 10, 10, 10);

        //Method to set up the panel.
        createPanel(constrain);

        done.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent event) {
                    errorMessage.setText("");
                    //First, check the date in detail.
                    if(day.getText().isEmpty() ) {
                        errorMessage.setText("Day field empty.");
                    }
                    else if(month.getText().isEmpty() ) {
                        errorMessage.setText("Month field empty.");
                    }
                    else if(year.getText().isEmpty()) {
                        errorMessage.setText("Year field empty.");
                    }
                    else if (day.getText().matches("[0-9]+") == false) {
                        errorMessage.setText("Day field cannot contain letters.");
                    }
                    else if (month.getText().matches("[0-9]+") == false) {
                        errorMessage.setText("Month field cannot contain letters.");
                    }
                    else if (year.getText().matches("[0-9]+") == false) {
                        //This also covers if the year is negative, which we decided on
                        //as the boundary for an invalid year.
                        errorMessage.setText("Year field cannot contain letters.");
                    }
                    else if (Integer.parseInt(day.getText()) < 1) {
                        errorMessage.setText("Invalid date.");
                    }
                    else if (Integer.parseInt(day.getText()) > 31) {
                        errorMessage.setText("Invalid date.");
                    }
                    else if (Integer.parseInt(month.getText()) > 12 || Integer.parseInt(month.getText()) < 1) {
                        errorMessage.setText("Month must be between 1 and 12.");
                    }
                    else {
                        //Detailed month validity is put in its own section
                        boolean validDayMonth = true;
                        if (Integer.parseInt(month.getText()) == 2) {
                            if (Integer.parseInt(day.getText()) > 29) {
                                errorMessage.setText("Invalid date.");
                                validDayMonth = false;
                            }
                            else if (Integer.parseInt(day.getText()) == 29 && (Integer.parseInt(year.getText()) % 4 > 0)) {
                                //Can't forget about leap years!
                                errorMessage.setText("Invalid date.");
                                validDayMonth = false;
                            }
                        }
                        else if (Integer.parseInt(day.getText()) == 31) {
                            if (Integer.parseInt(month.getText()) == 4) {
                                errorMessage.setText("Invalid date.");
                                validDayMonth = false;
                            }
                            else if (Integer.parseInt(month.getText()) == 6) {
                                errorMessage.setText("Invalid date.");
                                validDayMonth = false;
                            }
                            else if (Integer.parseInt(month.getText()) == 9) {
                                errorMessage.setText("Invalid date.");
                                validDayMonth = false;
                            }
                            else if (Integer.parseInt(month.getText()) == 11) {
                                errorMessage.setText("Invalid date.");
                                validDayMonth = false;
                            }
                        }
                        if (validDayMonth) {
                            try {
                                //connecting to driver (not sure if needed again)
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root" ,"root");
                                Statement statement = connection.createStatement();
                                statement.executeUpdate("INSERT INTO `Appointments Table` (`Appointment ID`, `Patient ID`, `Username`, `Notes`, `Dat`) VALUES (" + AIDFinder.get() + "),'" + patID.getText() + "','" + Login.nameField.getText() + "','" + note.getText() + "', +'" + year.getText() + "-" + month.getText() + "-" + day.getText() + "';");

                                //get current date and time in one
                                String insertedDateAndTime = "";
                                Date todayAndTime = Calendar.getInstance().getTime();
                                SimpleDateFormat format2 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                                insertedDateAndTime = format2.format(todayAndTime);

                                Statement statement7 = connection.createStatement();
                                statement7.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User created appointment', '" + insertedDateAndTime + "');");
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
        patIDTxt = new JLabel("Enter patient ID: ");
        constrain.gridx = 0;
        constrain.gridy = 0;
        add(patIDTxt,constrain);

        //Text field for the user to enter the patient ID
        patID = new JTextField(4);
        constrain.gridx = 1;
        constrain.gridy = 0;
        add(patID,constrain);

        //Creates a label to show the user what the field is for.
        noteTxt = new JLabel("Enter any notes: ");
        constrain.gridx = 0;
        constrain.gridy = 1;
        add(noteTxt,constrain);

        //Text field for the user to enter any notes
        note = new JTextField(10);
        constrain.gridx = 1;
        constrain.gridy = 1;
        add(note,constrain);

        //Creates a label to show the user what the field is for.
        dayTxt = new JLabel("Enter day:");
        constrain.gridx = 0;
        constrain.gridy = 2;
        add(dayTxt,constrain);

        //Text field for the user to enter day
        day = new JTextField(2);
        constrain.gridx = 1;
        constrain.gridy = 2;
        add(day,constrain);

        //Creates a label to show the user what the field is for.
        monthTxt = new JLabel("Enter month:");
        constrain.gridx = 2;
        constrain.gridy = 2;
        add(monthTxt,constrain);

        //Text field for the user to enter month
        month = new JTextField(2);
        constrain.gridx = 3;
        constrain.gridy = 2;
        add(month,constrain);

        //Creates a label to show the user what the field is for.
        yearTxt = new JLabel("Enter year:");
        constrain.gridx = 4;
        constrain.gridy = 2;
        add(yearTxt,constrain);

        //Text field for the user to enter year
        year = new JTextField(4);
        constrain.gridx = 5;
        constrain.gridy = 2;
        add(year,constrain);

        //Done button that creates a search depending on the information entered into the fields.
        done = new JButton("Add");
        constrain.gridx = 1;
        constrain.gridy = 3;
        add(done,constrain);

        //Exit button back to the home panel.
        exit = new JButton("Exit");
        constrain.gridx = 2;
        constrain.gridy = 3;
        add(exit,constrain);

        //Error message for various errors.
        errorMessage = new JLabel("");
        constrain.gridx = 0;
        constrain.gridy = 4;
        constrain.gridwidth = 4;
        errorMessage.setForeground(Color.RED);
        add(errorMessage,constrain);
    }
    //The following methods are used for testing    
    /** Method to return month, to facilitate testing.
     * @return month
     */
    public JTextField getDay() {
        return day;
    }

    /** Method to return month, to facilitate testing.
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
