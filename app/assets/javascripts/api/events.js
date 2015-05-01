var blocmetrics = {
  report: function(name) {
   var _bm_event = {
      name: name
      };
    var _bm_request = new XMLHttpRequest();
    _bm_request.open("POST", "http://localhost:3001/api/events", true);
    _bm_request.setRequestHeader('Content-Type', 'application/json');
    // _bm_request.setRequestHeader('Accept', 'application/json');
    // #5
    _bm_request.onreadystatechange = function() {
      // this Ajax request changes state but only changes state
      // within context of the DOM- all within the context of web page loaded.
    };
    _bm_request.send(JSON.stringify(_bm_event));
  }
};

// javascript_include_tag "http://localhost:3001/api/events.js"
//NOTE TO MENTOR using origin http header to look-up application=>origin header must be set, but 
// that would be set by browser

// separate code from request
// <html>
//   <head>
//     <title>Alex Demo</title>
//     <script src="/api/events.js"></script>
//   </head>
//   <body>
//      <script>
//         function createNew() {
//           var eventName = document.getElementById('event_name').value;
//           blocmetrics.report(eventName);
//         }
//      </script>
//      <input type="text" id="event_name">
//      <input type="button" id="create_event" onclick="createNew()" value="create">
//   </body>
// </html>