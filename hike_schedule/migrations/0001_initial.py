# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('title', models.CharField(blank=True, max_length=200, null=True)),
                ('event_date', models.DateTimeField(blank=True, default=django.utils.timezone.now, null=True)),
                ('description', models.TextField(blank=True, default='', null=True)),
                ('meeting_place', models.CharField(blank=True, max_length=200, null=True)),
                ('notes', models.CharField(blank=True, max_length=200, null=True)),
                ('distance', models.FloatField(blank=True, default=0, null=True)),
                ('route_type', models.CharField(blank=True, max_length=200, null=True)),
                ('elevation_gain', models.IntegerField(blank=True, default=0, null=True)),
                ('drive_distance', models.IntegerField(blank=True, default=0, null=True)),
                ('pace', models.CharField(blank=True, max_length=200, null=True)),
                ('status', models.CharField(blank=True, max_length=200, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='EventType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, primary_key=True, serialize=False)),
                ('name', models.CharField(blank=True, max_length=200, null=True)),
            ],
        ),
        migrations.AddField(
            model_name='event',
            name='event_type',
            field=models.ForeignKey(to='hike_schedule.EventType', blank=True, null=True),
        ),
        migrations.AddField(
            model_name='event',
            name='leaders',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL),
        ),
    ]
