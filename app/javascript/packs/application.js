import "bootstrap";
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();
import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();
