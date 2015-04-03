from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'ExploratoryTestSystem.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    # index admin
    url(r'^admin/', include(admin.site.urls)),
    # index page
    url(r'^$', 'exploratory.views.index'),
    # after login user will be redirected to this url
    url(r'^logged_in/$', 'exploratory.views.logged_in'),
    # using default django auth views with custom templates
    url(r'^login/$', 'django.contrib.auth.views.login', {'template_name': 'login.html'}),
    url(r'^logout/$', 'django.contrib.auth.views.logout', {'template_name': 'logout.html'}),
)