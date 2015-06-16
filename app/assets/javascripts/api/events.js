var blocmetrics = {
  report: function(name) {
   var _bm_event = {
      name: name
      };
    var _bm_request = new XMLHttpRequest();
    _bm_request.open("POST", "http://localhost:3000/api/events", true);
    _bm_request.setRequestHeader('Content-Type', 'application/json');
    // #5
    _bm_request.onreadystatechange = function() {
      // this function runs when the Ajax request changes state.
      // https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
    };
    _bm_request.send(JSON.stringify(_bm_event));
  }
};

// javascript_include_tag "http://localhost:3000/api/events.js"