<?php
// include "service/my-functions.php";

try {
    $mysqlConnection = new PDO(

        'mysql:host=localhost;dbname=SiteEcommerce;charset=utf8',

        'agahramanli',

        'Debbian_1234'

    );
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}

$sqlQuery = 'SELECT * FROM products';
$recupTable = $mysqlConnection->prepare($sqlQuery);
$recupTable->execute();
$products_s = $recupTable->fetchAll();
?>

<div class="table_names"><?php
                            foreach ($products_s as $product) {
                                // var_dump($product["name"]). "<br>";
                                echo "PRODUCT NAME : " . $product["name"] . "  PRICE :         " . $product["price"] . "     QUANTITY :       " .
                                    $product["quantity"] . "<br>";
                            }
                            ?>
</div>

<?php
$sqlQuery = 'SELECT * FROM customers';
$recupCustomers = $mysqlConnection->prepare($sqlQuery);
$recupCustomers->execute();
$customers_s = $recupCustomers->fetchAll(); ?>

<br>
<h3>CUSTOMERS</h3> <br>

<?php
foreach ($customers_s as $customer) {
    echo $customer["first_name"] . "  " . $customer["last_name"] . "<br>";
}
?>


<?php
$sqlQuery = 'UPDATE products SET  name = "A2_Titre Livre" WHERE id=2 ';
$updateProducts = $mysqlConnection->prepare($sqlQuery);
$updateProducts->execute();
$updateNameProducts = $updateProducts->fetchAll();

?>


<?php

$first_name = $_POST("firstname_customer");
$last_name = $_POST("lastname_customer");

$sqlQuery = 'INSERT INTO  customers  VALUES (NULL, 000044, $first_name, $last_name);';
$insertProductsCustomers = $mysqlConnection->prepare($sqlQuery);
$insertCustomers->execute();
$insertNameCustomers = $insertCustomers->fetchAll();

foreach ($insertNameCustomers as $insertName) {
        var_dump($insertNameCustomers);
echo "Prénom utilisateur" . $customers["first_name"] . "<br> " . "Nom utilisateur"  . $customers["last_name"];
}
