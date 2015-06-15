google.load('visualization', '1.1', {'packages':['corechart', 'bar']});
google.setOnLoadCallback(drawChart);

function drawChart() {
  test_chart("test_chart");
  new_user_chart("chart_new_users");
  total_cash_chart("chart_total_cash");
  orders_chart("chart_orders");
}

function test_chart() {
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Topping');
  data.addColumn('number', 'Slices');
  data.addRows([
    ['Mushrooms', 3],
    ['Onions', 1],
    ['Olives', 1],
    ['Zucchini', 1],
    ['Pepperoni', 2]
  ]);

  var options = {'title':'How Much Pizza I Ate Last Night',
                 'width':400,
                 'height':300};

  var chart = new google.visualization.PieChart(document.getElementById('test_chart'));
  chart.draw(data, options);
}

function new_user_chart() {
  var data = google.visualization.arrayToDataTable([
      ['Day', "Users"],
      ['Monday', 1000],
      ['Tuesday', 1170],
      ['Wednesday', 660],
      ['Thursday', 1030],
      ['Friday', 1030],
      ['Saturday', 1030],
      ['Sunday', 1030]
    ]);

    var options = {
      chart: {
        title: 'Weekly breakdown',
      }
    };

    var chart = new google.charts.Bar(document.getElementById('chart_new_users'));
    chart.draw(data, options);
}

function total_cash_chart() {
  var data = google.visualization.arrayToDataTable([
      ['Day', "Donations $", "Donatons net", "Discount $", "Discount net"],
      ['Monday', 100, 50, 50, 50],
      ['Tuesday', 117, 50, 50, 50],
      ['Wednesday', 66, 50, 50, 50],
      ['Thursday', 103, 50, 50, 50],
      ['Friday', 103, 50, 50, 50],
      ['Saturday', 103, 50, 50, 50],
      ['Sunday', 103, 50, 50, 50]
    ]);

    var options = {
      chart: {
        title: 'Weekly breakdown',
      }
    };

    var chart = new google.charts.Bar(document.getElementById('chart_total_cash'));
    chart.draw(data, options);
}

function orders_chart() {
  var data = google.visualization.arrayToDataTable([
    ['Year', 'Sales', 'Expenses'],
    ['2004',  1000,      400],
    ['2005',  1170,      460],
    ['2006',  660,       1120],
    ['2007',  1030,      540]
  ]);

  var options = {
    title: 'Company Performance',
    curveType: 'function',
    legend: { position: 'bottom' }
  };

  var chart = new google.visualization.LineChart(document.getElementById('chart_orders'));

  chart.draw(data, options);
}
