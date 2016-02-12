from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_http_methods
import datetime
import re

from .models import EventType, Event
from .forms import ImportForm

# Create your views here.
def index(request):
    events = Event.objects.all().order_by('event_date')
    return render(request, 'index.html', {'events': events})

# Data importer form.
# Note: This is rendered in an admin template but is not actually login-protected.
@login_required
@require_http_methods(["GET", "POST"])
def importer(request):
    output = ''

    # if this is a POST request we need to process the form data
    if request.method == 'POST':
        form = ImportForm(request.POST)
        if form.is_valid():
            data = re.split('<hr>', form.cleaned_data['data'])
            output = []
            for item in data:
                parsed = re.search('<(strong|b)>(\w+)(\s-\s(\w+))?,\s?(\w+\s\d{1,2}(\s-\s(\d{1,2}))?,?\s?(\d{4})?)', item)
                if parsed is None:
                    output.append('no match')
                else:
                    output.append(parsed.groups())

    # if a GET (or any other method) we'll create a blank form
    else:
        form = ImportForm()
#        pprint(form)

    return render(request, 'import_form.html', {'form': form, 'output': output})
