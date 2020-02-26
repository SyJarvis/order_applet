图文并茂，一图胜千言

highcharts

https://www.highcharts.com.cn/demo/highcharts/spline-symbols\

https://api.highcharts.com.cn/highcharts

```
var chart = Highcharts.chart('container', {})

container对应的就是模板文件里的id
```

```


$("#finance").highcharts({
            chart: {
                type: 'spline'
            },
            title: {
                text: '两地月平均温度'
            },
            subtitle: {
                text: '数据来源: WorldClimate.com'
            },
            xAxis: {
                categories: ['一月', '二月', '三月', '四月', '五月', '六月',
                    '七月', '八月', '九月', '十月', '十一月', '十二月']
            },
            yAxis: {
                title: {
                    text: '温度'
                },
                labels: {
                    formatter: function () {
                        return this.value + '°';
                    }
                }
            },
            tooltip: {
                crosshairs: true,
                shared: true
            },
            plotOptions: {
                spline: {
                    marker: {
                        radius: 4,
                        lineColor: '#666666',
                        lineWidth: 1
                    }
                }
            },
            series: [{
                name: '东京',
                marker: {
                    symbol: 'square'
                },
                data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, {
                    y: 26.5,
                }, 23.3, 18.3, 13.9, 9.6]
            }]
        });
```

```
         Highcharts.chart('finance', {
            chart: {
                type: 'spline'
            },
            title: {
                text: '两地月平均温度'
            },
            subtitle: {
                text: '数据来源: WorldClimate.com'
            },
            xAxis: {
                categories: ['一月', '二月', '三月', '四月', '五月', '六月',
                    '七月', '八月', '九月', '十月', '十一月', '十二月']
            },
            yAxis: {
                title: {
                    text: '温度'
                },
                labels: {
                    formatter: function () {
                        return this.value + '°';
                    }
                }
            },
            tooltip: {
                crosshairs: true,
                shared: true
            },
            plotOptions: {
                spline: {
                    marker: {
                        radius: 4,
                        lineColor: '#666666',
                        lineWidth: 1
                    }
                }
            },
            series: [{
                name: '东京',
                marker: {
                    symbol: 'square'
                },
                data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, {
                    y: 26.5,
                }, 23.3, 18.3, 13.9, 9.6]
            }]
        });
```



index.js

```
;
var dashboard_index_ops = {
    init: function () {
        this.drawChart()
    },
    drawChart: function () {
        charts_ops.setOption()
       $.ajax({
           url:common_ops.buildUrl("/chart/dashboard"),
           dataType:'json',
           success:function (res) {
               charts_ops.drawLine($("#member_order"), res.data)
           }
       });
       $.ajax({
           url:common_ops.buildUrl("/chart/finance"),
           dataType:'json',
           success:function (res) {
               charts_ops.drawLine($("#finance"), res.data)
           }
       });
    }
};

$(document).ready(function () {
    dashboard_index_ops.init()
})
```

chart.js

```
;
var charts_ops = {
    setOption: function () {
        Highcharts.setOptions({
            chart: {},
            exporting: {
                enabled: false
            },
            legend: {
                //enabled:false
            },
            credits: {
                enabled: false
            },
            colors: ['#058DC7', '#50B432', '#ED561B', '#DDDF00',
                '#24CBE5', '#64E572', '#FF9655', '#FFF263', '#6AF9C4', '#E93EFF'],
            title: '',
            xAxis: {
                tickWidth: 0,
                lineWidth: 0,
                gridLineColor: '#eee',
                //gridLineWidth: 1,
                crosshair: {
                    width: 1,
                    color: '#ebebeb'
                }
            },
            yAxis: {
                gridLineColor: '#eee',
                gridLineWidth: 1,
                title: ''
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    pointWidth: 20,
                    borderWidth: 0
                },
                series: {
                    marker: {
                        enabled: false
                    },
                },
                line: {
                    lineWidth: 2,
                    states: {
                        hover: {
                            lineWidth: 2
                        }
                    }
                }
            },
            tooltip: {
                backgroundColor: '#404750',
                borderWidth: 0,
                shadow: false,
                headerFormat: '',
                footerFormat: '',
                shared: true,
                useHTML: true,
                style: {
                    color: '#fff',
                    padding: '5px'
                }
            },
            lang: {
                noData: "暂无数据"
            },
            noData: {
                style: {
                    fontWeight: 'bold',
                    fontSize: '15px',
                    color: '#303030'
                }
            }
        });
    },
    drawLine: function (target, data) {

        var chart = target.highcharts({
            chart: {
                type: 'spline'
            },
            xAxis: {
                categories: data.categories
            },
            series: data.series,
            legend: {
                enabled: true,
                align: 'right',
                verticalAlign: 'top',
                x: 0,
                y: -15
            }
        });
        return chart;
    }
};
```

chart.py

```
from flask import Blueprint, jsonify
import datetime
from common.libs.Helper import getFormatDate
from common.models.stat.StatDailyFood import StatDailyFood
from common.models.stat.StatDailyMember import StatDailyMember
from common.models.stat.StatDailySite import StatDailySite
route_chart = Blueprint("chart_page", __name__)


@route_chart.route("/dashboard")
def dashboard():

    now = datetime.datetime.now()
    date_before_30day = now + datetime.timedelta(days=-30)
    date_form = getFormatDate(date=date_before_30day, format="%Y-%m-%d")
    date_to = getFormatDate(date=now, format="%Y-%m-%d")

    list = StatDailySite.query.filter(StatDailySite.date >= date_form)\
        .filter(StatDailySite.date <= date_to).order_by(StatDailySite.id.asc())\
        .all()
    resp = {'code':200, 'msg':'操作成功', 'data':{}}
    data = {
        'categories':[],
        'series':[
            {
                "name":"会员总数",
                "data":[]
            },
            {
                "name":"订单总数",
                "data":[]
            }
        ]
    }
    if list:
        for item in list:
            data['categories'].append(getFormatDate(date=item.date, format="%Y-%m-%d"))
            data['series'][0]['data'].append(item.total_member_count)
            data['series'][1]['data'].append(item.total_order_count)
    resp['data'] = data

    return jsonify(resp)

@route_chart.route("/finance")
def finance():

    now = datetime.datetime.now()
    date_before_30day = now + datetime.timedelta(days=-30)
    date_form = getFormatDate(date=date_before_30day, format="%Y-%m-%d")
    date_to = getFormatDate(date=now, format="%Y-%m-%d")

    list = StatDailySite.query.filter(StatDailySite.date >= date_form)\
        .filter(StatDailySite.date <= date_to).order_by(StatDailySite.id.asc())\
        .all()
    resp = {'code':200, 'msg':'操作成功', 'data':{}}
    data = {
        'categories':[],
        'series':[
            {
                "name":"日营收情况",
                "data":[]
            }
        ]
    }
    if list:
        for item in list:
            data['categories'].append(getFormatDate(date=item.date, format="%Y-%m-%d"))
            data['series'][0]['data'].append(float(item.total_pay_money))
    resp['data'] = data

    return jsonify(resp)
```

