<?php
 include ("multidimensional-catalog.php");
// include ("simple-catalog.php");

include("service/my-functions.php");



include("template/header.php");
?>

<h1> Librairie en ligne </h1>

<form action="database.php" method="post" class="database">
        <label for="firstname_customer" >Prénom Client</label>
        <input type="text" id="firstname_customer" name="firstname_customer" required maxlength="10" size="18" /> 
        <label for="lastname_customer">Nom Client</label>
        <input type="text" id="lastname_customer" name="lastname_customer" required maxlength ="10" size= "18" />
        <button type="submit" size="15"> envoyer </button>

</form>

<div class="container0">

        

        <?php 
       
        
        foreach ($libraries as $library) {
           
           include "template/products_template.php";
        }


            
        ?>
        



</div>





<?php include("template/footer.php"); ?>