<actor-movie-list>
	<navbar-component bus={ opts.bus } actor={ opts.actor } actors={ opts.actors }></navbar-component>
	<h1>{ opts.actor }</h1>
	<br>
	<div id="d3-div"></div>

<!-- detail modal -->
<div class="modal" id="movie-detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">{ movieTitle } | { movieDate } | { opts.actor }</h4>
      </div>
      <div class="modal-body">
      	<h3>Lifetime Gross: { lifeTimeGross }</h3>
      	<h3>Opening Gross: { openingGross } </h3>
      	<h3>rank: { rank }</h3>
      	<h3>Studio: { studio }</h3>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
	var self = this

	// initialization

	h = 900,
	w = 1000,
	padding = 50,
	axisPadding = 50,
	xAxisPadding = 60,
	yAxisPadding = 60;

	svg = d3.select('svg')

	salesMax = d3.max(opts.movies, function(d){return +d['lifetime_gross'];})
  salesMin = d3.min(opts.movies, function(d){return +d['lifetime_gross'];})    
  maxDate = d3.max(opts.movies, function(d){return new Date(d['date'])})
  minDate = d3.min(opts.movies, function(d){return new Date(d['date'])})


	timeScale = d3.time.scale()
            .domain([minDate,maxDate])
            .range([h-yAxisPadding, 25])


  xScale = d3.scale.linear()
           .domain([0,salesMax])
           .range([xAxisPadding, w-xAxisPadding ])

  rScale = d3.scale.linear()
          .domain([0, salesMax])
          .range([2, 50])


	xAxis = d3.svg.axis()
              .scale(xScale)
              .orient('bottom')
              .ticks(10);

  yAxis = d3.svg.axis()
              .scale(timeScale)
              .orient('left')
              .ticks(10)


  // mount
  this.on('mount',function(){
		scatter = d3.select('#d3-div').append('svg')
							.attr('height',h)
							.attr('width',w)

		scatter.selectAll('circle').data(opts.movies).enter().append('circle')
							.attr('cx',function(d){
								return xScale(+d['lifetime_gross']);
							})
							.attr('cy',function(d){
								var formatted_date = new Date(d['date'])
								return timeScale(formatted_date);

							})
							.attr('r',function(d){
								var sales = +d['lifetime_gross']
                return rScale(sales)
							})
							.style('fill','blue')
							.on('click',function(data){
								showPopUp(data)
							})

		scatter.append('g')
              .attr("transform", "translate(0," + (h - padding) + ")")
              .attr('class', 'cageAxis')
              .call(xAxis)

    scatter.append('g')
              .attr("transform", "translate(" + padding + ",0)")
              .attr('class', 'cageAxis')
              .call(yAxis)
    
    $('svg circle').tipsy({
	      gravity: 'w',
	      html: true,
	      title: function(){
	          var d = this.__data__;
	          var title = "TITLE: " + d['title']
	          var date = 'DATE: ' + d['date']
	          var amount = 'LIFETIME GROSS SALES: ' + toUSD(+d['lifetime_gross'])
	          return  title + '\n' + date + "\n" + amount
	      }
	  });
	})



	// actions
	function showPopUp(data){
		$('#movie-detail').modal('show')
			self.movieTitle = data.title
			self.movieDate = data.date
			self.lifeTimeGross = toUSD(data.lifetime_gross)
			self.theaters = toUSD(data.lifetime_gross_theaters)
			self.openingGross = data.opening
			self.rank = data.rank
			self.studio = data.studio
			self.update()
	}

	function toUSD(number) {
	  var number = number.toString(), 
	  dollars = number.split('.')[0], 
	  cents = (number.split('.')[1] || '') +'00';
	  dollars = dollars.split('').reverse().join('')
	      .replace(/(\d{3}(?!$))/g, '$1,')
	      .split('').reverse().join('');
	  return '$' + dollars + '.' + cents.slice(0, 2);
	}

	// observables
	opts.bus.on('setActor',function(actor){
		riot.route(`movies/${actor}`)
	})
	
	


</script>

</actor-movie-list>