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
    .nodeColor(node => `${x.nColor}`)
    .nodeLabel(node => `${node.id}`)
    .nodeRelSize(x.nsize)
    .linkLabel(link => `${x.lLabel}`)
    .linkVisibility(x.lVisibility)

    .linkColor(x.lColor)
    .linkWidth(x.lWidth)
    .backgroundColor('#ffffff')


    .graphData(x.data);


        const linkForce = graph
      .d3Force('link')
      .distance(link => link.color ? settings.redDistance : settings.greenDistance);

    //Define GUI
    const Settings = function() {
      this.redDistance = 20;
      this.greenDistance = 20;
    };
    const settings = new Settings();
    const gui = new dat.GUI();
    const controllerOne = gui.add(settings, 'redDistance', 0, 100);
    const controllerTwo = gui.add(settings, 'greenDistance', 0, 100);
    controllerOne.onChange(updateLinkDistance);
    controllerTwo.onChange(updateLinkDistance);
    function updateLinkDistance() {
      linkForce.distance(link => link.color ? settings.redDistance : settings.greenDistance);
      graph.numDimensions(3); // Re-heat simulation
    }




      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
