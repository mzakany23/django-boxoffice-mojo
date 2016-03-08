from rest_framework import serializers, routers, viewsets,permissions
from actor.models import Actor 

class ActorSerializer(serializers.ModelSerializer):
	class Meta:
		model = Actor

	

