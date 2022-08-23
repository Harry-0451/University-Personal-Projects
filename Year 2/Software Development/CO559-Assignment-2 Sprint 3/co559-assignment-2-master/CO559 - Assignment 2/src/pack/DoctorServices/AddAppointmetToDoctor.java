package pack.DoctorServices;

public class AddAppointmetToDoctor {
    protected Long doctorId;
    protected Long appointmentId;

    /**
     * Gets the value of doctorId 
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getDoctorId() {
        return doctorId;
    }

    /**
     * Sets the value of doctorId 
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setDoctorId(Long value) {
        this.doctorId = value;
    }

    /**
     * Gets the value of  appointmentId 
     * 
     * @return
     *     possible object is
     *     {@link Long }
     *     
     */
    public Long getAppointmentId() {
        return appointmentId;
    }

    /**
     * Sets the value of appointmentId 
     * 
     * @param value
     *     allowed object is
     *     {@link Long }
     *     
     */
    public void setAppointmentId(Long value) {
        this.appointmentId = value;
    }
}
