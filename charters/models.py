from django.utils.translation import ugettext_lazy as _
from django.db import models

# Create your models here.
class Charter(models.Model):
    charter_id = models.CharField(_('id'), max_length=20, primary_key=True)
    name = models.CharField(_('name'), max_length=100)
    objective = models.CharField(_('objective'), max_length=100)
    min_time = models.IntegerField(_('minimum'))
    max_time = models.IntegerField(_('maximum'))
    requeriments = models.TextField(_('requeriments'), null=True, blank=True)
    setup = models.TextField(_('setup'), null=True, blank=True)
    notes = models.TextField(_('notes'), null=True, blank=True)
    key_areas = models.TextField(_('key areas'), null=True, blank=True)
    issues = models.CharField(_('issues'), max_length=100, null=True, blank=True)
    important_notes = models.TextField(_('important notes'), null=True, blank=True)
    created_at = models.DateTimeField(_('created date'), auto_now_add=True, blank=True)
    modified_at = models.DateTimeField(_('modified date'), auto_now=True, blank=True)
    def __unicode__(self):
        return self.charter_id + ' - ' + self.name
    class Meta:
        verbose_name = _('Charter')

