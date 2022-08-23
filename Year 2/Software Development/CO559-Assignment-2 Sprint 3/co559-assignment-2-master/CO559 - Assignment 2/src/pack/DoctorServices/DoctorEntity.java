package pack.DoctorServices;

public class DoctorEntity {


    protected Long doctorId;
    protected String firstName;
    protected String lastName;
    protected String registration;



        /**
     * 
     * Get value of doctorId 
     * 
     * @return
     *     object is
     *     {@link Long}
     */

    public Long getDocId(){
        return doctorId;
    }

    
        /**
     * 
     * Set value of doctorId 
     * 
     * @return
     *     object is
     *     {@link Long}
     */

    public void setDocId(Long value){
        this.doctorId = value;
    }

    /**
     * 
     * Get value of firstName
     * 
     * 
     * @return
     *      object is
     *      {@link String}
     */

    public String getFirstName(){
        return firstName;
    }


    /**
     * 
     * Set value of firstName
     * @param value
     *      object is
     *      {@link String} 
     *
     */

    public void setFirstName(String value){
        this.firstName = value;
    }

    /**
     * 
     * Gets the value of lastName
     * @return
        *  object
        *  {@link String}
     */

    public String getLastName(){
        return lastName;
    }

    /**
     * 
     * Set value of lastName
     * 
     * @param value
     *  {@link String}
     */

    public void setLastName(String value){
        this.lastName = value;
    }

    
    /**
     * 
     * Set value of registration
     * 
     * @param value
     *  {@link String}
     */

    public String getRegistration(){
        return registration;
    }

    
    /**
     * 
     * Set value of registration
     * 
     * @param value
     *  {@link String}
     */

    public void setRegistration(String value){
        this.registration = value;
    }




}





