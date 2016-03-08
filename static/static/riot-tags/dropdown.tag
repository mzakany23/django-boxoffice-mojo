<actor-dropdown-component>
<style type="text/css">
	.resultsDropdown{
		max-height: 900px;
		overflow: scroll;
	}
</style>
<ul class="nav navbar-nav">      
 <!-- actors dropdown -->
  <li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
    
    <ul class="dropdown-menu resultsDropdown">
      <li onclick={ setActor } each={ actor in opts.actors }><a href="#">{ actor.name }</a></li>
    </ul>
  </li>
</ul>
<script>
	self = this
	
	setActor(e){
		actor = e.item.actor.slug
		opts.bus.trigger('setActor',actor)
	}
</script>

</actor-dropdown-component>