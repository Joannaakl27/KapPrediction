import Chart from "chart.js/auto";

const initChart = () => {
  const colors = ["rgb(142, 202, 230)", "rgb(33, 158, 188)", "rgb(18, 103, 130)", "rgb(2, 48, 71)", "rgb(255, 183, 3)", "rgb(253, 158, 2)", "rgb(251, 133, 0)", "rgb(187, 62, 3)", "rgb(174, 32, 18)", "rgb(155, 34, 38)"];
  var ctx = document.getElementById('chart').getContext('2d');
  var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ["Berth 1", "Berth 2", "Berth 3", "Berth 4"],
      datasets: [
        {
          label: 'Vessel 1',
          data: [
            null,
            [new Date('2021-09-11T00:00:00'), new Date('2021-09-13T00:00:00')]
          ],
          backgroundColor: "rgb(142, 202, 230)",
        },
        {
          label: 'Vessel 2',
          data: [
            [new Date('2021-09-12T00:00:00'), new Date('2021-09-14T00:00:00')],
            [new Date('2021-09-14T00:00:00'), new Date('2021-09-15T00:00:00')]
          ],
          backgroundColor: "rgb(33, 158, 188)",
        },
        {
          label: 'Vessel 3',
          data: [
            null,
            [new Date('2021-09-16T00:00:00'), new Date('2021-09-18T00:00:00')]
          ],
          backgroundColor: "rgb(18, 103, 130)",
        },

      ]
    },
    options: {
      responsive: true,
      indexAxis: 'x',
      plugins: {
        legend: {
          position: 'top',
        },
        title: {
          display: true,
          text: 'Chart.js Floating Horizontal Bar Chart'
        }
      },
      scales: {
        y: {
          type: 'time',
          time: {
            // Luxon format string
            dateStyle: "full",
            timeStyle: "full",

          },
          min: new Date('2021-09-11T00:00:00'),
          max: new Date('2021-09-18T00:00:00')
        }
      }
    }
  });
}

export { initChart };
