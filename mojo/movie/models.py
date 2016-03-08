from django.db import models
from actor.models import Actor

class Movie(models.Model):
	actor = models.ForeignKey(Actor,blank=True,null=True)
	date = models.CharField(max_length=40,blank=True,null=True)
	title  = models.CharField(max_length=40,blank=True,null=True)
	studio  = models.CharField(max_length=40,blank=True,null=True)
	lifetime_gross  = models.CharField(max_length=40,blank=True,null=True)
	lifetime_gross_theaters = models.CharField(max_length=40,blank=True,null=True)
	opening  = models.CharField(max_length=40,blank=True,null=True)
	opening_theaters = models.CharField(max_length=40,blank=True,null=True)
	rank = models.CharField(max_length=40,blank=True,null=True)

	def __unicode__(self):
		return "%s %s" % (self.actor.name,self.title)