from django.contrib import admin

from .models import *

@admin.register(EventType)
class EventTypeAdmin(admin.ModelAdmin):
    list_display = ['name']

@admin.register(Event)
class EventAdmin(admin.ModelAdmin):
    list_display = ['event_type', 'title', 'event_date', 'status']
    list_filter = ['event_type', 'route_id', 'leaders']

@admin.register(Area)
class AreaAdmin(admin.ModelAdmin):
    list_display = ['name']

@admin.register(Route)
class RouteAdmin(admin.ModelAdmin):
    list_display = ['name', 'distance', 'elevation_gain', 'favorite']
    list_filter = ['area_id', 'favorite']

