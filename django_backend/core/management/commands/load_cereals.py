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
        wb = xlrd.open_workbook('data/Cereals price list.xlsx') 
        sheet = wb.sheet_by_index(0)   
        category, _ = Category.objects.get_or_create(name="Cereals")      
        for i in range(5,30):
            try:
                title = sheet.cell_value(i,1).strip()
                try:
                    price_size_1, _ = PriceSize.objects.get_or_create(price=float(sheet.cell_value(i,5)), size="500 grm")
                    price_size_2, _ = PriceSize.objects.get_or_create(price=float(sheet.cell_value(i,6)), size="1 kg")
                    product, _ = Product.objects.get_or_create(title=title, category=category)
                    product.price.add(price_size_1)
                    product.price.add(price_size_2)
                except:
                    price_size_2, _ = PriceSize.objects.get_or_create(price=float(sheet.cell_value(i,6)), size="1 kg")
                    product, _ = Product.objects.get_or_create(title=title, category=category)
                    product.price.add(price_size_2)
            except:
                print("Error occured")