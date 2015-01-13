function initializeAutocomplete(id) {
  var element = document.getElementById(id);
  var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode','establishment'] });
  google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
}

google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('user_input_autocomplete_establishment');
});

function onPlaceChanged() {
  var place = this.getPlace();
  var street_number = '';
  var route = '';
  var locality = '';
  var postal_code = '';

 for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {  // Some types are ["country", "political"]
       if (component.types[j] == 'street_number') {
        street_number = component.long_name;
      } else if (component.types[j] == 'route') {
        route = component.long_name;
      } else if (component.types[j] == 'locality') {
        locality = component.long_name;
      } else if (component.types[j] == 'postal_code') {
        postal_code = component.long_name;
      }
    }
  }

$('#user_input_autocomplete_establishment').val(place.name);
$('#address').val(street_number + ' ' + route);
$('#postal_code').val(postal_code);
$('#locality').val(locality);

}
