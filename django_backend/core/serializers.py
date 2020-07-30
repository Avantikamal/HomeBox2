from .models import *
from rest_framework import serializers
from django.contrib.auth import get_user_model, authenticate
from django.conf import settings
from django.contrib.auth.forms import PasswordResetForm, SetPasswordForm
from django.contrib.auth.tokens import default_token_generator
from django.utils.http import urlsafe_base64_decode as uid_decoder
from django.utils.translation import ugettext_lazy as _
from django.utils.encoding import force_text
from django.contrib.auth import get_user_model
from django.contrib.auth import password_validation
from rest_framework import serializers, exceptions
from rest_framework.exceptions import ValidationError
from rest_framework.validators import UniqueValidator
import sys
from django.core import exceptions
import django.contrib.auth.password_validation as validators
from django.contrib.auth.hashers import make_password
from random import randint
User = get_user_model()


# class UserRegistrationSerializer(serializers.ModelSerializer):
#     mobile = serializers.CharField(required=True,validators=[UniqueValidator(queryset=User.objects.all())])
#     password = serializers.CharField(min_length=4, max_length=100,write_only=True)

#     class Meta:
#         model = User
#         fields = ("id", "mobile", "password", "otp")

#     def create(self, validated_data):
#         password = User.objects.make_random_password()
#         user = super(UserRegistrationSerializer, self).create(validated_data)
#         user.set_password(password)

#         def random_with_N_digits(n):
#             range_start = 10**(n-1)
#             range_end = (10**n)-1
#             return randint(range_start, range_end)

#         otp = random_with_N_digits(6)
#         user.otp = otp
#         user.save()
#         print(otp)
#         return user

    # def validate(self, attrs):
    #     # get the password from the data
    #     password = attrs.get('password')

    #     errors = dict() 
    #     try:
    #         # validate the password and catch the exception
    #         validators.validate_password(password=password)

    #     # the exception raised here is different than serializers.ValidationError
    #     except exceptions.ValidationError as e:
    #         errors['password'] = list(e.messages)

    #     if errors:
    #         raise serializers.ValidationError(errors)

    #     if attrs.get('password') != attrs.get('confirm_password'):
    #         raise serializers.ValidationError("Those passwords don't match.")
    #     return super(UserRegistrationSerializer, self).validate(attrs)
        

class CustomTokenSerializer(serializers.Serializer):
    token = serializers.CharField()


class PriceSizeSerializer(serializers.ModelSerializer):

    class Meta:
        model = PriceSize
        fields = "__all__"


class ProductSerializer(serializers.ModelSerializer):
    category_name = serializers.SerializerMethodField()
    # sub_category_name = serializers.SerializerMethodField()
    price = PriceSizeSerializer(many=True)
    discount_price = PriceSizeSerializer(many=True)

    class Meta:
        model = Product
        fields = ('id', 'title', 'price', 'discount_price', 'category_name', 'description', 'image')

    def get_category_name(self, obj):
        return obj.category.name

    # def get_sub_category_name(self, obj):
    #     return obj.sub_category.name


class ProductQuerySerializer(serializers.ModelSerializer):

    class Meta:
        model = Product
        fields = ('category','sub_category')
