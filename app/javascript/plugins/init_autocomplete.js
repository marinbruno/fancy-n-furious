import places from 'places.js';
const initAutocomplete = () => {
  const addressInput = document.getElementById('car_car_location');
  if (addressInput) {
    places({ container: addressInput });
  }
  const addressInput2 = document.getElementById('user_address');
  if (addressInput2) {
    places({ container: addressInput2 });
  }
};

export { initAutocomplete };
