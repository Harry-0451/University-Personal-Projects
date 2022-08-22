<!DOCTYPE html>
<html>
    <body>
        <?php
            // The global session variables are loaded at the start of the script.
            session_start();

            // If the submit button is clicked then the sessoin variable data is assigned the submitted values.
            if(isset($_POST['submit'])){
                $_SESSION["data"]=strip_tags($_POST['usrName']);

                // This checks for any special characters using regex. If any characters in data match the special characters,
                // then the value is returned true and the error message is displayed.
                if (preg_match('/[\'^£$%&*()}{@#~?><>,|=_+¬-]/', $_SESSION["data"])){
                    submitButton();
                    echo '<br>
                    Error: Special Character Entered
                    ';
                }

                // The script checks if the input is empty or not by stripping the spaces in the entry.
                // If empty the script displays the form and the associated error.
                elseif(trim($_SESSION["data"]) == ''){
                    submitButton();
                    
                    echo '<br>
                    Error: Empty Field
                    ';
                }

                // The user is then greeted with the username & a button is created for the user to logout.
                else{
                    echo "Hello " . $_SESSION['data'] . ", you are logged in.";
                    echo '
                    <form action="ans4.php" method="post"> 
                        <button type="logout" name="logout">Logout</button>
                    </form>';
                }
            }

            // If the logout button is pressed then the session is destroyed/deleted and username/webpage is reset.
            elseif(isset($_POST['logout'])){
                session_destroy();
                submitButton();
            }

            // Otherwise the script just loads up a user textbox to then be submitted  and sent to the next state.
            else{
                submitButton();
            }

            // Displays input form and submit button
            function submitButton() {
                echo '
                <form action="ans4.php" method="post">
                    Username:
                    <input type=text name="usrName">
                    <button type="submit" name="submit">Submit</button>
                </form>';
            }
        ?>
    </body>
</html>

