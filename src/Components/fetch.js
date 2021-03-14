// A URL returns TEXT data.
var url = "https://static.memrise.com/dist/locales/en/translation-36332f2a0a13.json";
 
 
function doGetTEXT()  {
 
  // Call fetch(url) with default options.
  // It returns a Promise object (Resolve response object)
  var aPromise = fetch(url);
 
  // Work with Promise object:
  aPromise
    .then(function(response) {
        console.log("OK! Server returns a response object:");
        console.log(response);
    })
    .catch(function(error)  {
        console.log("Noooooo! Something error:");
        // Network Error!
        console.log(error);
    });
 
}