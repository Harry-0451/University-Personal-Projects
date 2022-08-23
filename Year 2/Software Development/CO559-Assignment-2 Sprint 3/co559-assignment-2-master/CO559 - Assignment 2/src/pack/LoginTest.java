package pack;

import static org.junit.Assert.*;

import javax.swing.JFrame;

import org.junit.Before;
import org.junit.Test;

public class LoginTest {
	JFrame javaFrame;
	Login loginPanel;
	@Before
	public void setUp() throws Exception {
		//Copy of the Main method to facilitate testing
		javaFrame = new JFrame();
		loginPanel = new Login();
		javaFrame.setTitle("Login Test");
		javaFrame.setSize(600, 600);
		javaFrame.setExtendedState(JFrame.MAXIMIZED_BOTH);
		javaFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		javaFrame.setVisible(false);
		javaFrame.setContentPane(loginPanel);
	}
	/**
	 * Tests that loginPanel works correctly with correct info
	 */
	@Test
	public void testLoginCorrectInfo() {
		loginPanel.getNameField().setText("hhac01");
		loginPanel.getPassField().setText("123");
		loginPanel.getLoginButton().doClick();
		//If the error message is blank, there's been no error.
		//This can also occur if the program fails to connect
		//to the database, but other tests will fail in that case.
		assert(loginPanel.getErrorMessage().getText().equals(""));
	}
	/**
	 * Tests that loginPanel gives an appropriate error message for an incorrect username
	 * In practice, this should be the same as the below test,
	 */
	@Test
	public void testLoginIncorrectUsername() {
		loginPanel.getNameField().setText("hhhac01");
		loginPanel.getPassField().setText("123");
		loginPanel.getLoginButton().doClick();
		assert(loginPanel.getErrorMessage().getText().equals("Incorrect Username Or Password Used."));
	}
	/**
	 * Tests that loginPanel gives an appropriate error message for an incorrect password
	 */
	@Test
	public void testLoginIncorrectPassword() {
		loginPanel.getNameField().setText("hhac01");
		loginPanel.getPassField().setText("obviously wrong password");
		loginPanel.getLoginButton().doClick();
		assert(loginPanel.getErrorMessage().getText().equals("Incorrect Username Or Password Used."));
	}
	/**
	 * Tests that loginPanel gives an appropriate error message for an incorrect username + password combo
	 */
	@Test
	public void testLoginIncorrectCombo() {
		loginPanel.getNameField().setText("tje01");
		loginPanel.getPassField().setText("123");
		loginPanel.getLoginButton().doClick();
		assert(loginPanel.getErrorMessage().getText().equals("Incorrect Username Or Password Used."));
	}
	/**
	 * Tests that loginPanel gives an appropriate error message for a blank username.
	 */
	@Test
	public void testLoginBlankUsername() {
		loginPanel.getPassField().setText("123");
		loginPanel.getLoginButton().doClick();
		assert(loginPanel.getErrorMessage().getText().equals("Username Or Password Not Entered."));
	}
	/**
	 * Tests that loginPanel gives an appropriate error message for a blank password
	 */
	@Test
	public void testLoginBlankPassword() {
		loginPanel.getNameField().setText("hhac01");
		loginPanel.getLoginButton().doClick();
		assert(loginPanel.getErrorMessage().getText().equals("Username Or Password Not Entered."));
	}

}
