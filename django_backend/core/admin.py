from django.contrib import admin
from .models import *
# Register your models here.

admin.site.register(User)
admin.site.register(userProfile)
admin.site.register(Category)
admin.site.register(subCategory)
admin.site.register(Vendor)
admin.site.register(Product)
admin.site.register(Address)
admin.site.register(OTP)
admin.site.register(OrderProduct)
admin.site.register(Order)
admin.site.register(PriceSize)