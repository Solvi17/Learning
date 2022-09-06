function palindrome(str) {
  let myRegex = /[^." ",_:)(/-]/gi;
  let result = str.match(myRegex);
  let nuevo = str.match(myRegex).reverse();
  let a = result.join("");
  let b = nuevo.join("");
  console.log(a.toLowerCase());
  console.log(b);
  if (a.toLowerCase()==b.toLowerCase()){
    return true
  }else{
    return false
  }
  // return true;
}
