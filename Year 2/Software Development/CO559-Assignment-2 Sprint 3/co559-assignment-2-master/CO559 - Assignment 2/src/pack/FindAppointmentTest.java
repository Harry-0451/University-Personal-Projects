import static org.junit.Assert.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import javax.swing.JFrame;

public class FindAppointmentTest
{
    JFrame javaFrame;
    FindAppointment findAppointmentPanel;
    @Before
    public void setUp() throws Exception {
        //Copy of the Main method to facilitate testing
        javaFrame = new JFrame();
        findAppointmentPanel = new FindAppointment();
        javaFrame.setTitle("FindAppointment Test");
        javaFrame.setSize(600, 600);
        javaFrame.setExtendedState(JFrame.MAXIMIZED_BOTH);
        javaFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        javaFrame.setVisible(true);
        javaFrame.setContentPane(findAppointmentPanel);
    }
    @Test
    public void testIncorrectUsername() {
        findAppointmentPanel.getApptID().setText("abc123");
        findAppointmentPanel.getDone().doClick();
        assert(findAppointmentPanel.getErrorMessage().getText().equals("Error: No matching appointment for your username."));
    }
    @Test
    public void testBlankUsername() {
        findAppointmentPanel.getApptID().setText("");
        findAppointmentPanel.getDone().doClick();
        assert(findAppointmentPanel.getErrorMessage().getText().equals("Error: No matching appointment for your username."));
    }
    //This one is particularly important!
    @Test
    public void testSqlInjection() {
        findAppointmentPanel.getApptID().setText("abc123 OR 1=1");
        findAppointmentPanel.getDone().doClick();
        assert(findAppointmentPanel.getErrorMessage().getText().equals("Error: No matching appointment for your username."));
    }
}
