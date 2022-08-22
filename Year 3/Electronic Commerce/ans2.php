<!DOCTYPE html>
<html>
    <body>
        <?php
            //  This creates an array with the appropiate data formats to the headers.
            $age = array(
                "Todays date"=>date("d.m.Y"), 
                "Current time"=>date("h:ia"), 
                "The day is"=>date('l')
            );
            
            // This array is then encoded by the json function and displayed on the html body.
            echo json_encode($age);
        ?> 
    </body>
</html>