from import_export.admin import ImportExportModelAdmin
from import_export import resources
from django.contrib import admin
from exploratory.models import Sessao, Product, Label, Issue

class SessaoResource(resources.ModelResource):
    class Meta:
        model = Sessao
    pass

class SessaoAdmin(ImportExportModelAdmin, admin.ModelAdmin):
    resources = SessaoResource
    fields = ('tester', 'duration', 'product', 'charter')
    search_fields = ('tester', 'charter', 'comments')
    list_filter = ('tester', )
    list_display = ('tester', 'charter', 'product', 'comments')

# Register your models here.
admin.site.register(Sessao, SessaoAdmin)
admin.site.register(Product)
admin.site.register(Label)
admin.site.register(Issue)