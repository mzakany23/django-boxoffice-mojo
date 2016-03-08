from rest_framework import serializers, routers, viewsets,permissions
from movie.models import Movie

class MovieSerializer(serializers.ModelSerializer):
	class Meta:
		model = Movie
		
	

