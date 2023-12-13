<?php



function formatPrice (float $price):string {

    return number_format($price/100, 2) ." €";
} 

function priceExcludingVAT(float $price):string {
    return $price - ($price*19.6/100);
}

function discountedPrice(float $price, float $discount):float {
    return $price - ($price*$discount/100);
}

function formatWeight_g(int $weight):string{
    if ($weight <1000) {
    return $weight . " g";}
    else {return $weight * 0.01 ." Kg";}
}

function formatWeight_kg(int $weight):string {
    return $weight * 0.01 ." Kg";
}