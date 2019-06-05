
from django.urls import path, include
from .router import router
from django.views.generic.base import TemplateView # new

urlpatterns = [
    path('', include(router.urls)),
]