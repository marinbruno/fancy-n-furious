import "bootstrap";
import "mapbox-gl/dist/mapbox-gl.css";
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();
import { calculate } from '../plugins/calculate_total';
calculate();
