const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementClassName("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_record[number]"),
      cvc: formData.get("purchase_record[cvc]"),
      exp_month: formData.get("purchase_record[exp_month]"),
      exp_year: `20${formData.get("purchase_record[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("purchase_record_number").removeAttribute("name");
      document.getElementById("purchase_record_cvc").removeAttribute("name");
      document.getElementById("purchase_record_exp_month").removeAttribute("name");
      document.getElementById("purchase_record_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);