from import_export import resources
from import_export.admin import ImportExportModelAdmin
from django.contrib import admin
from django.forms import ModelForm
from suit.widgets import NumberInput
from charters.models import Charter

class CharterForm(ModelForm):
    class Meta:
        widgets = {
            'min_time': NumberInput,
            'max_time': NumberInput,
        }

class CharterResource(resources.ModelResource):
    class Meta:
        model = Charter

class CharterAdmin(ImportExportModelAdmin, admin.ModelAdmin):
    resource_class = CharterResource
    list_display = ['charter_id', 'name', 'objective', 'min_time', 'max_time']
    pass

# Register your models here.
admin.site.register(Charter, CharterAdmin)