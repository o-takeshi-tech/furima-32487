function pay(){
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form")
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formContent = document.getElementById("charge-form");
    const formData = new FormData(formContent);

    const card ={
      number:    formData.get("order_address[number]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year:  `20${formData.get("order_address[exp_year]")}`,
      cvc:       formData.get("order_address[cvc]")
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200 ){
        const token = response.id;
        const formDom = document.getElementById("charge-form");
        const tokenData = `<input value=${token} name="token" type="hidden" >`;
        formDom.insertAdjacentHTML("beforeend", tokenData);
      };

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      
      document.getElementById("charge-form").submit();
    })
  });
};

window.addEventListener("load", pay);