from django.shortcuts import render

from .models import EventType, Event

# Create your views here.
def index(request):
    events = Event.objects.all().order_by('event_date')
    return render(request, 'index.html', {'events': events})
