function checkCashRegister(price, cash, cid) {
  var billetes = [["PENNY", 1.01], ["NICKEL", 0.05], ["DIME", 0.1], ["QUARTER", 0.25], ["ONE", 1], ["FIVE", 5], ["TEN", 10], ["TWENTY", 20], ["ONE HUNDRED", 100]]
  
  var change = cash *100 - price*100;
  console.log(change)
  var dolar = cash - price;
  for (let i in billetes){
      let div = parseInt(cid[i][1]/billetes[i][1]);
      billetes[i].push(div)
      // console.log(div)
  }
  console.log(billetes)  
  billetes.reverse()
  billetes.forEach(elemen=>{
    let name = elemen[0];
    let value = elemen[1]*100
    // console.log(value);
    while(change >= value){
      change  -= value;
      console.log(change/100)
    }

    // console.log(elemen[1])
  }
  )
  // console.log(billetes[0][1])
  // while (change<=billetes[])
  
}

// checkCashRegister(19.5, 20, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]]);
checkCashRegister(3.26, 100, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]])

