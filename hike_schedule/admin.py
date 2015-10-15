from django.contrib import admin

from .models import EventType, Event

@admin.register(EventType)
class EventTypeAdmin(admin.ModelAdmin):
    list_display = ['name']

@admin.register(Event)
class EventAdmin(admin.ModelAdmin):
    list_display = ['event_type', 'title', 'event_date', 'status']
    list_filter = ['event_type']
    
