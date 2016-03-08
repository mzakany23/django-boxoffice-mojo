<navbar-component>
	<div class="row">
	<div class="col-md-12">
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    

    <div class="navbar-header">
      <a style='color: blue;' class="navbar-brand" href="https://d3js.org/">D3.js</a>
      <a href="#/movies/nicolas-cage" class="navbar-brand">Box Office Mojo Stats</a>
    </div>

    
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <actor-dropdown-component bus={ opts.bus } actors={ opts.actors }></actor-dropdown-component>
      <actor-search bus={ opts.bus } actor={ opts.actor } actors={ opts.actors }></actor-search>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</div>
</div>
<script>

</script>

</navbar-component>