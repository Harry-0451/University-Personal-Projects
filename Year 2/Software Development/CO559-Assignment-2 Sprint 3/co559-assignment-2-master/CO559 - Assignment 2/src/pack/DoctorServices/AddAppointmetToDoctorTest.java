/**
 * 
 */
package pack.DoctorServices;

//This is automatically imported when creating a test class,
//but Eclipse warns that it isn't used, and the class works
//correctly without it.
//Delete later if not needed.
//import static org.junit.Assert.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class AddAppointmetToDoctorTest {
    private AddAppointmetToDoctor aatd;

	/**
	 * @throws java.lang.Exception
	 */
	@BeforeEach
	public void setUp() throws Exception {
		aatd = new AddAppointmetToDoctor();
	}

	/**
	 * Tests that getDoctorId() returns the doctor id set by setDoctorId()
	 */
	@Test
	void testSetDoctorIdValid() {
		//This will later have to be altered to a specific value that isn't invalid
		aatd.setDoctorId(3L);
        assert(aatd.getDoctorId() == 3L);
	}

	/**
	 * Tests that setDoctorId() throws an error if an invalid doctor id is set.
	 * Not yet implemented due to database issues.
	 */
	@Test
	void testSetDoctorIdInvalid() {
//		try {
//			aatd.setDoctorId(INVALID ID HERE);
//			fail("Invalid doctor id was accepted");
//		} catch (Exception e) {
//			//Specific exception type will be added later
//		}
	}

	/**
	 * Tests that getAppointmentId() returns the appointment id set by setAppointmentId();
	 */
	@Test
	void testSetAppointmentIdValid() {
		//This will later have to be altered to a specific value that isn't invalid
		aatd.setAppointmentId(3L);
        assert(aatd.getAppointmentId() == 3L);
	}


	/**
	 * Tests that setDoctorId() throws an error if an invalid doctor id is set.
	 * Not yet implemented due to database issues.
	 */
	@Test
	void testSetAppointmentIdInvalid() {
//		try {
//			aatd.setAppointmentId(INVALID ID HERE);
//			fail("Invalid appointment id was accepted");
//		} catch (Exception e) {
//			//Specific exception type will be added later
//		}
	}
}
