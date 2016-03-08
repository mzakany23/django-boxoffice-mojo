# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('actor', '0002_actor_slug'),
    ]

    operations = [
        migrations.AlterField(
            model_name='actor',
            name='slug',
            field=models.CharField(max_length=50, null=True, blank=True),
            preserve_default=True,
        ),
    ]
