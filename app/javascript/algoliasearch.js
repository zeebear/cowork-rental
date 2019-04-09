import algoliasearch from 'algoliasearch'

var client = algoliasearch('VY8Q24OXEK', '852b7ed8c8fcdc16b484b51f4eefb107');
var index = client.initIndex('Office');

// index.search('something', { hitsPerPage: 10, page: 0 })
//   .then(function searchDone(content) {
//     console.log(content)
//   })
//   .catch(function searchFailure(err) {
//     console.error(err);
//   });

var searchForm = document.getElementById('search');

export const search = () => {
  searchForm.addEventListener('submit', function(event){
    event.preventDefault();
    var searchInput = document.getElementById('search-input');
    var searchValue = searchInput.value;
    // console.log(Office.algoliasearch(searchValue));
    // // console.log(searchValue);
    // index.search(searchValue, { hitsPerPage: 10, page: 0 })
    // .then(function searchDone(content) {
    //   console.log(content)
    // })
    // .catch(function searchFailure(err) {
    //   console.error(err);
    // });
  });
};


