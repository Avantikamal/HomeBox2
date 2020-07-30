import sys
import random
from datetime import date, timedelta, datetime
from django.core.management.base import BaseCommand
from django.db.models.base import ObjectDoesNotExist

from ...models import Product, Category, PriceSize
import xlrd

class Command(BaseCommand):
    help = 'Populate cereals data.'

    def handle(self, *args, **options):
        wb = xlrd.open_workbook('data/Earthen Wares.xlsx') 
        sheet = wb.sheet_by_index(0)   
        category, _ = Category.objects.get_or_create(name="Earthen Wares")      
        for i in range(5,23):
            try:
                title = sheet.cell_value(i,1).strip()
                price_size_1, _ = PriceSize.objects.get_or_create(price=float(sheet.cell_value(i,4)), size=sheet.cell_value(i,6))
                # print(sheet.cell_value(i,0),title,category,price_size_1)
                product, _ = Product.objects.get_or_create(title=title, category=category)
                product.price.add(price_size_1)
            except:
                print("Error occured")