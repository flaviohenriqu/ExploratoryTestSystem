from django.utils.translation import ugettext_lazy as _
from django.contrib.auth.models import User
from charters.models import Charter
from django.db import models


# Create your models here.
class Comment(models.Model):
    description = models.TextField(_('description'))

    def __unicode__(self):
        return self.description

class Issue(models.Model):
    code_jira = models.CharField(_('CR'), max_length=20)
    name = models.CharField(_('name'), max_length=50)
    description = models.CharField(_('description'), max_length=100)
    tipo = models.CharField(_('type'), max_length=20)

    def __unicode__(self):
        return self.code_jira

class Label(models.Model):
    description = models.CharField(_('description'), max_length=50)

    def __unicode__(self):
        return self.description


class Product(models.Model):
    name = models.CharField(_('name'), max_length=50)
    project = models.CharField(_('project'), max_length=100)
    labels = models.ManyToManyField(Label)

    def __unicode__(self):
        return self.name + ' - ' + self.project

class Sessao(models.Model):
    tester = models.ForeignKey(User)
    duration = models.IntegerField(_('duration'))
    comments = models.TextField(_('comment'), null=True, blank=False)
    charter = models.ForeignKey(Charter)
    product = models.ForeignKey(Product)
    issues = models.ManyToManyField(Issue, null=True, blank=False)
    current_time = models.IntegerField(_('current time'), null=True, blank=False)
    def user_new_unicode(self):
        return self.username if self.get_full_name() == "" else self.get_full_name() + ' - ' + self.get_username()

    User.__unicode__ = user_new_unicode

    def __unicode__(self):
        return unicode(self.tester)

    class Meta:
        verbose_name = _('Session')
        verbose_name_plural = _('Sessions')
