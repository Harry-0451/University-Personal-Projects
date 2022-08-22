<!DOCTYPE html>
<?php

    // If the submit button is clicked, the createHTML function is ran, the xml error checker is turned on and the entered information
    // is passed into a new variable called myXMLData. This data is encoded as proper xml.
    if($_POST) {
        createHTML();
        libxml_use_internal_errors(true);
        $myXMLData = $_POST['txtBox'];

        $xml = simplexml_load_string($myXMLData);

        // If the xml information doesnt pass then he each error is iterated and displayed to the user.
        if ($xml === false){
            echo "Failed loading XML: ";
            foreach(libxml_get_errors() as $error) {
                echo "<br>", $error->message;
            }
        } 

        // If the xml does pass then the operator (+,*,-,/) is trimmed to have no spaces and assigned as the operation variable.
        // The same is then done for the first and second number where they're assigned to variable number 1 and 2.
        else {
            $operation = trim((string)$xml->operation);
            $number1 = trim((string)$xml->number1);
            $number2 = trim((string)$xml->number2);

            // If there is a space inbetween the  two inputs e.g '5 5' or '10 0' then an error is thrown.
            if ($number1 == trim($number1) && strpos($number1, ' ') || $number2 == trim($number2) && strpos($number2, ' ') !== false) {
                echo "Error: space detected inbetween number.";
            }

            // Otherwise the parser checks if the operator is an add, subtract or multiply. If the operators are any of these then the 
            // appropiate calculation is taken.
            elseif($operation == 'add') {
                echo $sum = $number1 + $number2;
            }
            elseif($operation == 'subtract'){
                echo $sum =$number1 - $number2;
            }
            elseif($operation == 'multiply'){
                echo $sum = $number1 * $number2;
            }

            // If the operator is divide then the parser checks if the denominator is 0. If it is then an error is thrown saying as such.
            // Otherwise the appropiate calculation is made.
            elseif($operation == 'divide'){
                if($number2 == 0){
                    echo "Error: cannot divide by 0.";
                }
                else{
                    echo $sum = $number1 / $number2;
                }
            }

            //If all else fails then there must be an invalid operator assigned in the xml text and so an error message is displayed.
            else{
                echo "Error: invalid operator.";
            }
        }
    }
    else{
        createHTML();
    }

    // If this function is called, it creates the body for xml text to be entered and submitted to then be calculated by the script.
    function createHTML() {
        echo '
            <html>
                <body>
                    <form action="ans5.php" method="POST">
                        Enter XML:
                        <br><br>
                        <textarea id="txtBox" name="txtBox" rows="40" cols="80"></textarea>
                        <br><br>
                        <input type="submit" name ="submit"  value="Submit">
                    </form>
                </body>
            </html>';
    }
?> 