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
    list_display_links = ('tester', )

class LabelResource(resources.ModelResource):
    class Meta:
        model = Label
    pass

class LabelAdmin(ImportExportModelAdmin, admin.ModelAdmin):
    resources = LabelResource

class ProductResource(resources.ModelResource):
    class Meta:
        model = Product
    pass

class ProductAdmin(ImportExportModelAdmin, admin.ModelAdmin):
    resources = ProductResource
    list_display = ('name', 'project')

class IssueResource(resources.ModelResource):
    class Meta:
        model = Issue
    pass

class IssueAdmin(ImportExportModelAdmin, admin.ModelAdmin):
    resources = IssueResource

# Register your models here.
admin.site.register(Sessao, SessaoAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(Label, LabelAdmin)
admin.site.register(Issue, IssueAdmin)