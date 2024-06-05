function getLongestWordsOfHeadline(headline) {
  // Split the words based on spacing
  const words = headline.split(" ");
  // Sort the words in descending order
  words.sort((a, b) => b.length - a.length);
  //Create an arrar
  const top3WordsArray = [];
  //Push top 3 longest words into the array
  for (let i = 0; i < 3 && i < words.length; i++) {
    top3WordsArray.push("#" + words[i]);
  }
  //Return
  return top3WordsArray;
}
//Read the headline contect
const headlineFromPage = document.getElementById("headline").textContent;
//Call function
const output = getLongestWordsOfHeadline(headlineFromPage);
//Display the output in the console
console.log(output);
