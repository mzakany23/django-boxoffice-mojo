from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from actor.models import Actor 
from mojo.movies import get_movies

class MovieList(APIView):

	def get(self,request,slug):
		try:
			actor = Actor.objects.get(slug=slug)
		except:
			actor = None 
		
		url = "http://www.boxofficemojo.com/people/chart/?id=%s.htm" % (actor.get_stripped_name())

		return Response({'movies' : get_movies(url), 'actor' : actor.name})

	