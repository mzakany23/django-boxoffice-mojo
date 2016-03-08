from django.contrib import admin
from models import Actor


class ActorAdmin(admin.ModelAdmin): 
	read_only_field = ['slug']
	class Meta:
		model = Actor

admin.site.register(Actor,ActorAdmin)

