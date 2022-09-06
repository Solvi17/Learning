function rot13(str) {
  var first = ['A','B','C','D','E','F','G','H','I','J','K','L','M']
  var last  = ['N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
  var space = [' ','!','?','.']

  var lista = []

  var a = str.split('')
  for(var i=0;i<=a.length;i++){
    if (first.includes(a[i])){
      let e = first.indexOf(a[i]);
      let newletter = last[e];
      // console.log(newletter);
      lista.push(newletter);
    }
    else{
      if(last.includes(a[i])){
        let e = last.indexOf(a[i]);
        let newletter = first[e];
        // console.log(newletter );
        lista.push(newletter);
      }else{
        if(space.includes(a[i])){
          lista.push(a[i])
        }
      }
    }
    // console.log(a[i])
  }
  // if (){

  // }
  return lista.join('');
}

console.log(rot13("SERR YBIR?"));