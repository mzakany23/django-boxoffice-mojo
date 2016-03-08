from django.contrib import admin
from models import Movie

class MovieAdmin(admin.ModelAdmin): 
	class Meta:
		model = Movie

admin.site.register(Movie,MovieAdmin)

