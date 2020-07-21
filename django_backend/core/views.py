from django.shortcuts import render, get_object_or_404
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
from django.views.decorators.csrf import csrf_exempt
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
                # if not user.is_active:
                #     user.is_active = True
            else:
                return Response({'success': False, 'message': 'OTP Expired'})
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


class ProductList(generics.ListAPIView):
    serializer_class = ProductSerializer

    def get_queryset(self):
        category = self.request.query_params.get('category')
        category_obj = Category.objects.get(name=category)
        queryset = Product.objects.filter(category=category_obj)
        return queryset


@csrf_exempt
@api_view(["GET"])
@permission_classes((permissions.IsAuthenticated,))
def add_to_cart(request, pk):
    product = get_object_or_404(Product, pk=pk)
    user_profile = userProfile.objects.get(user=request.user)
    order_item, created = OrderProduct.objects.get_or_create(
        product=product,
        user=user_profile,
        ordered=False
    )
    order_qs = Order.objects.filter(user=user_profile, ordered=False)
    if order_qs.exists():
        order = order_qs[0]
        # check if the order item is in the order
        if order.products.filter(product__id=product.id).exists():
            order_item.quantity += 1
            order_item.save()
            return Response({"success":True, "detail":"Product quantity updated"}, status=HTTP_200_OK)
        else:
            order.products.add(order_item)
            return Response({"success":True, "detail":"Product added to cart"}, status=HTTP_200_OK)
    else:
        ordered_date = timezone.now()
        order = Order.objects.create(
            user=user_profile, ordered_date=ordered_date)
        order.products.add(order_item)
        return Response({"success":True, "detail":"Product added to cart"}, status=HTTP_200_OK)


@csrf_exempt
@api_view(["GET"])
@permission_classes((permissions.IsAuthenticated,))
def remove_from_cart(request, pk):
    product = get_object_or_404(Product, pk=pk)
    user_profile = userProfile.objects.get(user=request.user)
    order_qs = Order.objects.filter(
        user=user_profile,
        ordered=False
    )
    if order_qs.exists():
        order = order_qs[0]
        # check if the order item is in the order
        if order.products.filter(product__id=product.id).exists():
            order_item = OrderProduct.objects.filter(
                product=product,
                user=user_profile,
                ordered=False
            )[0]
            order.products.remove(order_item)
            order_item.delete()
            return Response({"success":True, "detail":"Product removed from cart"}, status=HTTP_200_OK)
        else:
            return Response({"success":False, "detail":"Product not in your cart"}, status=HTTP_200_OK)
    else:
        return Response({"success":False, "detail":"No active orders"}, status=HTTP_200_OK)


@csrf_exempt
@api_view(["GET"])
@permission_classes((permissions.IsAuthenticated,))
def remove_single_item_from_cart(request, pk):
    product = get_object_or_404(Product, pk=pk)
    user_profile = userProfile.objects.get(user=request.user)
    order_qs = Order.objects.filter(
        user=user_profile,
        ordered=False
    )
    if order_qs.exists():
        order = order_qs[0]
        # check if the order item is in the order
        if order.products.filter(product__id=product.id).exists():
            order_item = OrderProduct.objects.filter(
                product=product,
                user=user_profile,
                ordered=False
            )[0]
            if order_item.quantity > 1:
                order_item.quantity -= 1
                order_item.save()
            else:
                order.products.remove(order_item)
            return Response({"success":True, "detail":"Product quantity updated"}, status=HTTP_200_OK)
        else:
            return Response({"success":False, "detail":"Product not in cart"}, status=HTTP_200_OK)
    else:
        return Response({"success":False, "detail":"No active orders"}, status=HTTP_200_OK)
