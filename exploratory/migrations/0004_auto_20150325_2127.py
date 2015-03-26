# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('exploratory', '0003_auto_20150321_2122'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='sessao',
            options={'verbose_name': 'Session', 'verbose_name_plural': 'Sessions'},
        ),
        migrations.AlterField(
            model_name='sessao',
            name='comments',
            field=models.TextField(null=True, verbose_name='comment'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='sessao',
            name='current_time',
            field=models.IntegerField(null=True, verbose_name='current time'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='sessao',
            name='issues',
            field=models.ManyToManyField(to='exploratory.Issue', null=True),
            preserve_default=True,
        ),
    ]
