window.addEventListener("load", function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const priceTax = document.getElementById("add-tax-price");
    const priceProfit = document.getElementById("profit");
    priceTax.innerHTML = Math.floor(priceInput.value / 10)
    priceProfit.innerHTML = Math.floor(priceInput.value - priceTax.innerHTML)
  })
});
