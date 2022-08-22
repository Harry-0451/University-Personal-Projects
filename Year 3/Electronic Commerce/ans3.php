<!DOCTYPE html>
<html>
     <body>
          <?php
               // This sets a cookie called course and assigns it the value CO639.
               setcookie("course", "CO639", time() + 30, "/");
               
               // If the cookie called course doesn't exist, then a message saying such is displayed.
               // Otherwise, there exists a cookie with the value of Comp6390
               if(!isset($_COOKIE["course"])) {
                    echo "Cookie named 'course' is not set.";
               } else {
                    echo "Cookie 'course' has value 'COMP6390'.";
               }
          ?>
     </body>
</html>