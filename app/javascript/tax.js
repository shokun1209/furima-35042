function tax (){
  const ItemTax  = document.getElementById("item-price");
  ItemTax.addEventListener("keyup", () => {
    const fee = ItemTax.value * 0.1;
    const TaxPrice = document.getElementById("add-tax-price");
    TaxPrice.innerHTML = `${fee}`;
    
    const SalesProfit = ItemTax.value - fee ;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${SalesProfit}`;
  });
}

window.addEventListener('load', tax);