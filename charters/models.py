from django.db import models

# Create your models here.
class Charter(models.Model):
    charter_id = models.CharField(max_length=20, primary_key=True)
    name = models.CharField(max_length=100)
    objective = models.CharField(max_length=100)
    min_time = models.IntegerField()
    max_time = models.IntegerField()
    requeriments = models.TextField(null=True)
    setup = models.TextField(null=True)
    notes = models.TextField(null=True)
    key_areas = models.TextField(null=True)
    issues = models.CharField(max_length=100, null=True)
    important_notes = models.TextField(null=True)
    created_at = models.DateTimeField(auto_now_add  = True)
    modified_at = models.DateTimeField(auto_now = True)
    def __unicode__(self):
        return self.name