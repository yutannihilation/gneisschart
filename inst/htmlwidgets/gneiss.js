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
    var g = instance.chart;
    
    // actual data
    g.series(x.series);
    
    // x-axis settings
    g.xAxisRef()[0].data = x.x_names;    // labels
    
    // y-axis settings
    g.yAxis()[0].domain  = x.y_limits;   // limits
    g.yAxis()[0].prefix.value  = x.y_prefix // prefix(e.g. $)
    g.yAxis()[0].suffix.value  = x.y_suffix // suffix(e.g. kB)
    g.yAxis()[0].ticks   = x.y_ticks;  // number of ticks
    
    // title
    g.title(x.title);
    g.titleElement().text(g.title());
    
    // credit
    g.credit(x.credit);
    g.creditElement().text(g.credit());
    
    // data source
    g.source(x.data_source);
    g.sourceElement().text(g.source());
    
    g.redraw();
  },

  resize: function(el, width, height, instance) {
    var g = instance.chart;
    g.resize();
    g.redraw();
  }

});
