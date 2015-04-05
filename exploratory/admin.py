from import_export.admin import ImportExportModelAdmin
from import_export import resources
from django.contrib import admin
from django.shortcuts import render_to_response
from django.template import RequestContext
from exploratory.models import Sessao, Product, Label, Issue
from django.conf.urls import url
from charters.models import Charter

class SessaoResource(resources.ModelResource):
    class Meta:
        model = Sessao
    pass

class SessaoAdmin(ImportExportModelAdmin, admin.ModelAdmin):
    details_template = 'sessions.html'
    resources = SessaoResource
    fields = ('tester', 'duration', 'product', 'charter')
    search_fields = ('tester', 'charter', 'comments')
    list_filter = ('tester', )
    list_display = ('tester', 'charter', 'product', 'comments', 'details_link')
    list_display_links = ('tester', 'details_link', )

    def get_urls(self):
        urls = super(SessaoAdmin, self).get_urls()
        my_urls = [
            url(r'^(?P<id>\d+)/details/$', self.admin_site.admin_view(self.details))
        ]
        return my_urls + urls

    def details(self, request, id):
        entry = Sessao.objects.get(pk=id)
        c = Charter.objects.get(pk=entry.charter.charter_id)

        return render_to_response(self.details_template, {
            'entry': entry,
            'charter': c,
            # 'opts': self.model._meta,
            # 'root_path': self.admin_site.root_path,
            # 'title': 'Review entry: %s' % entry.title,
        }, context_instance=RequestContext(request))

    def details_link(self, obj):
        return u'<a href="%s/details/">start</a>' % obj.id
    details_link.allow_tags = True
    details_link.short_description = "active"

    def get_charter_id(self, obj):
        return obj.charter.charter_id

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