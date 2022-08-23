
import static org.junit.Assert.*;
import javax.swing.JFrame;
import org.junit.Before;
import org.junit.Test;

public class CreateAppointmentTest {
    JFrame javaFrame;
    CreateAppointment createAppointment;

    @Before
    public void setUp() throws Exception {
        //Slight alteration of the Main method to facilitate testing
        javaFrame = new JFrame();
        createAppointment = new CreateAppointment();
        javaFrame.setTitle("Appointment Test");
        javaFrame.setSize(600, 600);
        javaFrame.setExtendedState(JFrame.MAXIMIZED_BOTH);
        javaFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        javaFrame.setVisible(false);
        javaFrame.setContentPane(createAppointment);
    }

    /**
     * Tests that ViewBookings returns an appropriate error message if a
     * non-numeric character is entered into the month field.
     */
    @Test
    public void testDayNonNumber() {
        createAppointment.getDay().setText("Twelve");
        createAppointment.getMonth().setText("4");
        createAppointment.getYear().setText("2020");
        createAppointment.getDone().doClick();
        assert(createAppointment.getErrorMessage().getText().equals("Day field cannot contain letters."));
    }

    /**
     * Tests that ViewBookings returns an appropriate error message if a
     * non-numeric character is entered into the month field.
     */
    @Test
    public void testMonthNonNumber() {
        createAppointment.getDay().setText("12");
        createAppointment.getMonth().setText("April");
        createAppointment.getYear().setText("2020");
        createAppointment.getDone().doClick();
        assert(createAppointment.getErrorMessage().getText().equals("Month field cannot contain letters."));
    }

    /**
     * Tests that ViewBookings returns an appropriate error message if a
     * non-numeric character is entered into the year field.
     */
    @Test
    public void testYearNonNumber() {
        createAppointment.getDay().setText("12");
        createAppointment.getMonth().setText("4");
        createAppointment.getYear().setText("Twenty twenty");
        createAppointment.getDone().doClick();
        assert(createAppointment.getErrorMessage().getText().equals("Year field cannot contain letters."));
    }

    /**
     * Tests that ViewBookings returns an appropriate error message if the
     * year field is empty.
     */
    @Test
    public void testDayEmpty() {
        createAppointment.getMonth().setText("4");
        createAppointment.getYear().setText("2020");
        createAppointment.getDone().doClick();
        assert(createAppointment.getErrorMessage().getText().equals("Day field empty."));
    }

    /**
     * Tests that ViewBookings returns an appropriate error message if the
     * month field is empty.
     */
    @Test
    public void testMonthEmpty() {
        createAppointment.getDay().setText("12");
        createAppointment.getYear().setText("2020");
        createAppointment.getDone().doClick();
        assert(createAppointment.getErrorMessage().getText().equals("Month field empty."));
    }

    /**
     * Tests that ViewBookings returns an appropriate error message if the
     * year field is empty.
     */
    @Test
    public void testYearEmpty() {
        createAppointment.getDay().setText("12");
        createAppointment.getMonth().setText("4");
        createAppointment.getDone().doClick();
        assert(createAppointment.getErrorMessage().getText().equals("Year field empty."));
    }

    /**
     * Tests that CreateAppointment returns an appropriate error message if a
     * number below 1 is entered into the day field.
     */
    @Test
    public void testDayBelowBounds() {
        createAppointment.getDay().setText("0");
        createAppointment.getMonth().setText("4");
        createAppointment.getYear().setText("2020");
        createAppointment.getDone().doClick();
        assert(createAppointment.getErrorMessage().getText().equals("Invalid date."));
    }

    /**
     * Tests that CreateAppointment returns an appropriate error message if a
     * number above 31 is entered into the day field.
     */
    @Test
    public void testDayAboveBounds1() {
        createAppointment.getDay().setText("50");
        createAppointment.getMonth().setText("4");
        createAppointment.getYear().setText("2020");
        createAppointment.getDone().doClick();
        assert(createAppointment.getErrorMessage().getText().equals("Invalid date."));
    }

    /**
     * Tests that CreateAppointment returns an appropriate error message if 31
     * is entered into the day field on a month that does not have 31 days.
     */
    @Test
    public void testDayAboveBounds2() {
        createAppointment.getDay().setText("31");
        createAppointment.getMonth().setText("4");
        createAppointment.getYear().setText("2020");
        createAppointment.getDone().doClick();
        assert(createAppointment.getErrorMessage().getText().equals("Invalid date."));
    }

    /**
     * Tests that CreateAppointment returns an appropriate error message if 30
     * is entered into the day field on February.
     */
    @Test
    public void testDayAboveBounds3() {
        createAppointment.getDay().setText("30");
        createAppointment.getMonth().setText("2");
        createAppointment.getYear().setText("2020");
        createAppointment.getDone().doClick();
        assert(createAppointment.getErrorMessage().getText().equals("Invalid date."));
    }

    /**
     * Tests that CreateAppointment returns an appropriate error message if 29
     * is entered into the day field on February on a non-leap year.
     */
    @Test
    public void testDayAboveBounds4() {
        createAppointment.getDay().setText("29");
        createAppointment.getMonth().setText("2");
        createAppointment.getYear().setText("2021");
        createAppointment.getDone().doClick();
        assert(createAppointment.getErrorMessage().getText().equals("Invalid date."));
    }

    /**
     * Tests that ViewBookings returns an appropriate error message if a
     * number below 1 is entered into the month field.
     */
    @Test
    public void testMonthBelowBounds() {
        createAppointment.getDay().setText("12");
        createAppointment.getMonth().setText("0");
        createAppointment.getYear().setText("2020");
        createAppointment.getDone().doClick();
        assert(createAppointment.getErrorMessage().getText().equals("Month must be between 1 and 12."));
    }

    /**
     * Tests that ViewBookings returns an appropriate error message if a
     * number above 12 is entered into the month field.
     */
    @Test
    public void testMonthAboveBounds() {
        createAppointment.getDay().setText("12");
        createAppointment.getMonth().setText("13");
        createAppointment.getYear().setText("2020");
        createAppointment.getDone().doClick();
        assert(createAppointment.getErrorMessage().getText().equals("Month must be between 1 and 12."));
    }

    /**
     * Tests that ViewBookings returns an appropriate error message if a
     * number below 0 is entered into the year field.
     */
    @Test
    public void testYearBelowBounds() {
        createAppointment.getDay().setText("12");
        createAppointment.getMonth().setText("4");
        createAppointment.getYear().setText("-500");
        createAppointment.getDone().doClick();
        assert(createAppointment.getErrorMessage().getText().equals("Year field cannot contain letters."));
    }
    //While we considered having an upper bound on the year, unlike months
    //where we're working within a fixed calendar system of 12 months,
    //there's no technical reason this program couldn't be working in the year 20,000.
}
