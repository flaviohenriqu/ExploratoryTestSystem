from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from django.contrib.auth.decorators import login_required
from django.template import RequestContext
from exploratory.models import Sessao

# Create your views here.

# index view (just redirect to login page)
def index(request):
    if request.user.is_authenticated():
        return HttpResponseRedirect('/logged_in')
    else:
        return HttpResponseRedirect('/accounts/login')

# this view will run after successfull login
@login_required
def logged_in(request):
    return render_to_response('logged_in.html',
                                context_instance=RequestContext(request))

# this view will show sessions
@login_required
def sessions(request, id):
    s = Sessao.objects.get(pk=id)
    return render_to_response('sessions.html', {
        'entry': s,
    }, context_instance=RequestContext(request))
