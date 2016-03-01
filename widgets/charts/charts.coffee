class Dashing.Charts extends Dashing.Widget

  ready: ->
    @addChartjsScript()
    @loadCharts()

  loadCharts: ->
    if window.Chart
      @createFirstChart()
    else
      setTimeout(=> @loadCharts())

  addChartjsScript: ->
    tag = document.createElement('script')
    tag.src = "//cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"
    firstScriptTag = document.getElementsByTagName('script')[0]
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag)

  createFirstChart: ->
    @radarChart 'myChart',
      ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5"],
      [
        label: 'My cool chart'
        color: 'blue'
        data: [86, 74, 68, 49, 42]
      ]

  lineChart: (id, labels, datasets) ->
    data = @merge labels: labels,
      datasets: datasets.map (d) => @merge(this.color('blue'), label: d.label, data: d.data)
    new Chart(document.getElementById(id).getContext("2d")).Line(data)

  barChart: (id, labels, datasets) ->
    data = @merge labels: labels,
      datasets: datasets.map (d) => @merge(this.color('blue'), label: d.label, data: d.data)
    new Chart(document.getElementById(id).getContext("2d")).Bar(data)

  radarChart: (id, labels, datasets) ->
    data = @merge labels: labels,
      datasets: datasets.map (d) => @merge(this.color('blue'), label: d.label, data: d.data)
    new Chart(document.getElementById(id).getContext("2d")).Radar(data)

  merge: (xs...) =>
    if xs?.length > 0
      @tap {}, (m) -> m[k] = v for k, v of x for x in xs

  tap: (o, fn) -> fn(o); o

  colorCode: ->
    blue: "151, 187, 205"
    lightgray: "220, 220, 220"
    red: "247, 70, 74"
    green: "70, 191, 189"
    yellow: "253, 180, 92"
    gray: "148, 159, 177"
    darkgray: "77, 83, 96"

  color: (colorName) ->
    fillColor: "rgba(#{ @colorCode()[colorName] }, 0.2)"
    strokeColor: "rgba(#{ @colorCode()[colorName] }, 1)"
    pointColor: "rgba(#{ @colorCode()[colorName] }, 1)"
    pointStrokeColor: "#fff"
    pointHighlightFill: "#fff"
    pointHighlightStroke: "rgba(#{ @colorCode()['blue'] },0.8)"

  blue: ->
    fillColor: "rgba(#{ @colors()['blue'] }, 0.2)"
    strokeColor: "rgba(#{ @colors()['blue'] }, 1)"
    pointColor: "rgba(#{ @colors()['blue'] }, 1)"
    pointStrokeColor: "#fff"
    pointHighlightFill: "#fff"
    pointHighlightStroke: "rgba(#{ @colors()['blue'] },0.8)"
  lightgray: ->
    fillColor: "rgba(#{ @colors()['lightgray'] }, 0.2)"
    strokeColor: "rgba(#{ @colors()['lightgray'] }, 1)"
    pointColor: "rgba(#{ @colors()['lightgray'] }, 1)"
    pointStrokeColor: "#fff"
    pointHighlightFill: "#fff"
    pointHighlightStroke: "rgba(#{ @colors()['lightgray'] },0.8)"
  red: ->
    fillColor: "rgba(#{ @colors()['red'] }, 0.2)"
    strokeColor: "rgba(#{ @colors()['red'] }, 1)"
    pointColor: "rgba(#{ @colors()['red'] }, 1)"
    pointStrokeColor: "#fff"
    pointHighlightFill: "#fff"
    pointHighlightStroke: "rgba(#{ @colors()['red'] },0.8)"
  green: ->
    fillColor: "rgba(#{ @colors()['green'] }, 0.2)"
    strokeColor: "rgba(#{ @colors()['green'] }, 1)"
    pointColor: "rgba(#{ @colors()['green'] }, 1)"
    pointStrokeColor: "#fff"
    pointHighlightFill: "#fff"
    pointHighlightStroke: "rgba(#{ @colors()['green'] },0.8)"
  yellow: ->
    fillColor: "rgba(#{ @colors()['yellow'] }, 0.2)"
    strokeColor: "rgba(#{ @colors()['yellow'] }, 1)"
    pointColor: "rgba(#{ @colors()['yellow'] }, 1)"
    pointStrokeColor: "#fff"
    pointHighlightFill: "#fff"
    pointHighlightStroke: "rgba(#{ @colors()['yellow'] },0.8)"
  gray: ->
    fillColor: "rgba(#{ @colors()['gray'] }, 0.2)"
    strokeColor: "rgba(#{ @colors()['gray'] }, 1)"
    pointColor: "rgba(#{ @colors()['gray'] }, 1)"
    pointStrokeColor: "#fff"
    pointHighlightFill: "#fff"
    pointHighlightStroke: "rgba(#{ @colors()['gray'] },0.8)"
  darkgray: ->
    fillColor: "rgba(#{ @colors()['darkgray'] }, 0.2)"
    strokeColor: "rgba(#{ @colors()['darkgray'] }, 1)"
    pointColor: "rgba(#{ @colors()['darkgray'] }, 1)"
    pointStrokeColor: "#fff"
    pointHighlightFill: "#fff"
    pointHighlightStroke: "rgba(#{ @colors()['darkgray'] },0.8)"
