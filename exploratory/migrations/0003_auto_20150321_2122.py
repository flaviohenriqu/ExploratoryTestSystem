# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('exploratory', '0002_auto_20150321_2116'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sessao',
            name='comments',
            field=models.TextField(verbose_name='comment'),
            preserve_default=True,
        ),
    ]
