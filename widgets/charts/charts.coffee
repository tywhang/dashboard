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
      [
        label: 'My cool chart',
        color: 'blue',
        labels: ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6", "Week 7"],
        data: [86, 74, 68, 49, 42]
      ]

  lineChart: (id, datasets)->
    ctx = document.getElementById(id).getContext("2d")
    data = @merge labels: datasets[0].labels, datasets: [@merge this[datasets[0].color](), label: datasets[0].label, data: datasets[0].data]
    myLineChart = new Chart(ctx).Line(data)

  merge: (xs...) =>
    if xs?.length > 0
      @tap {}, (m) -> m[k] = v for k, v of x for x in xs

  tap: (o, fn) -> fn(o); o


  blue: ->
    {
      fillColor: "rgba(151, 187, 205, 0.2)",
      strokeColor: "rgba(151, 187, 205, 1)",
      pointColor: "rgba(151, 187, 205, 1)",
      pointStrokeColor: "#fff",
      pointHighlightFill: "#fff",
      pointHighlightStroke: "rgba(151,187,205,0.8)"
    }