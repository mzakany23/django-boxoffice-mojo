<router>
	
<script>
	self = this
	var currentTag = null
	var currentRoute = null
	var path = window.location.pathname;
	var lastRoute = null
	var lastFullRoute = null
	var server = 'http://localhost:8000/api'
	var bus = opts.bus
	var store = opts.store

	function mount(tag,options){
		currentTag && currentTag.unmount(true)
		currentTag = riot.mount('div#riot-tags',tag,options)[0]
	}

	var routes = {
		
		movies: function(actor){
			if (actor){
				url = `${server}/movies/${actor}`
				
					$.get(url).then((model) => {
						$.get(`${server}/actors/`).then((actors) => {
							mount('actor-movie-list',{movies:model.movies,actor:model.actor,actors:actors,bus:opts.bus})
						}).fail((e) => {
							mount('error-page')
						})
					}).fail((e) => {
						mount('error-page')
					})
				
			}else {
				redirectTo('#/movies/nicolas-cage')
			}	
		},
	}

	function redirectTo(url){
		window.location.replace(url)
	}

	function handler(collection,id,action){
		lastRoute = collection
		lastFullRoute = `${path}#${collection}`
		// lastRoute = collection
	
		var fn = routes[collection || 'home']
		if (fn) {
			fn(id,action)
		}else{
			redirectTo('#/movies/nicolas-cage')
		}
	}
	
	riot.route(handler);
</script>

</router>