package pack;

import java.sql.*;
/**
 * Class to easily return the next available Log ID.
 */
public class LIDFinder
{
    public static int get()
    {   
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root" ,"root");
    
            Statement statement = connection.createStatement();
            ResultSet resultStatement = statement.executeQuery("SELECT `Log ID` FROM `Logs Table`");
            int returnedValue = 0;
            while(resultStatement.next()) {
                returnedValue++;
            }
            return returnedValue;
        }

        catch (ClassNotFoundException e) {
            //If it can't connect to the database, it doesn't really matter what we return, but -1 is an obviously wrong value.
            return -1;
        }catch (SQLException e) {
            //If the class doesn't work, it also doesn't really matter what we return
            return -1;
        }
    }
}
