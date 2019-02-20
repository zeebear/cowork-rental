import places from 'places.js';

const boundries = {
 countries: ['ar']
};

const initAutocomplete = () => {
  const addressInput = document.getElementById('office_address');
  if (addressInput) {
    places({ container: addressInput }).configure(boundries);
  }
};

export { initAutocomplete };
