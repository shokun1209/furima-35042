function tax (){
  const ItemPrice  = document.getElementById("item-price");
  ItemPrice.addEventListener("keyup", () => {
    const fee = Math.floor(ItemPrice.value / 10);
    const TaxPrice = document.getElementById("add-tax-price");
    TaxPrice.innerHTML = `${fee}`;
    
    const SalesProfit = ItemPrice.value - fee ;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${SalesProfit}`;
  });
}

window.addEventListener('load', tax);