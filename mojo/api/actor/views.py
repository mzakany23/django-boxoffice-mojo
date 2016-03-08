from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from actor.models import Actor
from serializers import ActorSerializer


# one url
class ActorsList(APIView):
	def get(self,request,format=None):
		actors = Actor.objects.all()
		return Response(ActorSerializer(actors,many=True).data)

	