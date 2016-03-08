<actor-search>

<style type="text/css">
	.search{
			color: black;
		}
		
		#search-results{
			padding-left: 0px;
			border: 4px solid #242a30;
			color: black;
			border: 2px solid #B6C4C6; 
			position:absolute;
			width: 279px;
			min-height: 20px;
			max-height: 500px;
			z-index: 9999;
			text-align: left;
			background-color: #E1E1E1;
			overflow: auto;
			cursor: default;
		}

		#search-results ul{
			list-style: none;
			display: block;
		}

		#search-results li{
			padding-top: 2px;
			padding-bottom: 2px;
		}

		.hovered{
			background-color: #50B2C4;
		}
</style>

<!-- search by actor name -->
  <form class="navbar-form navbar-right" role="search">
    <div class="form-group">
      <input onkeyup={ searchForActor } type="text" class="form-control" placeholder="{ opts.actor }" name='searchResult'>
      <div if={ activated } id='search-results'>
			<h4 style='margin-left: 10px;'>Searched { opts.actors.length } Actors : found { autoCompleteRes.length }</h4>
			<hr>
			<ul>
				<li each={ actor in autoCompleteRes } onkeyup={ searchForActor } onmouseleave={ autoCompResMouseLeave } onmouseenter={ autoCompResMouseEnter }><a href="#movies/{ actor.slug }">{ actor.name }</a></li>
			</ul>
		</div>

    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>	
<script>
	searchForActor(e){
		if (e.keyCode == 27){
    	this.activated = false
    }else{

			search = this.searchResult.value.toLowerCase()
			searchLen = search.length

			foundResults = []

			if (searchLen > 0){

				for (var key in opts.actors){
					title = opts.actors[key].name
					match = title.slice(0,searchLen).toLowerCase()
					if (search === match){
						this.activated = true
						foundResults.push(opts.actors[key])
					}
				}

				this.autoCompleteRes = foundResults
			}else{
				this.activated = false
			}
		}
	}

	autoCompResMouseEnter(e){
		$(e.target).addClass('hovered')
	}

	autoCompResMouseLeave(e){
		$(e.target).removeClass('hovered')
	}
</script>

</actor-search>