HTMLWidgets.widget({

  name: 'gneiss',

  type: 'output',

  initialize: function(el, width, height) {
    var config = $.extend(true, {}, Gneiss.defaultGneissChartConfig);
    
    config.container = "#" + el.id;
    var chart = new Gneiss(config);

    return {
      chart: chart
    }

  },

  renderValue: function(el, x, instance) {
    console.log(x);
    console.log(instance.chart);
    
    var g = instance.chart;
    
    g.series(x.series);
    
    g.xAxisRef()[0].data = x.x_names;
    
    g.yAxis()[0].domain  = x.ylim;
    
    g.title(x.title);
    g.titleElement().text(g.title());
    
    g.credit(x.credit);
    g.creditElement().text(g.credit());
    
    g.source("Data:" + x.data_source);
    g.sourceElement().text(g.source());
    
    g.redraw();
  },

  resize: function(el, width, height, instance) {

  }

});
