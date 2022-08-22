from . import dash
from . import recomgraphs
from django.urls import path
from . import views

urlpatterns = [
    # /sas/
    path('', views.home, name='home'),
    # /sas/TSLA/
    path('<stock_ticker>/', views.details, name='details'),

    path('<stock_ticker>/recommendation/', views.recommendation, name='recommendation'),

    path('<stock_ticker>/rec/', views.load_recommendation, name='rec'),

]
