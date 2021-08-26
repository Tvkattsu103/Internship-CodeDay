$(document).ready(function () {
      LoadDasboard();
  });
  $('#OrderStatistic').change(LoadDasboard = function () {
      var year = $("#OrderStatistic").val();
      
      $.ajax({
          type: "GET",
          url: "HomeAdminForward",
          data: "year=" + year,
          contentType: "application/json",
          dataType: "json",
          success: function (result) {
        	 
              var ctx = document.getElementById('myChart').getContext('2d');
              
                  $('td').remove();
                  console.log(result);
                      $('.TTotal').text(result.January + result.February + result.March + result.April + result.May + result.June + result.July + result.August +
                          result.September + result.October + result.November + result.December + ' VND');
                      $('#titleThongKe').text('STATISTICS OF MONTHLY REVENUE IN ' + year)
                      $('#OrderStatistics').append("<td>" + result.January + " VND" + "</td>");
                      $('#OrderStatistics').append("<td>" + result.February + " VND" + "</td>");
                      $('#OrderStatistics').append("<td>" + result.March + " VND" + "</td>");
                      $('#OrderStatistics').append("<td>" + result.April + " VND" + "</td>");
                      $('#OrderStatistics').append("<td>" + result.May + " VND" + "</td>");
                      $('#OrderStatistics').append("<td>" + result.June + " VND" + "</td>");
                      $('#OrderStatistics').append("<td>" + result.July + " VND" + "</td>");
                      $('#OrderStatistics').append("<td>" + result.August + " VND" + "</td>");
                      $('#OrderStatistics').append("<td>" + result.September + " VND" + "</td>");
                      $('#OrderStatistics').append("<td>" + result.October + " VND" + "</td>");
                      $('#OrderStatistics').append("<td>" + result.November + " VND" + "</td>");
                      $('#OrderStatistics').append("<td>" + result.December + " VND" + "</td>"); 
                      $('myChart').remove();
                      var chart =  new Chart(ctx, {
                          type: 'bar',
                          data: {
                              labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                              datasets: [{
                                  label: 'THỐNG KÊ DOANH THU NĂM ' + year,
                                  backgroundColor:['rgba(255, 99, 132, 0.2)',
                                      'rgba(54, 162, 235, 0.2)',
                                      'rgba(255, 206, 86, 0.2)',
                                      'rgba(75, 192, 192, 0.2)',
                                      'rgba(153, 102, 255, 0.2)',
                                      'rgba(255, 159, 64, 0.2)',
                                      'rgba(255, 99, 235, 0.2)',
                                      'rgba(54, 162, 86, 0.2)',
                                      'rgba(255, 206, 235, 0.2)',
                                      'rgba(75, 192, 64, 0.2)',
                                      'rgba(153, 102, 192, 0.2)',
                                      'rgba(255, 159, 132, 0.2)'],
                                  borderColor: [
                                      'rgba(255, 99, 132, 1)',
                                      'rgba(54, 162, 235, 1)',
                                      'rgba(255, 206, 86, 1)',
                                      'rgba(75, 192, 192, 1)',
                                      'rgba(153, 102, 255, 1)',
                                      'rgba(255, 159, 64, 1)',
                                      'rgba(255, 99, 235, 0.2)',
                                      'rgba(54, 162, 86, 0.2)',
                                      'rgba(255, 206, 235, 0.2)',
                                      'rgba(75, 192, 64, 0.2)',
                                      'rgba(153, 102, 192, 0.2)',
                                      'rgba(255, 159, 132, 0.2)'
                                  ],
                                  borderWidth: 1,
                                  data: [result.January, result.February, result.March, result.April, result.May, result.June, result.July, result.August, result.September, result.October, result.November, result.December]
                              }]
                          },
                      });
                      $('myChart').append(chart);
                  $('#titleChart').html('Sales: 1 Jan ' + year + ' - 30 Dec '+year);
          }
      });
  });
