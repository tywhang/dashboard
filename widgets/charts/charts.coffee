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
    @lineChart 'myChart',
      ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6", "Week 7"],
      [
        label: 'My cool chart',
        color: 'blue',
        data: [86, 74, 68, 49, 42]
      ]

  lineChart: (id, labels, datasets) ->
    data = @merge labels: labels,
      datasets: datasets.map (d) => @merge(this[d.color](), label: d.label, data: d.data)
    new Chart(document.getElementById(id).getContext("2d")).Line(data)

  merge: (xs...) =>
    if xs?.length > 0
      @tap {}, (m) -> m[k] = v for k, v of x for x in xs

  tap: (o, fn) -> fn(o); o


  blue: ->
    fillColor: "rgba(151, 187, 205, 0.2)",
    strokeColor: "rgba(151, 187, 205, 1)",
    pointColor: "rgba(151, 187, 205, 1)",
    pointStrokeColor: "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(151,187,205,0.8)"
  lightgrey: ->
    fillColor: "rgba(220,220,220,0.2)",
    strokeColor: "rgba(220,220,220,1)",
    pointColor: "rgba(220,220,220,1)",
    pointStrokeColor: "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(220,220,220,0.8)"
  red: ->
    fillColor: "rgba(247,70,74,0.2)",
    strokeColor: "rgba(247,70,74,1)",
    pointColor: "rgba(247,70,74,1)",
    pointStrokeColor: "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(247,70,74,0.8)"
  green: ->
    fillColor: "rgba(70,191,189,0.2)",
    strokeColor: "rgba(70,191,189,1)",
    pointColor: "rgba(70,191,189,1)",
    pointStrokeColor: "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(70,191,189,0.8)"
  yellow: ->
    fillColor: "rgba(253,180,92,0.2)",
    strokeColor: "rgba(253,180,92,1)",
    pointColor: "rgba(253,180,92,1)",
    pointStrokeColor: "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(253,180,92,0.8)"
  gray: ->
    fillColor: "rgba(148,159,177,0.2)",
    strokeColor: "rgba(148,159,177,1)",
    pointColor: "rgba(148,159,177,1)",
    pointStrokeColor: "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(148,159,177,0.8)"
  darkgrey: ->
    fillColor: "rgba(77,83,96,0.2)",
    strokeColor: "rgba(77,83,96,1)",
    pointColor: "rgba(77,83,96,1)",
    pointStrokeColor: "#fff",
    pointHighlightFill: "#fff",
    pointHighlightStroke: "rgba(77,83,96,1)"
