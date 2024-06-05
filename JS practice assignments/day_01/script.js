function getLongestWordsOfHeadline(headline){
    // Split 
    const words = headline.split(" ");
    words.sort((a, b) => b.length - a.length);
    const top3WordsArray = [];
    for(let i=0; i<3 && i<words.length; i++){
        top3WordsArray.push("#"+words[i]);
    }
    return top3WordsArray;
}

const headlineFromPage = document.getElementById("headline").textContent;
const output = getLongestWordsOfHeadline(headlineFromPage);
console.log(output);