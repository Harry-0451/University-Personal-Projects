<!DOCTYPE html>
<html>
    <body>
        <?php
            session_start();
        ?>

        <style>
            table, th, td {
                border: 1px solid;
                text-align: center;
                font-size: 14px;
            }
            img {  
                max-width: 75%;  
                height: auto;  
            }  
            button {
                margin: 5px;
            }
        </style>

        <?php

            // The basket total is set to 0 each time that this script is ran, just so if the basket is empty, the items in basket message has 
            // an appropiate figure to be displayed.
            $inbask = 0;
            if(isset($_POST['submit'])){//to run PHP script on submit

                // If the submit button has been clicked then the script checks if the checklist boxes are empty or not, if they aren't then
                // it checks if either the sent checklist isn't empty and the session basket isn't empty. If neither are empty then they're both
                // merged together (this is done on purpose with the idea of being able to buy two of the same books as well as storing information).
                // The session is then assigned the new array and for each item in the basket 1 is added onto the basket amount.
                if(!empty($_POST['check_list'])){
                    if(!empty($_POST['check_list']) && !empty($_SESSION["basket"])){
                        $newArr = array_merge($_POST['check_list'],$_SESSION["basket"]);
                        $_SESSION["basket"]=$newArr;
                        foreach($_SESSION["basket"] as $selected){
                            $inbask++;
                        }
                    }

                    // If however the session is empty but the checklist array isn't then the basket becomes the check_list array
                    // The session is then iterated through adding 1 each time to the in basket total.
                    else{
                        $_SESSION["basket"]=$_POST['check_list'];

                        foreach($_SESSION["basket"] as $selected){
                            $inbask++;
                        }
                    }
                }

                // If the basket is not empty but the submit button has been pressed, then the nothing is added to the session and nothing is removed,
                // the information is simply passed along to the next stage with the amount in the basket being recalculated.
                elseif(!empty($_SESSION["basket"])){
                    foreach($_SESSION["basket"] as $selected){
                        $inbask++;
                    }
                }
            }

            // If the view button is clicked & if the basket is not empty, then for each item in the basket, 1 is added to the 
            // basket total, and the title of the book placed in the basket is sent to be displayed to the user.
            elseif(isset($_POST['view'])){
                if(!empty($_SESSION["basket"])){
                    foreach($_SESSION["basket"] as $selected){
                        $inbask++;
                        echo $selected."</br>";
                    }
                }
            }

            // If the user clicks on the empty button then information kept in the session is removed and the basket is reset.
            // Otherwise, the webpage knows that no button has been pressed and thus is a fresh page where the basket needs an array
            // so that books can be assigned to it.
            elseif(isset($_POST['empty'])){
                unset($_SESSION["basket"]);
            }
            else{
                $_SESSION["basket"]=array();
            }

            // This connects to the database where all the different books and the information is held.
            $dbh = new PDO(
                'mysql:host=dragon.kent.ac.uk; 
                dbname=comp6390', // 'Database Host' followed by 'Database Name'
                'comp6390', // 'Username'
                'mesohn6'); // 'Password'

                // This then creates a display for the user to see how many items are in the basket. As well as the headers for each column,
                // the buttons for the user to submit books they want to buy, view the basket as well as empty the busket.
                echo "
                <br>
                You have " . $inbask . " items in your basket.
                <br>

                <form action='#' method='post'>

                    <br>

                    <input type='submit' name='submit' value='Add to basket'/>
                    <input type='submit' name='view' value='View basket'/>
                    <input type='submit' name='empty' value='Empty basket'/>
                    <br><br>

                    <table style='width:100%;border: 1px solid;'>
                        <tr>
                            <th style='width:4%;'>Select</th>
                            <th style='width:4%;'>Cover</th>
                            <th style='width:4%;'>Author</th>
                            <th style='width:4%;'>Title</th>
                            <th style='width:4%;'>Price</th>
                            <th style='width:4%;'>Rating</th>
                            <th style='width:76%;'>Description</th>
                        </tr>";

                        // For every book in the table, call the function and send all information in the row into that function.
                        foreach($dbh->query("SELECT * from books;") as $row){
                            newRow($row);
                        }

                echo "
                </form>";
            
           
            // This creates a new row in a table for the required information on the book. It adds a checkbox, title, image, author, price, rating 
            // and the description.
            function newRow($input) {
                echo "
                <tr>
                    <td>
                        <input type='checkbox' id='book" . $input['id'] ."' name='check_list[]' value='" . $input['title'] . "'>
                    </td>
                    <td>
                        " . '<img src="data:image/jpeg;base64,'.base64_encode($input['cover']).'"/>' . "
                    </td>
                    <td>
                        " . $input['author'] . "
                    </td>
                    <td>
                        " . $input['title'] . "
                    </td>
                    <td>
                        " . $input['price'] . "
                    </td>
                    <td>
                        " . $input['rating'] . "
                    </td>
                    <td>
                        " . $input['description'] . "
                    </td>
                </tr>";
            }
        ?>
    </body>
</html>