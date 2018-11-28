HTMLWidgets.widget({

  name: 'threeNet',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {


    const Graph = ForceGraph3D({ controlType: x.controlType});
    Graph(el)
    //.nodeAutoColorBy('Color')
    .nodeColor(node => `${node.colors}`)
    .nodeLabel(node => `${node.id}`)
    .nodeRelSize(x.nsize)
    .linkLabel(link => `${x.lLabel}`)
    .linkVisibility(x.lVisibility)
    .linkColor(link => `${x.lcolor}`)
    .linkWidth(x.lWidth)
    .backgroundColor('#ffffff')
    .graphData(x.data);




      },

      resize: function(width, height) {



      }

    };
  }
});
