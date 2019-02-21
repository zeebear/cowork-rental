import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
  };
  const flyToOffice = (lat, lng, map) => {
    map.flyTo({
      center: [lat, lng],
      zoom: 13,
      speed: 2,
      curve: 1,
      easing(t) {
        return t;
      }
    });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });
    fitMapToMarkers(map, markers);
    const nav = new mapboxgl.NavigationControl();
    map.addControl(nav, 'top-left');
    const geolocate = new mapboxgl.GeolocateControl({
    positionOptions: {
        enableHighAccuracy: true,
      },
      fitBoundsOptions: {
        maxZoom: 13
      },
      trackUserLocation: true
    });
    map.addControl(geolocate, 'top-left');
    map.on('load', function()
    {
      geolocate.trigger();
    });
    const cards = document.querySelectorAll('.office-card');
    cards.forEach((card) => {
      card.addEventListener('mouseover', (event) => {
        flyToOffice(parseFloat(card.dataset.lng), parseFloat(card.dataset.lat), map);
      });
    });
  }
};



export { initMapbox };
