window.addEventListener("load", function(){
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const priceTax = document.getElementById("add-tax-price");
      const priceProfit = document.getElementById("profit");
      if (priceTax && priceProfit) {
        priceTax.innerHTML = Math.floor(priceInput.value / 10);
        priceProfit.innerHTML = Math.floor(priceInput.value - priceTax.innerHTML);
      }
    });
  }
});
