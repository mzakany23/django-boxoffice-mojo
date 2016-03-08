from django.conf.urls import patterns, include, url
from django.conf import settings

from django.contrib import admin

from api.movie.views import MovieList
from api.actor.views import ActorsList

admin.autodiscover()

# main
urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),
)

# home
urlpatterns += patterns('home.views',
	url(r'^$', 'home',name='home'),
)

# media
urlpatterns += patterns('',
    (r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT}))

# api

urlpatterns += patterns('api.views',
	# movies
	url(r'^api/movies/(?P<slug>[-\w]+)/$',MovieList.as_view()),
	# actors
	url(r'^api/actors/$',ActorsList.as_view()),
)