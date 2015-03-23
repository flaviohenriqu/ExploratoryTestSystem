from django.contrib import admin
from exploratory.models import Sessao

class SessaoAdmin(admin.ModelAdmin):
    search_fields = ('tester', 'charter', 'comments')
    list_display = ('tester', 'charter', 'product', 'comments')

# Register your models here.
admin.site.register(Sessao, SessaoAdmin)