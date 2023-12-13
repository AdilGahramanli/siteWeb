


<div class="item">
    <img class="imageItem" src="<?php echo $library["image"]; ?>">
    <h3><?php echo $library["title"]; ?></h3>

    <p>
        <?php echo $library["description"] . "<br>"; ?></br>

        <?php if ($library["availability"] == false) {
            echo "<del>Indisponible</del>" . "<br>";
        } else {


            if ($library["discount"] !== null) {
                echo formatPrice($library["price"]) . "   TTC - " . $library["discount"] . " % <br>";
                echo formatPrice(discountedPrice($library["price"], $library["discount"]));
            } 
            else {
                echo  formatPrice($library["price"]) . " <br><br> ";
            }
        }
        ?>
    </p>

    <p>
        <form method="POST" action="cart.php">
            
        <input type="hidden" type="text" id="image" name="image" src="<?php echo $library["image"]; ?>" />
            

        <input type="hidden" id="title" name="title" value="<?php echo ($library["title"]); ?>" />
        <input type="hidden" id="discountedPrice" name="discountedPrice" value="<?php echo discountedPrice($library["price"], $library["discount"]);?>" />
        <input type="hidden" id="price" name="price" value="<?php echo ($library["price"]); ?>" />
        <input type="hidden" id="discount" name="discount" value="<?php echo $library["discount"]; ?>" />
        <input type="hidden" id="weight" name="weight" value="<?php echo $library["weight"]; ?>" />
        <label for="quantity"> Quantité : </label>
        <input type="number" id="quantity" name="quantity" min="0"><br><br>
        <input type="hidden" id="transporteur" name="transporteur" value="veuillez choisir un transporteur" />


        <button type=submit <?php if (!$library['availability']) : ?>disabled<?php endif; ?>>
            COMMANDER
            <!-- ouvre un formulaire, envoi les infos au panier -->
        </button>

    </form>
    </p>


</div>