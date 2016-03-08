# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('actor', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Movie',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date', models.CharField(max_length=40, null=True, blank=True)),
                ('title', models.CharField(max_length=40, null=True, blank=True)),
                ('studio', models.CharField(max_length=40, null=True, blank=True)),
                ('lifetime_gross', models.CharField(max_length=40, null=True, blank=True)),
                ('lifetime_gross_theaters', models.CharField(max_length=40, null=True, blank=True)),
                ('opening', models.CharField(max_length=40, null=True, blank=True)),
                ('opening_theaters', models.CharField(max_length=40, null=True, blank=True)),
                ('rank', models.CharField(max_length=40, null=True, blank=True)),
                ('actor', models.ForeignKey(blank=True, to='actor.Actor', null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
