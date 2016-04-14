
var WordFreq = function(id){
  var word = {}, words = document.getElementById(id).innerText.split(/[\s*\.*\,\;\+?\#\|:\-\/\\\[\]\(\)\{\}$%&0-9*]/)
  for( i in  words)
    if(words[i].length >1 )
      word[words[i]] ? word[words[i]]+=1 : word[words[i]]=1;
  return word;
};
