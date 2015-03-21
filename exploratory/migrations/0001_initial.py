# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('charters', '__first__'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('description', models.TextField(verbose_name='description')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Issue',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('code_jira', models.CharField(max_length=20, verbose_name='CR')),
                ('name', models.CharField(max_length=50, verbose_name='name')),
                ('description', models.CharField(max_length=100, verbose_name='description')),
                ('tipo', models.CharField(max_length=20, verbose_name='type')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Label',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('description', models.CharField(max_length=50, verbose_name='description')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=50, verbose_name='name')),
                ('project', models.CharField(max_length=100, verbose_name='project')),
                ('labels', models.ManyToManyField(to='exploratory.Label')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Sessao',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('duration', models.IntegerField(verbose_name='duration')),
                ('current_time', models.IntegerField(verbose_name='current time')),
                ('charter', models.ForeignKey(to='charters.Charter')),
                ('comments', models.ManyToManyField(to='exploratory.Comment')),
                ('issues', models.ManyToManyField(to='exploratory.Issue')),
                ('product', models.ForeignKey(to='exploratory.Product')),
                ('tester', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
