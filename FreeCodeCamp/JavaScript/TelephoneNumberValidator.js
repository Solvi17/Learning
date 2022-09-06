function telephoneCheck(str) {
  let a =str.split(" ")
  let b = str.split("")
  let c = b.indexOf(")")
  let d = b.indexOf("(")
  
  let boolean=false;
  if (a[0][0]==1){
      if (c>0 && d >0){
        boolean = true
        return boolean
      }else{
        if (c<0 && d<0){
          boolean = true
          return boolean
        }
        return boolean
      }
    return true 
  }else{
    return false
  }
  // if (a[1]==regex);

}

console.log(telephoneCheck("10 (757) 622-7382"));

function telephonecheck_solution(str){
  let rex1 = /^(1\s?)?\d{3}([-\s]?)\d{3}\2\d{4}$/,
        rex2 = /^(1\s?)?\(\d{3}\)\s?\d{3}[-\s]?\d{4}$/;

    if (rex1.test(str)) {
        return true;
    }
    else {
        return rex2.test(str) ? true : false
    }
}