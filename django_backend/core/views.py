from django.shortcuts import render
from .models import *
from rest_framework.views import APIView
from .serializers import *
from rest_framework import viewsets, permissions, mixins, generics, filters
# Create your views here.
from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK,
    HTTP_201_CREATED
)
from rest_framework.permissions import AllowAny
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.views import APIView
import json
import random
from django.utils import timezone
from datetime import timedelta
from rest_framework.authentication import BasicAuthentication,TokenAuthentication

@api_view(['POST'])
def generate_otp(request):
    mobile = request.data.get('mobile', None)
    if mobile:
        otp = random.randrange(111111, 999999)
        otp_obj = OTP.objects.create(code=otp)
        try:
            user = User.objects.get(mobile=mobile)
            user.otp = otp_obj
            user.save()
        except:
            User.objects.create(mobile=mobile, otp=otp_obj)
        return Response({'success': True, 'detail':'Otp will expire in 10 mins'}, status=HTTP_200_OK)
    else:
        return Response({'success': False, 'detail': 'Fields are wrong'}, status=HTTP_400_BAD_REQUEST)


@api_view(['POST'])
def verify_otp(request):
    mobile = request.data.get('mobile', None)
    otp = request.data.get('otp', None)
    if mobile and otp:
        try:
            otp_obj = OTP.objects.get(code=otp)
            if timezone.now() - otp_obj.created_at < timedelta(minutes=10) and not otp_obj.is_verified:
                otp_obj.is_verified = True
                otp_obj.save()
                user = User.objects.get(mobile=mobile, otp=otp_obj)
            else:
                return Response({'success': False, 'message': 'Invalid OTP'})
        except User.DoesNotExist:
            return Response({'success': False, 'message': 'Invalid OTP'})

        token, _ = Token.objects.get_or_create(user=user)
        return Response({'success': True, 'auth_token': token.key })
    else:
        return Response({'success': False, 'detail': 'Fields are wrong'}, status=HTTP_400_BAD_REQUEST)


class LogoutView(APIView):
    authentication_classes = [TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]

    def get(self, request, format=None):
        request.user.auth_token.delete()
        return Response({'details':'Logout successful'}, status=HTTP_200_OK)


class ProductInfoView(generics.ListAPIView):
    # PERMISSION_CLASSES = ('AllowAny',)
    serializer_class = ProductQuerySerializer
    queryset = Product.objects.all()

    def post(self, request, *args, **kwargs):
        try:
            category_name = request.data['category']
            sub_category_name = request.data['sub_category']
            category_obj = Category.objects.get(id=category_name)
            sub_category_obj = subCategory.objects.get(id=sub_category_name)
            products = Product.objects.filter(category=category_obj, sub_category=sub_category_obj)
            products_dict = {}
            for i in range(len(products)):
                product_serializer = ProductSerializer(products[i])
                products_dict[i+1] = product_serializer.data
            return Response(products_dict, status=HTTP_200_OK)
        except:
            return Response({'status':'fail', 'detail':'Category or Sub Category Incorrect!'}, status=HTTP_200_OK)
