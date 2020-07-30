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
        wb = xlrd.open_workbook('data/Pulses & Beans Price List.xlsx') 
        sheet = wb.sheet_by_index(0)   
        category, _ = Category.objects.get_or_create(name="Pulses & Beans") 
        # ctr = 0     
        for i in range(6,39):
            try:
                title = sheet.cell_value(i,1).strip()
                if title != '':
                    product, _ = Product.objects.get_or_create(title=title, category=category)
                    try:
                        price_size_1, _ = PriceSize.objects.get_or_create(price=float(sheet.cell_value(i,6)), size="500 grm")
                        product.price.add(price_size_1)
                    except:
                        pass
                    try:
                        price_size_2, _ = PriceSize.objects.get_or_create(price=float(sheet.cell_value(i,7)), size="1 kg")
                        product.price.add(price_size_2)
                    except:
                        pass
                    # try:
                    #     price_size_3, _ = PriceSize.objects.get_or_create(price=float(sheet.cell_value(i,6)), size="200 grm")
                    #     product.price.add(price_size_1)
                    # except:
                    #     pass
                    # try:
                    #     price_size_4, _ = PriceSize.objects.get_or_create(price=float(sheet.cell_value(i,7)), size="500 grm")
                    #     product.price.add(price_size_1)
                    # except:
                    #     pass
                # ctr += 1
                # print(ctr)
            except:
                print("Error occured")