<?php
include("template/header.php");
include("service/my-functions.php");

$prixUnitaire = (float)$_POST["price"];
$quantity = $_POST["quantity"];
$discount = $_POST["discount"];
$prixUnitairePromo = $_POST["discountedPrice"];
$titre = $_POST["title"];
$total = ($quantity * $prixUnitairePromo);
$totalHT = priceExcludingVAT($total);
$tva = $total - $totalHT;

// $transporteur= 
$transport_weight = (int)$_POST["weight"] * (int)$_POST["quantity"];
if ($transport_weight < 500) {
    $transport_price = 500;
} elseif (500 <= $transport_weight && $transport_weight <= 2000) {
    $transport_price = 500 * 10 / 100;
} elseif ($transport_weight > 2000) {
    $transport_price = 0;
};

$transportTTC = $transport_price + $total;

?>
<div class="form_panier">


    <h3> <?php echo  "Produit <br><br>" . $titre  . "<br>"; ?> </h3>
    <p>
        <b>prix unitaire <br></b><?php echo formatPrice($prixUnitaire) . " - " . $discount . " %<br>" . formatPrice($prixUnitairePromo) . "<br>"; ?>

    </p>

    <p>
        <?php echo "<b>Quantité </b> <br> " . $quantity . " <br> "; ?>
    </p>

    <p>
        <?php echo "<b>Total</b> <br>" . formatPrice($total); ?>
    </p>

    <p class="form_totalHT">
        <?php echo "Total HT " . formatPrice($totalHT); ?>
    </p>

    <p class="form_TVA">
        <?php echo "TVA " . formatPrice($tva); ?>
    </p>

    <p class="form_totalTTC">
        <?php echo "Total TTC " . formatPrice($total); ?>

    </p>

    <p class="transport_price">
        <?php echo "TRANSPORT " . formatPrice($transport_price); ?>
    </p>

    <p class="transportTTC">
        <?php echo "TotalTTC " . formatPrice($transportTTC); ?>
    </p>

    <form method="POST" action="cart.php">
    <input type="hidden"  name="title" value="<?php echo ($titre); ?>" />
        <input type="hidden" name="discountedPrice" value="<?php echo $prixUnitairePromo;?>" />
        <input type="hidden"  name="price" value="<?php echo ($library["price"]) ?>" />
        <input type="hidden" name="discount" value="<?php echo $discount; ?>" />
        <input type="hidden" name="weight" value="<?php echo $transport_weight; ?>" />
        <input type="hidden" id="quantity" name="quantity" value="<?php echo $quantity; ?>" /><br><br>

        <select class="transporteur" id="transporteur" name="transporteur">
            <option value="">--Please choose a transporteur--</option>
            <option value="Colissimo">Colissimo</option>
            <option value="Colibrisé">Colibrisé</option>
        </select>




        <button id="transporteur" type="submit">
            VALIDER
        </button>
    </form>

    <p class="transporteur_choice">
        <?php 
        echo "transporteur choisi : " . $_POST["transporteur"]; ?>
    </p>

    <p class="weight">
        <?php echo "Poids total " . formatWeight_g($transport_weight); ?>
    </p>

</div>

<?php include("template/footer.php");
