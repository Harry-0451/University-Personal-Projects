# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib import admin
from .models import Stock
from .models import Prediction

admin.site.register(Stock)
admin.site.register(Prediction)
# Register your models here.
