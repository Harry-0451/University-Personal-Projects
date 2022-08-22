<!DOCTYPE html>
<html>
    <!-- This creates the table styling required by the task.-->
    <style>
        table, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
    <body>
        <?php
            // The script creates a table with 3 different rows.
            // The first row displays the current date.
            // The next two displays the current time
            // The final row displays the day.
            // Each of the data entries are joined by periods to attach the value to the string.
            echo "
                <table >

                    <tr>
                        <td>Today's date: </td>
                        <td>" . date("d.m.Y") . "</td>
                    </tr>
                    <tr>
                    
                        <td>Current time: </td>
                        <td>" . date("h:ia") . "</td>
                    </tr>
                    <tr>
                        <td>The day is: </td>
                        <td>" . date('l') . "</td>
                    </tr>
                </table>
            "
        ?> 
    </body>
</html>