(($) ->

  $(document).ready ->

    theMap = $('#map')

    theMap.tinyMap
      center:
        lat: 31.00
        lng: 121.00

    $('#drawPoints').click ->
      arr = []
      tnum = 0
      tlng = 0.0
      tlat = 0.0
      for route in $('#gpsData').val().split(';')
        if route.length > 0
          for gps in route.split('|')
            gps = gps.split(',')
            tnum += 1
            tlng += parseFloat gps[0]
            tlat += parseFloat gps[1]
            arr.push
              addr:[gps[1],gps[0]]
      theMap.tinyMap 'panto', [tlat / tnum, tlng / tnum]
      theMap.tinyMap 'modify',
        zoom: 13
      theMap.tinyMap 'modify',
        marker: arr

    $('#drawRoutes').click ->
      arr = []
      tnum = 0
      tlng = 0.0
      tlat = 0.0
      for route in $('#gpsData').val().split(';')
        if route.length > 0
          for gps in route.split('|')
            gps = gps.split(',')
            tnum += 1
            tlng += parseFloat gps[0]
            tlat += parseFloat gps[1]
            arr.push [gps[1],gps[0]]
      theMap.tinyMap 'panto', [tlat / tnum, tlng / tnum]
      theMap.tinyMap 'modify',
        zoom: 13
      theMap.tinyMap 'modify',
        polyline:
          coords: arr
          color: '#000088'
          width: 2

    $('#clearAll').click ->
      theMap.tinyMap 'clear', ['polyline', 'marker']
)(jQuery)