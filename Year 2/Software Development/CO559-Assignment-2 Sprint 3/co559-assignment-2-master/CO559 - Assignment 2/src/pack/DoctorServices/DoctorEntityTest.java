package pack.DoctorServices;

//Commented out until needed, to stop Eclipse IDE complaining.
//import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class DoctorEntityTest {
	private DoctorEntity cnd;

	@Before
	public void setUp() throws Exception {
		cnd = new DoctorEntity();
	}

	
	/**
	 * Tests that getDocId() returns the doctor id set by setDocId()
	 */
	@Test
	public void testSetDocId() {
		cnd.setDocId(3L);
        assert(cnd.getDocId() == 3L);
	}

	
	/**
	 * Test that getFirstName() returns the first name set by setFirstName()
	 */
	@Test
	public void testGetFirstName() {
		cnd.setFirstName("John");
		assert(cnd.getFirstName().equals("John"));
	}

	
	/**
	 * Test that getLastName() returns the last name set by setLastName()
	 */
	@Test
	public void testGetLastName() {
		cnd.setLastName("Smith");
		assert(cnd.getFirstName().equals("Smith"));
	}

	
	/**
	 * Test that getLastRegistration() returns the registration set by setRegistration()
	 */
	@Test
	public void testGetRegistration() {
		cnd.setRegistration("ABCDE");
		assert(cnd.getRegistration().equals("ABCDE"));
	}

}
