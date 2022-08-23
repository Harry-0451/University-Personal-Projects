package pack;

import static org.junit.Assert.*;

import javax.swing.JFrame;

import org.junit.Before;
import org.junit.Test;

public class ViewBookingsTest {
	JFrame javaFrame;
	ViewBookings viewBookings;

	@Before
	public void setUp() throws Exception {
		//Slight alteration of the Main method to facilitate testing
		javaFrame = new JFrame();
		viewBookings = new ViewBookings();
		javaFrame.setTitle("Bookings Test");
		javaFrame.setSize(600, 600);
		javaFrame.setExtendedState(JFrame.MAXIMIZED_BOTH);
		javaFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		javaFrame.setVisible(false);
		javaFrame.setContentPane(viewBookings);
	}
	/**
	 * Tests that ViewBookings returns an appropriate error message if a
	 * non-numeric character is entered into the month field.
	 */
	@Test
	public void testMonthNonNumber() {
		viewBookings.getMonth().setText("April");
		viewBookings.getYear().setText("2020");
		viewBookings.getDone().doClick();
		assert(viewBookings.getErrorMessage().getText().equals("Month Or Year Text Field Cannot Contain Letters."));
	}
	/**
	 * Tests that ViewBookings returns an appropriate error message if a
	 * non-numeric character is entered into the year field.
	 */
	@Test
	public void testYearNonNumber() {
		viewBookings.getMonth().setText("4");
		viewBookings.getYear().setText("Twenty twenty");
		viewBookings.getDone().doClick();
		assert(viewBookings.getErrorMessage().getText().equals("Month Or Year Text Field Cannot Contain Letters."));
	}
	/**
	 * Tests that ViewBookings returns an appropriate error message if the
	 * month field is empty.
	 */
	@Test
	public void testMonthEmpty() {
		viewBookings.getYear().setText("2020");
		viewBookings.getDone().doClick();
		assert(viewBookings.getErrorMessage().getText().equals("Month Or Year Text Field Empty."));
	}
	/**
	 * Tests that ViewBookings returns an appropriate error message if the
	 * year field is empty.
	 */
	@Test
	public void testYearEmpty() {
		viewBookings.getMonth().setText("4");
		viewBookings.getDone().doClick();
		assert(viewBookings.getErrorMessage().getText().equals("Month Or Year Text Field Empty."));
	}
	/**
	 * Tests that ViewBookings returns an appropriate error message if a
	 * number below 1 is entered into the month field.
	 */
	@Test
	public void testMonthBelowBounds() {
		viewBookings.getMonth().setText("0");
		viewBookings.getYear().setText("2020");
		viewBookings.getDone().doClick();
		assert(viewBookings.getErrorMessage().getText().equals("Month must be between 1 and 12."));
	}
	/**
	 * Tests that ViewBookings returns an appropriate error message if a
	 * number above 12 is entered into the month field.
	 */
	@Test
	public void testMonthAboveBounds() {
		viewBookings.getMonth().setText("13");
		viewBookings.getYear().setText("2020");
		viewBookings.getDone().doClick();
		assert(viewBookings.getErrorMessage().getText().equals("Month must be between 1 and 12."));
	}
	/**
	 * Tests that ViewBookings returns an appropriate error message if a
	 * number below 0 is entered into the year field.
	 */
	@Test
	public void testYearBelowBounds() {
		viewBookings.getMonth().setText("4");
		viewBookings.getYear().setText("-500");
		viewBookings.getDone().doClick();
		assert(viewBookings.getErrorMessage().getText().equals("Month Or Year Text Field Cannot Contain Letters."));
	}
	//While we considered having an upper bound on the year, unlike months
	//where we're working within a fixed calendar system of 12 months,
	//there's no technical reason this program couldn't be working in the year 20,000.
}
