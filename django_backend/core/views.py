from django.shortcuts import render
from .models import *
from rest_framework.views import APIView
from .serializers import *
from rest_framework import viewsets, permissions, mixins, generics, filters
# Create your views here.
from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK
)
from rest_framework.response import Response
from rest_framework.views import APIView
import json


class ProductInfoView(generics.ListAPIView):
    serializer_class = ProductQuerySerializer
    queryset = Product.objects.all()

    def post(self, request, *args, **kwargs):
        category_name = request.POST.get('category')
        sub_category_name = request.POST.get('sub_category')
        try:
            # category_obj = Category.objects.get(name=category_name)
            # sub_category_obj = subCategory.objects.get(name=sub_category_name)
            products = Product.objects.filter(category=category_name, sub_category=sub_category_name)
            products_dict = {}
            for i in range(len(products)):
                product_serializer = ProductSerializer(products[i])
                products_dict[i+1] = product_serializer.data
            return Response(products_dict, status=HTTP_200_OK)
        except:
            return Response({'status':'fail', 'detail':'Category or Sub Category Incorrect!'}, status=HTTP_200_OK)
