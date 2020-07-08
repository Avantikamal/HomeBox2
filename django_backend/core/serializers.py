from rest_framework import serializers
from .models import *


class ProductSerializer(serializers.ModelSerializer):
    category_name = serializers.SerializerMethodField()
    sub_category_name = serializers.SerializerMethodField()

    class Meta:
        model = Product
        fields = ('title','price','discount_price','category_name','sub_category_name','description','image')

    def get_category_name(self, obj):
        return obj.category.name

    def get_sub_category_name(self, obj):
        return obj.sub_category.name


class ProductQuerySerializer(serializers.ModelSerializer):

    class Meta:
        model = Product
        fields = ('category','sub_category')
