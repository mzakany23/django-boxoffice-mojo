from django.db import models
from django.db.models.signals import pre_save
from django.utils.text import slugify


class Actor(models.Model):
	name = models.CharField(max_length=25,blank=True,null=True)
	slug = models.CharField(max_length=50,blank=True,null=True)
	
	def __unicode__(self):
		return self.name

	def get_stripped_name(self):
		return self.slug.replace('-','').lower()

def create_actor_slug(instance,*args,**kwargs):
	instance.slug = slugify(instance.name)

pre_save.connect(create_actor_slug,sender=Actor)