class Dashing.Charts extends Dashing.Widget

  ready: ->
    @addChartjsScript()
    @loadCharts()

  loadCharts: ->
    if window.Chart
      @createFirstChart()
      @createSecondChart()
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

  createSecondChart: ->
    @doughnutChart("otherChart", [
      {
        value: 300
        colorName: 'red'
        label: "Red"
      },
      {
        value: 50
        colorName: 'green'
        label: "Green"
      }])

  polarAreaChart: (id, datasets) ->
    data = datasets.map (d) => @merge(this.circleColor(d.colorName), label: d.label, value: d.value)
    new Chart(document.getElementById(id).getContext("2d")).PolarArea(data)

  pieChart: (id, datasets) ->
    data = datasets.map (d) => @merge(this.circleColor(d.colorName), label: d.label, value: d.value)
    new Chart(document.getElementById(id).getContext("2d")).Pie(data)

  doughnutChart: (id, datasets) ->
    data = datasets.map (d) => @merge(this.circleColor(d.colorName), label: d.label, value: d.value)
    new Chart(document.getElementById(id).getContext("2d")).Doughnut(data)

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

  circleColor: (colorName) ->
    color: "rgba(#{ @colorCode()[colorName] }, 1)"
    highlight: "rgba(#{ @colorCode()[colorName] }, 0.8)"
