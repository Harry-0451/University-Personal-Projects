//Assignment 2 - Group 3E

package pack;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import javax.swing.*;
import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;

//Login authorisation feature & unseen message welcome screen
public class Login extends JPanel{
	
	private JLabel username,password,errorMessage;
	static JTextField nameField;
	private JTextField passField;
	private JButton loginButton;
    
	GridBagConstraints constrain = new GridBagConstraints();
	
    public Login() {
		setLayout(new GridBagLayout());
		constrain.insets = new Insets(10, 10, 0, 0);
    	
		//New username JLabel is created and added, along with the constraints the label has.
        username = new JLabel("Username: ");
        constrain.gridx = 0;
        constrain.gridy = 0;
        constrain.ipadx = 0; 
        add(username,constrain);
       
        //Provides a method for the user to enter their username.
        nameField = new JTextField(10);
        constrain.gridx = 1;
        constrain.gridy = 0;
        constrain.ipadx = 50;
        add(nameField,constrain);

        //New password JLabel is created and added, along with the constraints the label has.
        password = new JLabel("Password: ");
        constrain.gridx = 0;
        constrain.gridy = 1;
        constrain.ipadx = 0; 
        add(password,constrain);

        //Provides a method for the user to enter their password
        passField = new JTextField(10);
        constrain.gridx = 1;
        constrain.gridy = 1;
        constrain.ipadx = 50; 
        add(passField,constrain);

        //Login button that checks the username and password in reference to the database.
        loginButton = new JButton("Login");
        constrain.gridx = 0;
        constrain.gridy = 2;
        constrain.gridwidth = 2;
        add(loginButton,constrain);

        //New error message JLabel is created and added, along with the constraints the label has.
        errorMessage = new JLabel("");
        constrain.gridx = 0;
        constrain.gridy = 3;
        constrain.gridwidth = 2;
        constrain.ipadx = 0; 
        errorMessage.setForeground(Color.RED);
        add(errorMessage,constrain);
        
        //Action listener is used on the login button, once that button is clicked the block of code is ran
        loginButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent event) {
				//If the name field or the password field is empty
				if(nameField.getText().isEmpty() || passField.getText().isEmpty()) {
					//An error message is shown saying that the username / password hasn't been entered + console info.
					errorMessage.setText("Username or password not entered.");
					System.out.println("Username or password not entered.");
				}
				else {
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
						ResultSet resultStatement = statement.executeQuery("SELECT * FROM `Doctors Table` where Username ='" + nameField.getText() + "' and Password ='" + passField.getText() + "'");
						
						//Check to see if the query is satisfied.
						if(resultStatement.next()) {
							//If yes, then the connection to the database is closed and the home panel is created + more console info.
							statement.close();
					        System.out.println("Correct username and password used");
					        Welcome welcomePage = new Welcome();
					        
					        //Removing the login panel.
					        removeAll();
					        
					        //Adding the welcome panel.
					        add(welcomePage);
					        repaint();
					        revalidate();
					        
					        //I couldn't find a better way to really do this or if this is the "proper" way.
					        //If you find/think of anything better then let me know, ty- Harry.
						}
						else {
							//Otherwise an error message is shown to the user + more console info.
							errorMessage.setText("Incorrect username or password used.");
							System.out.println("Incorrect username or password");
						}
						
						//get current date and time in one
	                    String insertedDateAndTime = "";
	                    Date todayAndTime = Calendar.getInstance().getTime();
	                    SimpleDateFormat format2 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	                    insertedDateAndTime = format2.format(todayAndTime);

	                    Statement statement5 = connection.createStatement();
	                    statement5.executeUpdate("INSERT INTO `Logs Table` (`Log ID`, `Username`, `Accessed` , `Date & Time`) VALUES (" + LIDFinder.get() + ",'" + Login.nameField.getText() +"', 'User logged into system', '" + insertedDateAndTime + "');");
						
						
					}
					catch (ClassNotFoundException e) {
						System.out.println("Could not find the database driver " + e.getMessage());
					}catch (SQLException e) {
						System.out.println("Could not connect to the database " + e.getMessage());
					}
					//**NOTE THESE CATCH STATEMENTS ARE NEEDED ALONG WITH THE TRY STATEMENT AT THE TOP**
				}
			}
		});
    }
    //Methods below are used for testing
    /**
     * Method to return nameField, to facilitate testing.
     * @return nameField
     */
    public JTextField getNameField() {
    	return nameField;
    }
    /**
     * Method to return passField, to facilitate testing.
     * @return passField
     */
    public JTextField getPassField() {
    	return passField;
    }
    /**
     * Method to return loginButton, to facilitate testing.
     * @return loginButton
     */
    public JButton getLoginButton() {
    	return loginButton;
    }
    /**
     * Method to return errorMessage, to facilitate testing.
     * @return errorMessage
     */
    public JLabel getErrorMessage() {
    	return errorMessage;
    }
}
