from django.db import models                                                                                                            
from django.contrib.auth.models import User
from django.utils import timezone

class EventType(models.Model):
    name = models.CharField(max_length=200, blank=True, null=True)
    
    def __str__(self):
        return self.name

class Event(models.Model):
    title = models.CharField(max_length=200, blank=True, null=True)
    event_date = models.DateTimeField(default=timezone.now, blank=True, null=True)
    event_type = models.ForeignKey(EventType, blank=True, null=True)
    description = models.TextField(default="", blank=True, null=True)
    meeting_place = models.CharField(max_length=200, blank=True, null=True)
    notes = models.CharField(max_length=200, blank=True, null=True)
    distance = models.FloatField(default=0, blank=True, null=True)
    route_type = models.CharField(max_length=200, blank=True, null=True)
    elevation_gain = models.IntegerField(default=0, blank=True, null=True)
    drive_distance = models.IntegerField(default=0, blank=True, null=True)
    pace = models.CharField(max_length=200, blank=True, null=True)
    leaders = models.ManyToManyField(User)
    status = models.CharField(max_length=200, blank=True, null=True,
        choices=[
            ('pending', 'Pending'),
            ('scheduled', 'Scheduled'),
            ('went', 'Went'),
            ('canceled', 'Canceled')
        ])
    
    def __str__(self):
        return self.event_type + ': ' + self.title
    