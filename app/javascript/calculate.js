function calculation (){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");


  itemPrice.addEventListener('input', () => {
    const price = document.getElementById("item-price").value;
    const priceToCalculate = Math.floor(price);
    // フォームに入れられた数字を小数点以下切り捨てにする
    addTaxPrice.innerHTML = 0; 
    profit.innerHTML = 0;
    // 計算結果の初期値を0にする

    if (Number.isInteger(priceToCalculate) && (priceToCalculate * 0.1) >= 1 ){
       tax = Math.floor(priceToCalculate * 0.1);
       addTaxPrice.innerHTML = tax.toLocaleString();
    }else if (Number.isInteger(priceToCalculate) || priceToCalculate == "") {
       tax = 0;
       addTaxPrice.innerHTML = tax.toLocaleString();
    }else {
      tax = NaN;
      addTaxPrice.innerHTML = tax.toLocaleString();
    }
    // 整数かつ消費税が1以上なら計算する、整数もしくは値が空の場合は0を返す、それ以外はNaNを返す

    profitValue = Math.floor(priceToCalculate - tax );
    profit.innerHTML = profitValue.toLocaleString();
  } );
}

window.addEventListener("load", calculation);