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
    ctx = document.getElementById("myChart").getContext("2d")
    data = {
      labels: ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6", "Week 7"],
      datasets: [{
        label: "My Second dataset",
        fillColor: "rgba(151, 187, 205, 0.2)",
        strokeColor: "rgba(151, 187, 205, 1)",
        pointColor: "rgba(151, 187, 205, 1)",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(151,187,205,1)",
        data: [86, 74, 68, 49, 42]
      }]
    }
    myLineChart = new Chart(ctx).Line(data)
